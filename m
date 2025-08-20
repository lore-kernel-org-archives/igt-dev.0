Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FE3CA0EDC
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 04:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C523710E134;
	Wed, 20 Aug 2025 04:16:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7854210E134;
 Wed, 20 Aug 2025 04:16:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2900467651644829928=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Convert_kms=5F3d_into_su?=
 =?utf-8?q?btest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 20 Aug 2025 04:16:09 -0000
Message-ID: <175566336946.250473.13965416509169453641@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
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

--===============2900467651644829928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Convert kms_3d into subtest
URL   : https://patchwork.freedesktop.org/series/153155/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_17032_full -> IGTPW_13600_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13600_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13600_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/index.html

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13600_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@forcewake:
    - shard-tglu:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-3/igt@i915_suspend@forcewake.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-2/igt@i915_suspend@forcewake.html

  
New tests
---------

  New tests have been introduced between CI_DRM_17032_full and IGTPW_13600_full:

### New IGT tests (1) ###

  * igt@kms_3d@basic:
    - Statuses : 5 pass(s)
    - Exec time: [1.42, 3.46] s

  

Known issues
------------

  Here are the changes found in IGTPW_13600_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#8411])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-12/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#8411]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@gem_bad_reloc@negative-reloc-bltcopy:
    - shard-dg2-9:        NOTRUN -> [SKIP][6] ([i915#3281]) +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_bad_reloc@negative-reloc-bltcopy.html

  * igt@gem_caching@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#4873])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@gem_caching@reads.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][10] ([i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#8562])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-9/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [PASS][12] -> [FAIL][13] ([i915#9561]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-2/igt@gem_ctx_freq@sysfs@gt0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-dg2:          [PASS][14] -> [ABORT][15] ([i915#8213]) +1 other test abort
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-4/igt@gem_ctx_isolation@preservation-s3.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-10/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [PASS][16] -> [INCOMPLETE][17] ([i915#12353])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-glk9/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8555])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2-9:        NOTRUN -> [SKIP][19] ([i915#8555])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#14544] / [i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@gem_ctx_sseu@invalid-args.html
    - shard-dg2-9:        NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][25] -> [FAIL][26] ([i915#5784])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-12/igt@gem_eio@reset-stress.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4771])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#4036])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#8555]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#4525])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#4525])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][32] ([i915#6334]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk6/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4812]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4812])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-6/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#3539] / [i915#4852])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-13/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][37] ([i915#3539] / [i915#4852])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#5107])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-2/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3281]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3281]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-14/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3281]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#3281]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@gem_exec_reloc@basic-write-wc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2-9:        NOTRUN -> [SKIP][43] ([i915#4537] / [i915#4812])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4860]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2-9:        NOTRUN -> [SKIP][45] ([i915#4860]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4860])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][47] ([i915#4613])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][48] ([i915#4613]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4613]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#4613]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][51] ([i915#4613]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][52] -> [TIMEOUT][53] ([i915#5493]) +1 other test timeout
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#3282]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_media_vme:
    - shard-tglu-1:       NOTRUN -> [SKIP][55] ([i915#284])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4077])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@gem_mmap_gtt@basic-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4077]) +8 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2-9:        NOTRUN -> [SKIP][58] ([i915#4077]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@close:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4083]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@gem_mmap_wc@close.html
    - shard-dg2-9:        NOTRUN -> [SKIP][60] ([i915#4083]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4083])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@gem_mmap_wc@read-write.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4083])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg2-9:        NOTRUN -> [SKIP][63] ([i915#3282]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3282])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3282])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-13/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#14544] / [i915#3282])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3282]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][68] ([i915#2658])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#13398])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4270]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][71] ([i915#12917] / [i915#12964]) +1 other test timeout
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4270])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          [PASS][73] -> [TIMEOUT][74] ([i915#12917] / [i915#12964])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg2-9:        NOTRUN -> [SKIP][75] ([i915#4270])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#5190] / [i915#8428]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][77] ([i915#5190] / [i915#8428]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#8428]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4077]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-14/igt@gem_tiled_blits@basic.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3297])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-dg2-9:        NOTRUN -> [SKIP][82] ([i915#3297])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2-9:        NOTRUN -> [SKIP][83] ([i915#3282] / [i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3297] / [i915#4880])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2-9:        NOTRUN -> [SKIP][85] ([i915#3297] / [i915#4880])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3281] / [i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#3297])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@gem_userptr_blits@unsync-overlap.html
    - shard-tglu-1:       NOTRUN -> [SKIP][88] ([i915#3297])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#2527])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-18/igt@gen9_exec_parse@allowed-single.html
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#2856])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#2527] / [i915#2856]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-2/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#2527] / [i915#2856])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#2856]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gen9_exec_parse@bb-start-out.html
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#2527])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-dg2-9:        NOTRUN -> [SKIP][95] ([i915#2856]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gen9_exec_parse@unaligned-jump.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#14544] / [i915#2527]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#14123])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@virtual-busy-hang:
    - shard-snb:          NOTRUN -> [SKIP][98] +27 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-snb5/igt@i915_drm_fdinfo@virtual-busy-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#14118])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@i915_drm_fdinfo@virtual-busy-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#14118])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-5/igt@i915_drm_fdinfo@virtual-busy-hang.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#14118]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@i915_drm_fdinfo@virtual-busy-idle-all.html
    - shard-dg2-9:        NOTRUN -> [SKIP][102] ([i915#14118])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg1:          [PASS][103] -> [DMESG-WARN][104] ([i915#13029] / [i915#14545])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-17/igt@i915_module_load@reload-no-display.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-14/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#7178])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#6412])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#8399])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][108] ([i915#13790] / [i915#2681]) +1 other test warn
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#11681] / [i915#6621])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2-9:        NOTRUN -> [SKIP][110] ([i915#11681])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#11681])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#8437])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][113] ([i915#6245])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [PASS][114] -> [DMESG-FAIL][115] ([i915#12061]) +1 other test dmesg-fail
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-7/igt@i915_selftest@live@workarounds.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-2/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][116] ([i915#4817])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk6/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@sysfs-reader:
    - shard-dg2:          NOTRUN -> [ABORT][117] ([i915#8213])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-10/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#7707])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-9/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#7707])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#4212])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-dg2:          [PASS][121] -> [FAIL][122] ([i915#13320])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][123] ([i915#12518])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][124] ([i915#12761]) +1 other test incomplete
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#9531])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#9531])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#1769] / [i915#3555])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-19/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#5286])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#5286]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#5286]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][131] -> [FAIL][132] ([i915#5138])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538] / [i915#5286])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][134] +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#3638])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-12/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][136] +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#6187])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-9:        NOTRUN -> [SKIP][138] ([i915#5190])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#5190]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5190]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-dg2-9:        NOTRUN -> [SKIP][141] ([i915#4538] / [i915#5190]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][142] +8 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#6095]) +135 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][144] ([i915#10307] / [i915#6095]) +19 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#6095]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#14098] / [i915#6095]) +48 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#12313]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#12313]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][149] +482 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#12805])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#6095]) +16 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][152] ([i915#12796])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#10307] / [i915#6095]) +155 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#6095]) +44 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#6095]) +34 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#6095]) +51 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#13781]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#13783]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2-9:        NOTRUN -> [SKIP][160] ([i915#11151] / [i915#7828]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#11151] / [i915#7828]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#11151] / [i915#7828]) +7 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#11151] / [i915#7828]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#11151] / [i915#7828]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#11151] / [i915#7828]) +6 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#11151] / [i915#7828]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@ctm-0-50:
    - shard-rkl:          [PASS][167] -> [SKIP][168] ([i915#12655] / [i915#14544]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_color@ctm-0-50.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_color@ctm-0-50.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-9:        NOTRUN -> [SKIP][169] ([i915#9424]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [FAIL][170] ([i915#7173]) +2 other tests fail
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-2/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#8814])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#3555]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#13049]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [PASS][175] -> [FAIL][176] ([i915#13566]) +3 other tests fail
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#3555]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#13049]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#3555]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-12/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#13049])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][181] ([i915#12964]) +7 other tests dmesg-warn
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-rkl:          [PASS][182] -> [FAIL][183] ([i915#13566]) +1 other test fail
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#13049]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][185] ([i915#13566]) +3 other tests fail
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-dg2-9:        NOTRUN -> [SKIP][186] ([i915#13046] / [i915#5354]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#4103]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-rkl:          [PASS][188] -> [SKIP][189] ([i915#11190] / [i915#14544]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#14544]) +6 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#9809])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#13046] / [i915#5354]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-tglu:         [PASS][193] -> [FAIL][194] ([i915#2346])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#4103])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#1769] / [i915#3555] / [i915#3804])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3804])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#3804])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#13749])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-9:        NOTRUN -> [SKIP][200] ([i915#13748])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#13707])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#13707])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#8812])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2-9:        NOTRUN -> [SKIP][204] ([i915#8812])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3840])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3840])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#3555] / [i915#3840])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#1839])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#1839]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#1839])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#658])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_feature_discovery@psr2.html
    - shard-dg2-9:        NOTRUN -> [SKIP][212] ([i915#658])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#3637] / [i915#9934]) +8 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#3637] / [i915#9934]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#9934])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#9934]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][217] ([i915#3637] / [i915#9934]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-glk:          [PASS][218] -> [SKIP][219] +5 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-glk1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#9934])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg2-9:        NOTRUN -> [SKIP][221] ([i915#9934]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#14544] / [i915#9934])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#9934]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][224] -> [SKIP][225] ([i915#14544] / [i915#3637]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#14544] / [i915#3637])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][227] ([i915#12745] / [i915#4839] / [i915#6113])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][228] ([i915#12745])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
    - shard-rkl:          NOTRUN -> [INCOMPLETE][229] ([i915#6113])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-tglu:         NOTRUN -> [FAIL][230] ([i915#14600]) +1 other test fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][231] ([i915#2672] / [i915#3555])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][232] ([i915#2672]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#2672]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][235] ([i915#2587] / [i915#2672] / [i915#3555])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#2587] / [i915#2672])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][237] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#2587] / [i915#2672] / [i915#3555])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#2587] / [i915#2672] / [i915#3555])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#2587] / [i915#2672])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#2587] / [i915#2672]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-rkl:          [PASS][244] -> [SKIP][245] ([i915#14544] / [i915#3555])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#2672] / [i915#3555]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#2672]) +7 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][248] ([i915#5354]) +11 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#8708]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-rkl:          [PASS][250] -> [SKIP][251] ([i915#14544] / [i915#1849] / [i915#5354]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][252] ([i915#10056])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#3023]) +10 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][254] +14 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][255] ([i915#8708]) +7 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#8708]) +10 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#1825]) +14 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][258] +36 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#8708]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][260] +61 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#1825]) +9 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#3458]) +10 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-9:        NOTRUN -> [SKIP][263] ([i915#3458]) +7 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#10433] / [i915#3458]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#14544] / [i915#1849] / [i915#5354]) +4 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#3458]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#5354]) +18 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#3555] / [i915#8228])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#3555] / [i915#8228])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_hdr@static-swap.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-rkl:          [PASS][270] -> [SKIP][271] ([i915#14544] / [i915#3555] / [i915#8826]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_invalid_mode@uint-max-clock.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#12394])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-13/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][273] ([i915#13688])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#10656])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#13522])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_lease@lease-invalid-plane:
    - shard-rkl:          [PASS][276] -> [SKIP][277] ([i915#14544]) +29 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_lease@lease-invalid-plane.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_lease@lease-invalid-plane.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2-9:        NOTRUN -> [SKIP][278] ([i915#6301])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg2:          NOTRUN -> [SKIP][279] +11 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][280] ([i915#13026]) +1 other test incomplete
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-rkl:          [PASS][281] -> [SKIP][282] ([i915#14544] / [i915#8825]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_plane@plane-panning-top-left.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-rkl:          [PASS][283] -> [SKIP][284] ([i915#14544] / [i915#7294]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#13958])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#13958])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#14259])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#14259])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-14/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#14259])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#14259])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#12247]) +9 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#12247]) +4 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#12247]) +4 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#12247]) +6 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#12247] / [i915#14544]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#12247] / [i915#14544] / [i915#8152]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-rkl:          [PASS][298] -> [SKIP][299] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#6953] / [i915#8152])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-rkl:          [PASS][300] -> [SKIP][301] ([i915#12247] / [i915#14544])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-rkl:          [PASS][302] -> [SKIP][303] ([i915#12247] / [i915#14544] / [i915#8152])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#12343])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#4281])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-rkl:          [PASS][306] -> [SKIP][307] ([i915#14544] / [i915#1849])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_pm_rpm@cursor-dpms.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [PASS][308] -> [DMESG-WARN][309] ([i915#4423]) +1 other test dmesg-warn
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-19/igt@kms_pm_rpm@i2c.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#9519])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          [PASS][311] -> [INCOMPLETE][312] ([i915#10553])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk9/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#6524])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#6524] / [i915#6805])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-6/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#11520]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#11520]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#9808]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#12316]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#11520]) +4 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-9:        NOTRUN -> [SKIP][320] ([i915#11520]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#11520]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][322] ([i915#11520]) +13 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#11520]) +7 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][324] ([i915#11520]) +6 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk10/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#9683])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#9683])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#9688]) +9 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][328] ([i915#1072] / [i915#9732]) +10 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#1072] / [i915#9732]) +10 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][330] ([i915#9732]) +9 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#1072] / [i915#9732]) +19 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][332] ([i915#1072] / [i915#9732]) +5 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-19/igt@kms_psr@psr-sprite-mmap-cpu.html
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#9732]) +13 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-9:        NOTRUN -> [SKIP][335] ([i915#12755])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#4235])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#5289])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#12755])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-9:        NOTRUN -> [SKIP][339] ([i915#3555]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][340] ([i915#13179]) +1 other test abort
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk6/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][341] ([i915#8623])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][342] -> [FAIL][343] ([i915#9196]) +1 other test fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@query-forked-hang:
    - shard-glk10:        NOTRUN -> [SKIP][344] +256 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk10/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][345] ([i915#12276]) +1 other test incomplete
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#3555]) +4 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-dg2-9:        NOTRUN -> [SKIP][347] ([i915#11920])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#9906])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#8808] / [i915#9906])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#9906])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#2437]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-9/igt@kms_writeback@writeback-fb-id.html
    - shard-dg2-9:        NOTRUN -> [SKIP][352] ([i915#2437])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@global-sseu-config-invalid:
    - shard-mtlp:         NOTRUN -> [SKIP][353] ([i915#7387])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@perf@global-sseu-config-invalid.html

  * igt@perf@mi-rpc:
    - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#2434])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@perf@mi-rpc.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [PASS][355] -> [DMESG-WARN][356] ([i915#12964]) +43 other tests dmesg-warn
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@perf@polling@0-rcs0.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#8516])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-rkl:          [PASS][358] -> [SKIP][359] ([i915#14544] / [i915#3708])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@prime_vgem@basic-fence-flip.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#3708] / [i915#4077])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-5/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#3708] / [i915#4077])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-13/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#3291] / [i915#3708])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@prime_vgem@basic-read.html
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#3291] / [i915#3708])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - shard-mtlp:         NOTRUN -> [SKIP][364] ([i915#10216] / [i915#3708])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg2-9:        NOTRUN -> [SKIP][365] ([i915#3708])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#9917])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-rkl:          [SKIP][367] ([i915#14544] / [i915#2582]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@fbdev@unaligned-write.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@fbdev@unaligned-write.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][369] ([i915#11713] / [i915#14756]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-7/igt@gem_exec_big@single.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@gem_exec_big@single.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][371] ([i915#5493]) -> [PASS][372] +1 other test pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][373] ([i915#14809]) -> [PASS][374] +1 other test pass
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-rkl:          [TIMEOUT][375] ([i915#12917] / [i915#12964]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_softpin@noreloc-s3:
    - shard-snb:          [ABORT][377] -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-snb7/igt@gem_softpin@noreloc-s3.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-snb7/igt@gem_softpin@noreloc-s3.html
    - shard-tglu:         [ABORT][379] -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-5/igt@gem_softpin@noreloc-s3.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [INCOMPLETE][381] ([i915#13356]) -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [DMESG-WARN][383] ([i915#13029] / [i915#14545]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-5/igt@i915_module_load@reload-no-display.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-rkl:          [SKIP][385] ([i915#13328]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@i915_pm_rpm@gem-pread.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [DMESG-FAIL][387] ([i915#12061]) -> [PASS][388] +1 other test pass
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-2/igt@i915_selftest@live@workarounds.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-3/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [INCOMPLETE][389] ([i915#4817]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [INCOMPLETE][391] ([i915#4817]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-glk8/igt@i915_suspend@sysfs-reader.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk5/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color@gamma:
    - shard-rkl:          [SKIP][393] ([i915#12655] / [i915#14544]) -> [PASS][394] +1 other test pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_color@gamma.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_color@gamma.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][395] ([i915#13566]) -> [PASS][396] +1 other test pass
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-tglu:         [FAIL][397] ([i915#13566]) -> [PASS][398] +3 other tests pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][399] ([i915#13566]) -> [PASS][400] +2 other tests pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-1/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-3/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][401] ([i915#11190] / [i915#14544]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [FAIL][403] ([i915#2346]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-rkl:          [SKIP][405] ([i915#14544] / [i915#14553]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-rkl:          [SKIP][407] ([i915#14544] / [i915#3637]) -> [PASS][408] +3 other tests pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
    - shard-snb:          [DMESG-WARN][409] ([i915#13899]) -> [PASS][410] +1 other test pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-snb6/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-tglu:         [FAIL][411] ([i915#14600]) -> [PASS][412] +1 other test pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-vga1:
    - shard-snb:          [FAIL][413] ([i915#14600]) -> [PASS][414] +1 other test pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-snb6/igt@kms_flip@wf_vblank-ts-check@a-vga1.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-snb4/igt@kms_flip@wf_vblank-ts-check@a-vga1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-rkl:          [SKIP][415] ([i915#14544] / [i915#3555]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][417] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][418] +7 other tests pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-glk:          [SKIP][419] -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          [SKIP][421] ([i915#3555] / [i915#8228]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-3/igt@kms_hdr@bpc-switch-suspend.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-rkl:          [SKIP][423] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_invalid_mode@int-max-clock.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [SKIP][425] ([i915#12388]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * {igt@kms_pipe_stress@stress-xrgb8888-xtiled}:
    - shard-rkl:          [SKIP][427] ([i915#14544]) -> [PASS][428] +56 other tests pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_plane@plane-position-covered:
    - shard-rkl:          [SKIP][429] ([i915#14544] / [i915#8825]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane@plane-position-covered.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-rkl:          [SKIP][431] ([i915#14544] / [i915#7294]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-max.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:
    - shard-mtlp:         [ABORT][433] -> [PASS][434] +1 other test pass
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-rkl:          [SKIP][435] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - shard-rkl:          [SKIP][437] ([i915#12247] / [i915#14544]) -> [PASS][438] +1 other test pass
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b:
    - shard-rkl:          [SKIP][439] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-rkl:          [SKIP][441] ([i915#13441] / [i915#14544]) -> [PASS][442]
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-negative.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][443] ([i915#9519]) -> [PASS][444] +2 other tests pass
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][445] ([i915#14544] / [i915#9519]) -> [PASS][446] +1 other test pass
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][447] ([i915#9519]) -> [PASS][448] +2 other tests pass
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-rkl:          [SKIP][449] ([i915#11521] / [i915#14544]) -> [PASS][450] +2 other tests pass
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr@psr2-dpms:
    - shard-mtlp:         [FAIL][451] -> [PASS][452] +1 other test pass
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-1/igt@kms_psr@psr2-dpms.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@kms_psr@psr2-dpms.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-2:
    - shard-rkl:          [FAIL][453] ([i915#5465]) -> [PASS][454] +2 other tests pass
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-tglu:         [FAIL][455] ([i915#10538]) -> [PASS][456]
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-10/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf_pmu@rc6:
    - shard-rkl:          [DMESG-WARN][457] ([i915#12964]) -> [PASS][458] +28 other tests pass
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@perf_pmu@rc6.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@perf_pmu@rc6.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt0:
    - shard-rkl:          [SKIP][459] -> [PASS][460]
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@perf_pmu@rc6@runtime-pm-long-gt0.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@perf_pmu@rc6@runtime-pm-long-gt0.html

  
#### Warnings ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][461] ([i915#11078]) -> [SKIP][462] ([i915#11078] / [i915#14544])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          [SKIP][463] ([i915#14544] / [i915#7697]) -> [SKIP][464] ([i915#7697])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_basic@multigpu-create-close.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][465] ([i915#9323]) -> [SKIP][466] ([i915#14544] / [i915#9323])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          [SKIP][467] ([i915#14544] / [i915#280]) -> [SKIP][468] ([i915#280])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_ctx_sseu@engines.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          [SKIP][469] ([i915#14544] / [i915#4525]) -> [SKIP][470] ([i915#4525]) +1 other test skip
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          [SKIP][471] ([i915#6334]) -> [SKIP][472] ([i915#14544] / [i915#6334]) +1 other test skip
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@gem_exec_capture@capture-invisible@smem0.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          [SKIP][473] ([i915#14544] / [i915#6344]) -> [SKIP][474] ([i915#6344])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [SKIP][475] ([i915#3281]) -> [SKIP][476] ([i915#14544] / [i915#3281]) +10 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-cpu.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][477] ([i915#14544] / [i915#3281]) -> [SKIP][478] ([i915#3281]) +6 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          [SKIP][479] ([i915#4613] / [i915#7582]) -> [SKIP][480] ([i915#14544] / [i915#4613] / [i915#7582])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          [SKIP][481] ([i915#14544] / [i915#4613]) -> [SKIP][482] ([i915#4613])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          [SKIP][483] ([i915#4613]) -> [SKIP][484] ([i915#14544] / [i915#4613])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@gem_lmem_swapping@verify-random.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-rkl:          [SKIP][485] ([i915#14544] / [i915#284]) -> [SKIP][486] ([i915#284])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_media_vme.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@gem_media_vme.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [SKIP][487] ([i915#3282]) -> [SKIP][488] ([i915#14544] / [i915#3282]) +4 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          [SKIP][489] ([i915#14544] / [i915#3282]) -> [SKIP][490] ([i915#3282]) +6 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          [SKIP][491] ([i915#14544] / [i915#8411]) -> [SKIP][492] ([i915#8411])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          [SKIP][493] ([i915#3297] / [i915#3323]) -> [SKIP][494] ([i915#14544] / [i915#3297] / [i915#3323])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          [SKIP][495] ([i915#14544] / [i915#3297]) -> [SKIP][496] ([i915#3297])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-rkl:          [SKIP][497] ([i915#14544] / [i915#2527]) -> [SKIP][498] ([i915#2527]) +3 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-rkl:          [SKIP][499] ([i915#2527]) -> [SKIP][500] ([i915#14544] / [i915#2527])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@gen9_exec_parse@unaligned-jump.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          [SKIP][501] ([i915#6590]) -> [SKIP][502] ([i915#14544] / [i915#6590]) +1 other test skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          [SKIP][503] ([i915#14498]) -> [SKIP][504] ([i915#14498] / [i915#14544])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          [SKIP][505] ([i915#14544] / [i915#6245]) -> [SKIP][506] ([i915#6245])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@i915_query@hwconfig_table.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][507] ([i915#14544] / [i915#5723]) -> [SKIP][508] ([i915#5723])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          [SKIP][509] ([i915#7707]) -> [SKIP][510] ([i915#14544] / [i915#7707])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@intel_hwmon@hwmon-read.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][511] ([i915#12761]) -> [SKIP][512] ([i915#14544])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-rkl:          [SKIP][513] ([i915#5286]) -> [SKIP][514] ([i915#14544]) +3 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][515] ([i915#14544]) -> [SKIP][516] ([i915#5286]) +6 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg1:          [SKIP][517] ([i915#3638] / [i915#4423]) -> [SKIP][518] ([i915#3638])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-18/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][519] ([i915#14544]) -> [SKIP][520] ([i915#3638]) +2 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          [SKIP][521] ([i915#3638]) -> [SKIP][522] ([i915#14544])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][523] ([i915#14544]) -> [SKIP][524] +22 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-dg1:          [SKIP][525] ([i915#4423] / [i915#6095]) -> [SKIP][526] ([i915#6095]) +1 other test skip
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-13/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-12/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][527] ([i915#14098] / [i915#6095]) -> [SKIP][528] ([i915#6095]) +1 other test skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-rkl:          [SKIP][529] ([i915#14098] / [i915#6095]) -> [SKIP][530] ([i915#14544]) +8 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [INCOMPLETE][531] ([i915#12796]) -> [SKIP][532] ([i915#14544])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][533] ([i915#14544]) -> [SKIP][534] ([i915#14098] / [i915#6095]) +11 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-rkl:          [SKIP][535] ([i915#14544]) -> [DMESG-WARN][536] ([i915#12964])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][537] ([i915#14544]) -> [SKIP][538] ([i915#12313]) +1 other test skip
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          [SKIP][539] ([i915#14544] / [i915#3742]) -> [SKIP][540] ([i915#3742])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cdclk@plane-scaling.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          [SKIP][541] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][542] ([i915#11151] / [i915#7828]) +8 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          [SKIP][543] ([i915#11151] / [i915#7828]) -> [SKIP][544] ([i915#11151] / [i915#14544] / [i915#7828]) +7 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_color@deep-color:
    - shard-rkl:          [SKIP][545] ([i915#12655] / [i915#14544] / [i915#3555]) -> [SKIP][546] ([i915#12655] / [i915#3555])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_color@deep-color.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          [SKIP][547] ([i915#7118] / [i915#9424]) -> [FAIL][548] ([i915#7173])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-4/igt@kms_content_protection@atomic.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          [FAIL][549] ([i915#7173]) -> [SKIP][550] ([i915#7118] / [i915#9424])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-11/igt@kms_content_protection@atomic-dpms.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          [SKIP][551] ([i915#3299]) -> [SKIP][552] ([i915#3299] / [i915#4423])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-16/igt@kms_content_protection@dp-mst-type-0.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-13/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          [SKIP][553] ([i915#14544]) -> [SKIP][554] ([i915#3116]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][555] ([i915#7118] / [i915#9424]) -> [SKIP][556] ([i915#14544])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_content_protection@legacy.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          [SKIP][557] ([i915#9424]) -> [SKIP][558] ([i915#14544])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_content_protection@lic-type-0.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][559] ([i915#9433]) -> [SKIP][560] ([i915#9424])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-12/igt@kms_content_protection@mei-interface.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][561] ([i915#7118]) -> [SKIP][562] ([i915#14544])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@kms_content_protection@srm.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-rkl:          [FAIL][563] ([i915#13566]) -> [SKIP][564] ([i915#14544])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          [SKIP][565] ([i915#14544]) -> [FAIL][566] ([i915#13566])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-rkl:          [FAIL][567] ([i915#13566]) -> [DMESG-FAIL][568] ([i915#12964])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][569] ([i915#14544]) -> [SKIP][570] ([i915#13049]) +2 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          [SKIP][571] ([i915#14544]) -> [SKIP][572] ([i915#3555])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][573] -> [SKIP][574] ([i915#14544]) +9 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][575] ([i915#11190] / [i915#14544]) -> [SKIP][576] ([i915#4103])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          [SKIP][577] ([i915#14544]) -> [SKIP][578] ([i915#13691])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][579] ([i915#14544]) -> [SKIP][580] ([i915#3840])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          [SKIP][581] ([i915#14544]) -> [SKIP][582] ([i915#3555] / [i915#3840]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][583] ([i915#14544] / [i915#3955]) -> [SKIP][584] ([i915#3955])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          [SKIP][585] ([i915#658]) -> [SKIP][586] ([i915#14544] / [i915#658]) +1 other test skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_feature_discovery@psr1.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          [SKIP][587] ([i915#14544] / [i915#9934]) -> [SKIP][588] ([i915#9934]) +6 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip@2x-plain-flip.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          [SKIP][589] ([i915#9934]) -> [SKIP][590] ([i915#14544] / [i915#9934]) +3 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-rkl:          [SKIP][591] ([i915#14544] / [i915#3637]) -> [DMESG-WARN][592] ([i915#12964])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip@basic-flip-vs-modeset.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][593] ([i915#2672] / [i915#3555]) -> [SKIP][594] ([i915#14544] / [i915#3555])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][595] ([i915#14544] / [i915#3555]) -> [SKIP][596] ([i915#2672] / [i915#3555]) +4 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][597] ([i915#1825]) -> [SKIP][598] ([i915#14544] / [i915#1849] / [i915#5354]) +19 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][599] ([i915#3458]) -> [SKIP][600] ([i915#10433] / [i915#3458])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][601] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][602] ([i915#1825]) +39 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          [SKIP][603] ([i915#8708]) -> [SKIP][604] ([i915#4423] / [i915#8708])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][605] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][606]
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][607] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][608] ([i915#3023]) +21 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg1:          [SKIP][609] ([i915#3458]) -> [SKIP][610] ([i915#3458] / [i915#4423])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][611] ([i915#10433] / [i915#3458]) -> [SKIP][612] ([i915#3458]) +1 other test skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
    - shard-rkl:          [SKIP][613] ([i915#3023]) -> [SKIP][614] ([i915#14544] / [i915#1849] / [i915#5354]) +14 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [SKIP][615] ([i915#3555] / [i915#8228]) -> [SKIP][616] ([i915#14544])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_hdr@bpc-switch-suspend.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][617] ([i915#14544]) -> [SKIP][618] ([i915#12713])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][619] ([i915#14544]) -> [SKIP][620] ([i915#3555] / [i915#8228]) +1 other test skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_hdr@static-toggle.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          [SKIP][621] ([i915#12388]) -> [SKIP][622] ([i915#12388] / [i915#14544])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][623] ([i915#4070] / [i915#4816]) -> [SKIP][624] ([i915#4816])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][625] ([i915#6301]) -> [SKIP][626] ([i915#14544])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_panel_fitting@legacy.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          [SKIP][627] ([i915#14544]) -> [SKIP][628] ([i915#13958])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          [SKIP][629] ([i915#14544]) -> [SKIP][630] ([i915#14259])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          [SKIP][631] ([i915#14544] / [i915#3555] / [i915#8152]) -> [SKIP][632] ([i915#3555])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:
    - shard-rkl:          [SKIP][633] ([i915#12247] / [i915#14544]) -> [SKIP][634] ([i915#12247])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          [SKIP][635] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][636] ([i915#12247])
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-rkl:          [SKIP][637] ([i915#14544] / [i915#8152]) -> [DMESG-WARN][638] ([i915#12964])
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-rkl:          [SKIP][639] ([i915#12247] / [i915#14544] / [i915#8152]) -> [DMESG-WARN][640] ([i915#12964])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          [SKIP][641] ([i915#14544] / [i915#5354]) -> [SKIP][642] ([i915#5354]) +1 other test skip
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          [SKIP][643] ([i915#5354]) -> [SKIP][644] ([i915#14544] / [i915#5354]) +1 other test skip
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_pm_backlight@fade-with-dpms.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          [SKIP][645] ([i915#4423] / [i915#5354]) -> [SKIP][646] ([i915#5354])
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-18/igt@kms_pm_backlight@fade-with-suspend.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-19/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          [SKIP][647] ([i915#3361]) -> [FAIL][648] ([i915#9295])
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][649] ([i915#4281]) -> [SKIP][650] ([i915#14544] / [i915#4281])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][651] ([i915#9519]) -> [DMESG-WARN][652] ([i915#12964])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][653] ([i915#14544] / [i915#6524]) -> [SKIP][654] ([i915#6524])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][655] ([i915#11520] / [i915#14544]) -> [SKIP][656] ([i915#11520]) +7 other tests skip
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][657] ([i915#11520]) -> [SKIP][658] ([i915#11520] / [i915#14544]) +4 other tests skip
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          [SKIP][659] ([i915#14544] / [i915#9683]) -> [SKIP][660] ([i915#9683]) +2 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-dg1:          [SKIP][661] ([i915#1072] / [i915#9732]) -> [SKIP][662] ([i915#1072] / [i915#4423] / [i915#9732])
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-17/igt@kms_psr@fbc-psr-primary-render.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][663] ([i915#1072] / [i915#9732]) -> [SKIP][664] ([i915#1072] / [i915#14544] / [i915#9732]) +11 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_psr@psr-sprite-plane-onoff.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-rkl:          [SKIP][665] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][666] ([i915#1072] / [i915#9732]) +19 other tests skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          [SKIP][667] ([i915#9685]) -> [SKIP][668] ([i915#14544] / [i915#9685])
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-rkl:          [SKIP][669] ([i915#3555]) -> [SKIP][670] ([i915#14544])
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-full.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vblank@query-forked-busy-hang:
    - shard-rkl:          [DMESG-WARN][671] ([i915#12964]) -> [SKIP][672] ([i915#14544])
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_vblank@query-forked-busy-hang.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_vblank@query-forked-busy-hang.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          [SKIP][673] ([i915#14544]) -> [SKIP][674] ([i915#3555] / [i915#9906])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_vrr@negative-basic.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          [SKIP][675] ([i915#14544]) -> [SKIP][676] ([i915#9906])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          [SKIP][677] ([i915#2437]) -> [SKIP][678] ([i915#14544] / [i915#2437])
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_writeback@writeback-fb-id.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_writeback@writeback-fb-id.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][679] ([i915#14544] / [i915#3708]) -> [SKIP][680] ([i915#3708])
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          [SKIP][681] ([i915#9917]) -> [SKIP][682] ([i915#14544] / [i915#9917])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-rkl:          [SKIP][683] ([i915#14544] / [i915#9917]) -> [SKIP][684] ([i915#9917])
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12353]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12518
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13320]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13320
  [i915#13328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13899]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13899
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14553
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14756
  [i915#14809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8498 -> IGTPW_13600
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_17032: 8093b67375779a975c13b9a23c8fcc25cb1e9c83 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13600: e50acf4e67e6826b14605753615c30666f704747 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8498: 8498
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/index.html

--===============2900467651644829928==
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
<tr><td><b>Series:</b></td><td>Convert kms_3d into subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153155/">https://patchwork.freedesktop.org/series/153155/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_17032_full -&gt; IGTPW_13600_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13600_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13600_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/index.html</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): shard-dg2-set2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13600_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_suspend@forcewake:<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-3/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-2/igt@i915_suspend@forcewake.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_17032_full and IGTPW_13600_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_3d@basic:<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.42, 3.46] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13600_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-12/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-bltcopy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_bad_reloc@negative-reloc-bltcopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_caching@reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@gem_caching@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-9/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-2/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561">i915#9561</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-4/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-10/igt@gem_ctx_isolation@preservation-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213">i915#8213</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-glk9/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353">i915#12353</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-12/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk6/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@gem_exec_fence@concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-6/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-13/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-2/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-14/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@gem_exec_reloc@basic-write-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@gem_mmap_gtt@basic-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_mmap_gtt@fault-concurrent-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@gem_mmap_wc@close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_mmap_wc@close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@gem_mmap_wc@read-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_partial_pwrite_pread@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-13/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_pread@exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test timeout</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-2.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-14/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-18/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-2/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@i915_drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-snb5/igt@i915_drm_fdinfo@virtual-busy-hang.html">SKIP</a> +27 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@i915_drm_fdinfo@virtual-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-5/igt@i915_drm_fdinfo@virtual-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@i915_drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>) +1 other test skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-17/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-14/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178">i915#7178</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437">i915#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-7/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk6/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-10/igt@i915_suspend@sysfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-9/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13320">i915#13320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12518">i915#12518</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-19/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-12/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +135 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +482 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +155 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_color@ctm-0-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-2/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-12/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-glk1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip@flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk5/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +10 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_invalid_mode@uint-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-13/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522">i915#13522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_lease@lease-invalid-plane.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_lease@lease-invalid-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_plane@plane-panning-top-left.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294">i915#7294</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-14/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-19/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk9/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +13 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk10/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-19/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_psr@psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk6/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk10/igt@kms_vblank@query-forked-hang.html">SKIP</a> +256 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk8/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-10/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-9/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>) +1 other test skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling@0-rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@perf@polling@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@perf@polling@0-rcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +43 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-5/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-13/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-9/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-7/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14756">i915#14756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-3/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809">i915#14809</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-5/igt@gem_mmap_offset@clear-via-pagefault.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-snb7/igt@gem_softpin@noreloc-s3.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-snb7/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-5/igt@gem_softpin@noreloc-s3.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-6/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-5/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-pread:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@i915_pm_rpm@gem-pread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328">i915#13328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@i915_pm_rpm@gem-pread.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-glk8/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk5/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_color@gamma.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> +1 other test pass</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-1/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-3/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14553">i915#14553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_flip@flip-vs-dpms-on-nop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-snb6/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13899">i915#13899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-snb6/igt@kms_flip@wf_vblank-ts-check@a-vga1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-snb4/igt@kms_flip@wf_vblank-ts-check@a-vga1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-3/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_invalid_mode@int-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_invalid_mode@int-max-clock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_stress@stress-xrgb8888-xtiled}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html">PASS</a> +56 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane@plane-position-covered.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_plane@plane-position-covered.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294">i915#7294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_plane_alpha_blend@constant-alpha-max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441">i915#13441</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521">i915#11521</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_properties@plane-properties-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-mtlp-1/igt@kms_psr@psr2-dpms.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-mtlp-8/igt@kms_psr@psr2-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-10/igt@perf@gen12-group-concurrent-oa-buffer-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@perf_pmu@rc6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@perf_pmu@rc6.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@perf_pmu@rc6@runtime-pm-long-gt0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@perf_pmu@rc6@runtime-pm-long-gt0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-18/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-16/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-13/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-12/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-4/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-11/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-11/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-3/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-16/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-13/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-12/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-17/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-18/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-19/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295">i915#9295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-2/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-dg1-17/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-dg1-15/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_vblank@query-forked-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_vblank@query-forked-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-4/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-7/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-rkl-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8498 -&gt; IGTPW_13600</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17032: 8093b67375779a975c13b9a23c8fcc25cb1e9c83 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13600: e50acf4e67e6826b14605753615c30666f704747 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8498: 8498<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2900467651644829928==--
