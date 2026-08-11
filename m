Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077CFC5B572
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 18:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AD910E372;
	Tue, 11 Aug 2026 18:18:59 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B141910E301;
 Tue, 11 Aug 2026 18:18:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6065245413003890548=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Update_scripts/code=5Fco?=
 =?utf-8?q?v=5Fparse=5Finfo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Aug 2026 18:18:22 -0000
Message-ID: <178647230270.41072.8852595633195159090@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260811133411.720679-1-jari.tahvanainen@intel.com>
In-Reply-To: <20260811133411.720679-1-jari.tahvanainen@intel.com>
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

--===============6065245413003890548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update scripts/code_cov_parse_info
URL   : https://patchwork.freedesktop.org/series/171990/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9051_full -> IGTPW_15656_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15656_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15656_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15656_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf_pmu@most-busy-check-all@vecs0:
    - shard-rkl:          [PASS][1] -> [FAIL][2] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@perf_pmu@most-busy-check-all@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@perf_pmu@most-busy-check-all@vecs0.html

  
New tests
---------

  New tests have been introduced between IGT_9051_full and IGTPW_15656_full:

### New IGT tests (10) ###

  * igt@gem_userptr_blits@mmap-offset-banned@fixed:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [11.88] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [12.25] s

  * igt@kms_busy@extended-modeset-hang-newfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [12.01] s

  * igt@kms_busy@extended-modeset-hang-newfb@pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [24.04] s

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [10.82] s

  * igt@kms_busy@extended-pageflip-hang-newfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [6.04] s

  * igt@kms_busy@extended-pageflip-hang-newfb@pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [13.75] s

  * igt@kms_busy@extended-pageflip-hang-oldfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [6.05] s

  

Known issues
------------

  Here are the changes found in IGTPW_15656_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][3] ([i915#6230])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][4] ([i915#11814])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#3936])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#3936])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@gem_busy@semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#3936])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-7/igt@gem_busy@semaphore.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#4873])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-2/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#13008])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][11] -> [INCOMPLETE][12] ([i915#13356] / [i915#16348]) +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg2-5/igt@gem_ccs@suspend-resume.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#6335])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#6335])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#6335])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][16] ([i915#13356] / [i915#16466])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@legacy-engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][17] ([i915#1099]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hang.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#280]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#280])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][22] ([i915#13363])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@gem_eio@kms.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][23] ([i915#13363])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglu-1:       NOTRUN -> [SKIP][24] ([i915#4525])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#4525])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#4525])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#6334]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#6334]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#6344])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4812])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_fence@submit:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#4812]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@gem_exec_flush@basic-uc-ro-default.html
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#3539] / [i915#4852])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#14544] / [i915#3281])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#3281]) +11 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-cpu-active.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#3281]) +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3281]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@gem_exec_reloc@basic-write-gtt-active.html
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#3281]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4537] / [i915#4812])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][40] ([i915#13356]) +1 other test incomplete
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4860]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-x.html
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4860]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4860]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#14544] / [i915#4613] / [i915#7582])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-tglu-1:       NOTRUN -> [SKIP][45] ([i915#4613] / [i915#7582])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4613])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#4613]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][48] ([i915#4613]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#4613]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][50] ([i915#4613]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#284])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4083]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@basic-short:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4077]) +11 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@gem_mmap_gtt@basic-short.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4077]) +9 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4077]) +9 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_wc@coherency:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4083]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@gem_mmap_wc@coherency.html
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4083]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@gem_mmap_wc@coherency.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#3282]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#3282]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][60] ([i915#2658])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk1/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][61] ([i915#2658])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#13717])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#13398])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4270])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3282]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@gem_readwrite@write-bad-handle.html
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3282]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#5190] / [i915#8428]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#8428]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4079]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#8411]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4079])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4079])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#15656])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#3297])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3297]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#3297]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#3297]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#3297]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3297]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3297] / [i915#4880])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3297] / [i915#4880])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][82] ([i915#13356] / [i915#14586])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk2/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#2527]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#2527] / [i915#2856]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#2527])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglu-1:       NOTRUN -> [SKIP][86] ([i915#2527] / [i915#2856])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#2856])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#14123])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-2/igt@i915_drm_fdinfo@all-busy-check-all.html
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#14123])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@i915_drm_fdinfo@all-busy-check-all.html
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#14123])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#11527]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@i915_drm_fdinfo@busy-check-all.html

  * igt@i915_module_load@fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][92] ([i915#11814] / [i915#15481]) +1 other test abort
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][93] ([i915#15481])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [PASS][94] -> [DMESG-WARN][95] ([i915#13029] / [i915#14545])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg2-3/igt@i915_module_load@reload-no-display.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-1/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          [PASS][96] -> [DMESG-WARN][97] ([i915#13029] / [i915#14545])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-19/igt@i915_module_load@reload-no-display.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#6412])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#6412])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#8399])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#8399]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#14498])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#14498])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][104] +339 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-snb:          NOTRUN -> [SKIP][105] +182 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-snb1/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#11681] / [i915#6621])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@i915_pm_rps@min-max-config-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#11681] / [i915#6621])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#11681] / [i915#6621])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4387])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#6245])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#16109])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@i915_query@query-topology-known-pci-ids.html
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#16109])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@i915_query@query-topology-known-pci-ids.html
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#16109])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@i915_query@query-topology-known-pci-ids.html
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#16109])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@i915_query@query-topology-known-pci-ids.html
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#14544] / [i915#16109])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#5723])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][117] ([i915#4817])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][118] ([i915#16182] / [i915#4817])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk11/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#7707])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][120] ([i915#12761]) +1 other test incomplete
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk10/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#9531])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         NOTRUN -> [FAIL][122] ([i915#15662]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#1769] / [i915#3555])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#1769] / [i915#3555])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#1769] / [i915#3555])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-rkl:          [PASS][126] -> [FAIL][127] ([i915#15662])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][128] ([i915#15662])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][129] +14 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#5286]) +6 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#14544] / [i915#5286])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#5286]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#5286]) +5 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#4538] / [i915#5286]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#3638]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#3828])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][137] +6 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#3638]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#4538] / [i915#5190]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#5190])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#6187])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4538]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][143] +87 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#10307] / [i915#6095]) +74 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#12313]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#6095]) +44 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#14098] / [i915#14544] / [i915#6095]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#6095]) +201 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-glk11:        NOTRUN -> [SKIP][149] +78 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#12805])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#6095]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][153] ([i915#15582]) +1 other test incomplete
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#12313])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#12313]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#12313])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#12313])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#14098] / [i915#6095]) +58 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#6095]) +89 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#14544] / [i915#6095]) +8 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#6095]) +59 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#6095]) +84 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#3742])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#3742])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#16017])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#11151])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#16471])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#16471]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#16471])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#14544] / [i915#16471])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
    - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#16471]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#16471]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#16464] / [i915#16471]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#11151] / [i915#7828]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#11151] / [i915#14544] / [i915#7828])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#11151] / [i915#7828]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#11151] / [i915#7828]) +5 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#11151] / [i915#7828]) +11 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#11151] / [i915#7828]) +5 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#11151] / [i915#7828]) +11 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#15330])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#15330]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#15330])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#15330])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#15330] / [i915#3116]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#15330])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#15865]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#15865])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#15865]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#9433])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#15865]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_content_protection@mei-interface.html
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#8063] / [i915#9433])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#15865]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#3555]) +10 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#8814])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][196] ([i915#13566]) +2 other tests fail
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#13049]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#13049]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#13049]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][200] -> [FAIL][201] ([i915#13566]) +1 other test fail
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [FAIL][202] ([i915#13566]) +3 other tests fail
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#3555] / [i915#8814]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#13046] / [i915#5354]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#9809]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#4103])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#4103]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#16119] / [i915#4213]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#4103]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#9723])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#1769] / [i915#3555] / [i915#3804])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#3804])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#3804])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#13749])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#13707])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#16361])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#16361])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#16361]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#16361]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu-1:       NOTRUN -> [SKIP][220] ([i915#16361]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#14544] / [i915#16361])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#16361]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#16680])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_fbcon_fbt@psr.html
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#16680])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#16081])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#16599])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#16600])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#658])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#658])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@vrr:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#16600])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#9934]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#3637] / [i915#9934]) +7 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#9934])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#8381])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#8381])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#8381])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#3637] / [i915#9934]) +6 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#3637] / [i915#9934]) +6 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#9934]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#9934]) +9 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][241] ([i915#12745] / [i915#4839])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][242] ([i915#12745])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#15643]) +5 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#15643]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#15643] / [i915#5190])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8810] / [i915#8813])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#8810] / [i915#8813])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#15643]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#15643]) +5 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#15643])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#15643]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#15104] / [i915#15990])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#15104] / [i915#15990])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#15104] / [i915#15990])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#15990] / [i915#8708]) +5 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#14544] / [i915#1825])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][257] +45 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#1825]) +4 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-indfb-fliptrack-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#15990]) +10 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#15989]) +24 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#15989]) +14 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#15990]) +5 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][263] +115 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][264] ([i915#16056] / [i915#16593])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#15102] / [i915#3023]) +14 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#15102]) +52 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#15991] / [i915#1825]) +19 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#15990] / [i915#8708]) +6 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#5439])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#15990]) +10 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#15989]) +26 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#15102]) +22 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#15991]) +35 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#14544]) +22 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#14544] / [i915#15102]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#5439])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-rkl:          [PASS][277] -> [SKIP][278] ([i915#15989]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#15989]) +7 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#15989]) +26 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#15989]) +8 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#15991]) +25 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][283] +68 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#9766])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#15990] / [i915#8708]) +5 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#15102]) +15 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#14544] / [i915#15102] / [i915#3023]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#15991] / [i915#5354]) +18 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#15102]) +30 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][290] +107 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-slowdraw:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#15102]) +15 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          [PASS][292] -> [SKIP][293] ([i915#16644] / [i915#3555] / [i915#8228])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#3555] / [i915#8228])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#15460])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#13688])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#15458])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#14544] / [i915#15458])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#15458])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#15458])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#15458])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#16451])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_mst@mst-suspend-read-crc.html
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#16451])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_mst@mst-suspend-read-crc.html
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#16451])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_mst@mst-suspend-read-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#16451])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_mst@mst-suspend-read-crc.html
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#16451])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][307] ([i915#15815])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#6301])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][309] ([i915#12756] / [i915#13409] / [i915#13476] / [i915#16789])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][310] ([i915#13409] / [i915#13476] / [i915#16789])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#14712])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][312] ([i915#118])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#15709]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#15709]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#15709])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#15709]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#15709]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#16386]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#14544] / [i915#15709]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#15709]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#16112])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#8821])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@kms_plane_lowres@tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#3555] / [i915#8821])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#13958]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#13958])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][326] ([i915#14259])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#15329]) +6 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#15329] / [i915#3555])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#15329] / [i915#6953]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][330] ([i915#15329]) +12 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#12343] / [i915#5354])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#12343] / [i915#5354]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#12343] / [i915#14544] / [i915#5354])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#12343] / [i915#5354])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#12343] / [i915#9812])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#9685])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#3828])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu-1:       NOTRUN -> [FAIL][338] ([i915#16479])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#15073])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#15073])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#15073])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][342] ([i915#15073])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [PASS][343] -> [DMESG-WARN][344] ([i915#4423]) +1 other test dmesg-warn
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-14/igt@kms_pm_rpm@i2c.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#15073])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#15073]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][347] -> [SKIP][348] ([i915#15073])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg1:          [PASS][349] -> [SKIP][350] ([i915#15073]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#6524])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#6524] / [i915#6805])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_prime@d3hot.html
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#6524])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_prime@d3hot.html
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#6524])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_prime@d3hot.html
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#6524])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_prime@d3hot.html
    - shard-mtlp:         NOTRUN -> [SKIP][356] ([i915#6524])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#11520] / [i915#14544])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][358] ([i915#11520]) +9 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#9808])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#12316]) +4 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#11520]) +5 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][362] ([i915#11520]) +4 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-glk10:        NOTRUN -> [SKIP][363] ([i915#11520]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#11520]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][365] ([i915#11520]) +3 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
    - shard-snb:          NOTRUN -> [SKIP][366] ([i915#11520]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-snb1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#11520]) +7 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#9683])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#9683])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][370] ([i915#9683])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#9683])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-mtlp:         NOTRUN -> [SKIP][372] ([i915#4348])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][373] ([i915#9732]) +14 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#1072] / [i915#9732]) +24 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_psr@fbc-psr2-primary-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#1072] / [i915#9732]) +10 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-mtlp:         NOTRUN -> [SKIP][376] ([i915#9688]) +14 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][377] ([i915#9732]) +25 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][378] ([i915#1072] / [i915#9732]) +8 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@kms_psr@pr-primary-mmap-gtt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#15949])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#15949])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#15949])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#15949])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#12755] / [i915#15867]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#12755] / [i915#15867])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          NOTRUN -> [INCOMPLETE][386] ([i915#15500] / [i915#16184])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][387] ([i915#5289]) +2 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][388] ([i915#12755] / [i915#15867] / [i915#5190])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#5289]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-dg1:          NOTRUN -> [SKIP][390] ([i915#5289])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-mtlp:         NOTRUN -> [SKIP][391] ([i915#3555] / [i915#5030] / [i915#9041])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][392] ([i915#5030]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][393] ([i915#5030] / [i915#9041])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#3555]) +2 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-dg1:          NOTRUN -> [SKIP][395] ([i915#3555]) +2 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-tglu:         NOTRUN -> [SKIP][396] ([i915#3555]) +4 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][397] ([i915#3555] / [i915#8809])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][398] ([i915#3555]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][399] ([i915#8623])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][400] ([i915#8623])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][401] ([i915#12276]) +1 other test incomplete
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk11/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          NOTRUN -> [SKIP][402] ([i915#15243] / [i915#3555]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][403] ([i915#3555] / [i915#9906])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-tglu-1:       NOTRUN -> [SKIP][404] ([i915#9906])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu:         NOTRUN -> [SKIP][405] ([i915#9906])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@global-sseu-config:
    - shard-mtlp:         NOTRUN -> [SKIP][406] ([i915#7387])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@perf@global-sseu-config.html
    - shard-dg2:          NOTRUN -> [SKIP][407] ([i915#7387])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@perf@global-sseu-config.html

  * igt@prime_udl@share-import:
    - shard-tglu:         NOTRUN -> [SKIP][408] ([i915#16420])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][409] ([i915#3708])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@prime_vgem@basic-fence-flip.html
    - shard-dg2:          NOTRUN -> [SKIP][410] ([i915#3708])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][411] ([i915#3708]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][412] ([i915#3708])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-7/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][413] ([i915#9917]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-5:
    - shard-mtlp:         NOTRUN -> [SKIP][414] ([i915#16066]) +19 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@sriov_basic@bind-unbind-vf@vf-5.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-tglu:         NOTRUN -> [SKIP][415] ([i915#16066]) +9 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - shard-dg2:          NOTRUN -> [SKIP][416] ([i915#9917])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - shard-dg1:          NOTRUN -> [SKIP][417] ([i915#9917])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
    - shard-tglu-1:       NOTRUN -> [SKIP][418] ([i915#16066]) +8 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-dg2:          NOTRUN -> [SKIP][419] ([i915#16785])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
    - shard-rkl:          NOTRUN -> [SKIP][420] ([i915#16785])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
    - shard-dg1:          NOTRUN -> [SKIP][421] ([i915#16785])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
    - shard-mtlp:         NOTRUN -> [SKIP][422] ([i915#16786])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [INCOMPLETE][423] ([i915#13356] / [i915#16466]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-glk1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [FAIL][425] ([i915#15944]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-tglu-4/igt@gem_exec_big@single.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@gem_exec_big@single.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [INCOMPLETE][427] ([i915#16021] / [i915#16108] / [i915#16202]) -> [PASS][428] +1 other test pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [INCOMPLETE][429] ([i915#13356]) -> [PASS][430] +3 other tests pass
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][431] ([i915#13356] / [i915#13820]) -> [PASS][432] +1 other test pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_selftest@live:
    - shard-dg1:          [DMESG-FAIL][433] -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@i915_selftest@live.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gem_contexts:
    - shard-dg1:          [DMESG-FAIL][435] ([i915#15433]) -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@i915_selftest@live@gem_contexts.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [INCOMPLETE][437] ([i915#4817]) -> [PASS][438]
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@i915_suspend@sysfs-reader.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@i915_suspend@sysfs-reader.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:
    - shard-rkl:          [SKIP][439] ([i915#15989]) -> [PASS][440] +11 other tests pass
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          [SKIP][441] ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][442]
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_hdr@static-swap.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_hdr@static-swap.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [INCOMPLETE][443] ([i915#14412]) -> [PASS][444] +1 other test pass
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-dg1:          [DMESG-WARN][445] ([i915#4423]) -> [PASS][446] +3 other tests pass
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_plane_alpha_blend@constant-alpha-max.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [SKIP][447] ([i915#6953]) -> [PASS][448]
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-8/igt@kms_plane_scaling@intel-max-src-size.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          [SKIP][449] ([i915#15073]) -> [PASS][450]
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-16/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][451] ([i915#15073]) -> [PASS][452]
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          [INCOMPLETE][453] ([i915#14419]) -> [PASS][454]
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_pm_rpm@system-suspend-modeset.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          [SKIP][455] ([i915#8411]) -> [SKIP][456] ([i915#14544] / [i915#8411])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          [SKIP][457] ([i915#14544] / [i915#8562]) -> [SKIP][458] ([i915#8562])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@gem_create@create-ext-set-pat.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@gem_create@create-ext-set-pat.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][459] ([i915#3281]) -> [SKIP][460] ([i915#14544] / [i915#3281]) +4 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          [SKIP][461] ([i915#14544] / [i915#4613]) -> [SKIP][462] ([i915#4613]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          [SKIP][463] ([i915#3282]) -> [SKIP][464] ([i915#14544] / [i915#3282])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          [SKIP][465] ([i915#14544] / [i915#3282]) -> [SKIP][466] ([i915#3282])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          [SKIP][467] ([i915#14544] / [i915#3281] / [i915#3297]) -> [SKIP][468] ([i915#3281] / [i915#3297])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@gem_userptr_blits@relocations.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@gem_userptr_blits@relocations.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          [SKIP][469] ([i915#2527]) -> [SKIP][470] ([i915#14544] / [i915#2527]) +1 other test skip
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][471] ([i915#14544] / [i915#4387]) -> [SKIP][472] ([i915#4387])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@i915_pm_sseu@full-enable.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          [SKIP][473] ([i915#7707]) -> [SKIP][474] ([i915#14544] / [i915#7707])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@intel_hwmon@hwmon-read.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          [SKIP][475] ([i915#9531]) -> [SKIP][476] ([i915#14544] / [i915#9531])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][477] ([i915#5286]) -> [SKIP][478] ([i915#14544] / [i915#5286]) +3 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          [SKIP][479] ([i915#14544] / [i915#5286]) -> [SKIP][480] ([i915#5286])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-rkl:          [SKIP][481] ([i915#3638]) -> [SKIP][482] ([i915#14544] / [i915#3638]) +1 other test skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][483] ([i915#6095]) -> [SKIP][484] ([i915#14544] / [i915#6095]) +3 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][485] ([i915#14098] / [i915#6095]) -> [SKIP][486] ([i915#14098] / [i915#14544] / [i915#6095]) +6 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][487] ([i915#12313] / [i915#14544]) -> [SKIP][488] ([i915#12313])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][489] ([i915#12805]) -> [SKIP][490] ([i915#12805] / [i915#14544])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg1:          [SKIP][491] ([i915#12805] / [i915#4423]) -> [SKIP][492] ([i915#12805])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][493] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][494] ([i915#14098] / [i915#6095]) +1 other test skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          [SKIP][495] ([i915#3742]) -> [SKIP][496] ([i915#14544] / [i915#3742])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_cdclk@mode-transition.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-rkl:          [SKIP][497] ([i915#16471]) -> [SKIP][498] ([i915#14544] / [i915#16471])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-rkl:          [SKIP][499] ([i915#14544] / [i915#16471]) -> [SKIP][500] ([i915#16471])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          [SKIP][501] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][502] ([i915#11151] / [i915#7828]) +1 other test skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-rkl:          [SKIP][503] ([i915#11151] / [i915#7828]) -> [SKIP][504] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-rkl:          [SKIP][505] ([i915#14544] / [i915#15865]) -> [SKIP][506] ([i915#15865])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_content_protection@atomic-hdcp14.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          [SKIP][507] ([i915#15330] / [i915#3116]) -> [SKIP][508] ([i915#14544] / [i915#15330] / [i915#3116])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][509] ([i915#15865]) -> [SKIP][510] ([i915#14544] / [i915#15865])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_content_protection@srm.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-rkl:          [SKIP][511] ([i915#3555]) -> [SKIP][512] ([i915#14544] / [i915#3555]) +4 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][513] ([i915#13049]) -> [SKIP][514] ([i915#13049] / [i915#14544])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][515] -> [SKIP][516] ([i915#14544]) +27 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          [SKIP][517] ([i915#13748]) -> [SKIP][518] ([i915#13748] / [i915#14544])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][519] ([i915#14544] / [i915#16361]) -> [SKIP][520] ([i915#16361]) +2 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          [SKIP][521] ([i915#16361]) -> [SKIP][522] ([i915#14544] / [i915#16361])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][523] ([i915#14544] / [i915#16680]) -> [SKIP][524] ([i915#16680])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          [SKIP][525] ([i915#16081]) -> [SKIP][526] ([i915#14544] / [i915#16081])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_feature_discovery@display-4x.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dsc:
    - shard-rkl:          [SKIP][527] ([i915#14544] / [i915#16600]) -> [SKIP][528] ([i915#16600])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_feature_discovery@dsc.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-rkl:          [SKIP][529] ([i915#9934]) -> [SKIP][530] ([i915#14544] / [i915#9934]) +2 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-rkl:          [SKIP][531] ([i915#14544] / [i915#9934]) -> [SKIP][532] ([i915#9934]) +2 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg1:          [SKIP][533] ([i915#4423] / [i915#9934]) -> [SKIP][534] ([i915#9934])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          [SKIP][535] ([i915#15643] / [i915#4423]) -> [SKIP][536] ([i915#15643])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][537] ([i915#14544] / [i915#15643]) -> [SKIP][538] ([i915#15643])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][539] ([i915#15643]) -> [SKIP][540] ([i915#14544] / [i915#15643])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          [SKIP][541] ([i915#4423]) -> [SKIP][542] +3 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][543] ([i915#14544] / [i915#1825]) -> [SKIP][544] ([i915#1825]) +1 other test skip
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg1:          [SKIP][545] ([i915#15989]) -> [SKIP][546] ([i915#15989] / [i915#4423])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-rkl:          [SKIP][547] ([i915#14544] / [i915#5439]) -> [SKIP][548] ([i915#5439]) +1 other test skip
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][549] ([i915#15102]) -> [SKIP][550] ([i915#14544] / [i915#15102]) +8 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2:          [SKIP][551] ([i915#15102]) -> [SKIP][552] ([i915#10433] / [i915#15102]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][553] ([i915#1825]) -> [SKIP][554] ([i915#14544] / [i915#1825]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-rkl:          [SKIP][555] ([i915#15102] / [i915#3023]) -> [SKIP][556] ([i915#14544] / [i915#15102] / [i915#3023]) +5 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][557] ([i915#14544] / [i915#15102]) -> [SKIP][558] ([i915#15102]) +10 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][559] ([i915#14544]) -> [SKIP][560] +31 other tests skip
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          [SKIP][561] ([i915#15989] / [i915#4423]) -> [SKIP][562] ([i915#15989]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-rkl:          [ABORT][563] ([i915#15132]) -> [SKIP][564] ([i915#15989]) +1 other test skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][565] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][566] ([i915#15102] / [i915#3023]) +7 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][567] ([i915#15990] / [i915#4423] / [i915#8708]) -> [SKIP][568] ([i915#15990] / [i915#8708])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg1:          [SKIP][569] -> [SKIP][570] ([i915#4423])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-indfb-scaledprimary:
    - shard-dg1:          [SKIP][571] ([i915#15102] / [i915#4423]) -> [SKIP][572] ([i915#15102]) +1 other test skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_frontbuffer_tracking@psrhdr-indfb-scaledprimary.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-indfb-scaledprimary.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg1:          [SKIP][573] ([i915#3555] / [i915#4423] / [i915#8228]) -> [SKIP][574] ([i915#3555] / [i915#8228])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_hdr@invalid-hdr.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          [SKIP][575] ([i915#15460]) -> [SKIP][576] ([i915#14544] / [i915#15460])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-8/igt@kms_joiner@basic-big-joiner.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][577] ([i915#14544] / [i915#15458]) -> [SKIP][578] ([i915#15458])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][579] ([i915#15815]) -> [SKIP][580] ([i915#14544] / [i915#15815])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-rkl:          [SKIP][581] ([i915#14544] / [i915#15709]) -> [SKIP][582] ([i915#15709]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          [SKIP][583] ([i915#13958]) -> [SKIP][584] ([i915#13958] / [i915#14544]) +1 other test skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-y.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-rkl:          [SKIP][585] ([i915#14544] / [i915#9685]) -> [SKIP][586] ([i915#9685])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg1:          [SKIP][587] ([i915#15948]) -> [SKIP][588] ([i915#15948] / [i915#4423])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_pm_dc@dc5-psr.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][589] ([i915#15739]) -> [SKIP][590] ([i915#14544] / [i915#15739])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-1/igt@kms_pm_dc@dc9-dpms.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@package-g7:
    - shard-rkl:          [SKIP][591] ([i915#15403]) -> [SKIP][592] ([i915#14544] / [i915#15403])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_pm_rpm@package-g7.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][593] ([i915#11520] / [i915#14544]) -> [SKIP][594] ([i915#11520]) +2 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][595] ([i915#11520]) -> [SKIP][596] ([i915#11520] / [i915#14544]) +1 other test skip
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          [SKIP][597] ([i915#9683]) -> [SKIP][598] ([i915#14544] / [i915#9683])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-rkl:          [SKIP][599] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][600] ([i915#1072] / [i915#9732]) +7 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-plane-move.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-render:
    - shard-rkl:          [SKIP][601] ([i915#1072] / [i915#9732]) -> [SKIP][602] ([i915#1072] / [i915#14544] / [i915#9732]) +7 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_psr@psr-cursor-render.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-dg1:          [SKIP][603] ([i915#1072] / [i915#4423] / [i915#9732]) -> [SKIP][604] ([i915#1072] / [i915#9732])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_psr@psr2-cursor-plane-move.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][605] ([i915#14544] / [i915#8623]) -> [SKIP][606] ([i915#8623])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          [SKIP][607] ([i915#15243] / [i915#3555]) -> [SKIP][608] ([i915#14544] / [i915#15243] / [i915#3555])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_vrr@flip-suspend.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_vrr@flip-suspend.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          [SKIP][609] ([i915#2435]) -> [SKIP][610] ([i915#14544] / [i915#2435])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][611] ([i915#2433]) -> [SKIP][612] ([i915#14544] / [i915#2433])
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [INCOMPLETE][613] ([i915#13520]) -> [ABORT][614] ([i915#15778])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-tglu-8/igt@perf_pmu@module-unload.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          [SKIP][615] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][616] ([i915#3291] / [i915#3708])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@prime_vgem@basic-fence-read.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@prime_vgem@basic-fence-read.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-rkl:          [SKIP][617] ([i915#9917]) -> [SKIP][618] ([i915#14544] / [i915#9917])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15433
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
  [i915#16021]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16021
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16066]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16108
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16202
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16785
  [i915#16786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16786
  [i915#16789]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
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
  [i915#5030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8063]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9051 -> IGTPW_15656
  * Linux: CI_DRM_18977 -> CI_DRM_18978

  CI-20190529: 20190529
  CI_DRM_18977: dc462ab791b686c48545c160ecc81be64f77a846 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18978: 6ed371d40ec5cba972c0bdcf7e61fcadc7b5e7b0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15656: 89316662f748dcb120575990ac96897c4755cb6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9051: 9051

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/index.html

--===============6065245413003890548==
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
<tr><td><b>Series:</b></td><td>Update scripts/code_cov_parse_info</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171990/">https://patchwork.freedesktop.org/series/171990/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9051_full -&gt; IGTPW_15656_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15656_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15656_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15656_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@perf_pmu@most-busy-check-all@vecs0:<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@perf_pmu@most-busy-check-all@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@perf_pmu@most-busy-check-all@vecs0.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_9051_full and IGTPW_15656_full:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@gem_userptr_blits@mmap-offset-banned@fixed:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [24.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb@pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-oldfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.05] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15656_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814">i915#11814</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-7/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-2/igt@gem_caching@read-writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg2-5/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@gem_ctx_isolation@preservation-s3@bcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@gem_exec_fence@concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@gem_exec_fence@submit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gem_exec_reloc@basic-concurrent0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@gem_exec_reloc@basic-write-gtt-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@gem_exec_reloc@basic-write-gtt-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@gem_mmap@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-short:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@gem_mmap_gtt@basic-short.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +9 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@coherency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@gem_mmap_wc@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@gem_mmap_wc@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk1/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@gem_readwrite@write-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@gem_readwrite@write-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk2/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-2/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@i915_drm_fdinfo@busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814">i915#11814</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg2-3/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-1/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-19/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> +339 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-snb1/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> +182 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk11/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk10/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) +1 other test fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662">i915#15662</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662">i915#15662</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +201 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017">i915#16017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +11 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063">i915#8063</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> +115 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +26 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-rte.html">SKIP</a> +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-slowdraw:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789">i915#16789</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789">i915#16789</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-14/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-snb1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348">i915#4348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +24 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-4/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@kms_psr@pr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030">i915#5030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041">i915#9041</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030">i915#5030</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030">i915#5030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041">i915#9041</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk11/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-5/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-7/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf@vf-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-1/igt@sriov_basic@bind-unbind-vf@vf-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066">i915#16066</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066">i915#16066</a>) +9 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066">i915#16066</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-5/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16785">i915#16785</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16785">i915#16785</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16785">i915#16785</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-6/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16786">i915#16786</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-glk1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-glk4/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-tglu-4/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944">i915#15944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-10/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16021">i915#16021</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16108">i915#16108</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16202">i915#16202</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820">i915#13820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@i915_selftest@live.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15433">i915#15433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-18/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_hdr@static-swap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412">i915#14412</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_plane_alpha_blend@constant-alpha-max.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-12/igt@kms_plane_alpha_blend@constant-alpha-max.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-16/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-13/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_frontbuffer_tracking@psrhdr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-16/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-3/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-5/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-dg1-13/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-dg1-17/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-tglu-8/igt@perf_pmu@module-unload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-tglu-8/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9051/shard-rkl-4/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15656/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9051 -&gt; IGTPW_15656</li>
<li>Linux: CI_DRM_18977 -&gt; CI_DRM_18978</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18977: dc462ab791b686c48545c160ecc81be64f77a846 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18978: 6ed371d40ec5cba972c0bdcf7e61fcadc7b5e7b0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15656: 89316662f748dcb120575990ac96897c4755cb6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9051: 9051</p>

</body>
</html>

--===============6065245413003890548==--
