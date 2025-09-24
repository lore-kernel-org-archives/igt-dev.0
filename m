Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD36CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 16:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516A410E786;
	Wed, 24 Sep 2025 16:44:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203A510E05F;
 Wed, 24 Sep 2025 16:44:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2389348969499197289=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_tests_to_help_verify?=
 =?utf-8?q?_VF_migration_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 24 Sep 2025 16:44:58 -0000
Message-ID: <175873229808.362993.5086619966204286396@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250923211333.766147-1-matthew.brost@intel.com>
In-Reply-To: <20250923211333.766147-1-matthew.brost@intel.com>
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

--===============2389348969499197289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add tests to help verify VF migration (rev3)
URL   : https://patchwork.freedesktop.org/series/154616/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_17263_full -> IGTPW_13805_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13805_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13805_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13805_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-10/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-3.html

  
#### Warnings ####

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][2] ([i915#3555] / [i915#8228]) -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-1/igt@kms_hdr@static-toggle-suspend.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_13805_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_bad_reloc@negative-reloc-bltcopy:
    - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#3281]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@gem_bad_reloc@negative-reloc-bltcopy.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#7697])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_basic@multigpu-create-close.html

  * igt@gem_caching@writes:
    - shard-rkl:          [PASS][6] -> [DMESG-WARN][7] ([i915#12917] / [i915#12964])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-4/igt@gem_caching@writes.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@gem_caching@writes.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-8/igt@gem_ccs@ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy.html
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#3555] / [i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][12] ([i915#13356])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][13] ([i915#12392] / [i915#13356])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [PASS][14] -> [ABORT][15] ([i915#13427])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][16] ([i915#6335])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][17] ([i915#1099]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-snb7/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#280])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-10/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [PASS][19] -> [INCOMPLETE][20] ([i915#13390])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-5/igt@gem_eio@in-flight-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2-9:        NOTRUN -> [SKIP][21] ([i915#4812]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#4525])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-9/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fence@submit67:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#4812])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@gem_exec_fence@submit67.html
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#4812])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][25] ([i915#3539] / [i915#4852])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#3539] / [i915#4852])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#3539] / [i915#4852])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2-9:        NOTRUN -> [SKIP][28] +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-active:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#3281]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-active.html
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#3281]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-active.html
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#3281]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-12/igt@gem_exec_reloc@basic-gtt-active.html

  * igt@gem_exec_reloc@basic-write-gtt-noreloc:
    - shard-dg2-9:        NOTRUN -> [SKIP][32] ([i915#3281]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_exec_reloc@basic-write-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4537] / [i915#4812])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4537] / [i915#4812])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4812]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][36] -> [INCOMPLETE][37] ([i915#13356]) +1 other test incomplete
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-7/igt@gem_exec_suspend@basic-s3.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2-9:        NOTRUN -> [SKIP][38] ([i915#4860])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4860])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-x.html
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4860])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4860]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#2190])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#4613]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][44] ([i915#4613]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk5/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#4613]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4613])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@gem_lmem_swapping@smem-oom.html
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#4613])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-dg2-9:        NOTRUN -> [SKIP][48] ([i915#4077]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4077]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@gem_mmap_gtt@fault-concurrent-y.html
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4077]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-16/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4077]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@read:
    - shard-dg2-9:        NOTRUN -> [SKIP][52] ([i915#4083])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4083]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-6/igt@gem_mmap_wc@read-write.html
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4083]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@gem_mmap_wc@read-write.html
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4083]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-12/igt@gem_mmap_wc@read-write.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3282]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#3282]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_partial_pwrite_pread@reads.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3282]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-16/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#3282]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][60] ([i915#2658])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk1/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][61] ([i915#14702] / [i915#2658])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-dg2-9:        NOTRUN -> [SKIP][62] ([i915#3282])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-dg2-9:        NOTRUN -> [SKIP][63] ([i915#4270])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4270]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#13398])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          [PASS][66] -> [TIMEOUT][67] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4270])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][69] ([i915#5190] / [i915#8428])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#8428]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#5190] / [i915#8428]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4079]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4079])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#3297])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu-1:       NOTRUN -> [SKIP][75] ([i915#3297])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk10:        NOTRUN -> [ABORT][76] ([i915#5566])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk10/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#2527] / [i915#2856]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglu-1:       NOTRUN -> [SKIP][78] ([i915#2527] / [i915#2856]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#2856]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@gen9_exec_parse@shadow-peek.html
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#2527])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#2527])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@gen9_exec_parse@shadow-peek.html
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#2856])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-2/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2-9:        NOTRUN -> [SKIP][83] ([i915#2856])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#14118])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-4/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [PASS][85] -> [DMESG-WARN][86] ([i915#13029] / [i915#14545])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-8/igt@i915_module_load@reload-no-display.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#6412])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#7178])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-13/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#6412])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-2/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#6412])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-1/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#11681] / [i915#6621])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#6245])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-12/igt@i915_query@hwconfig_table.html
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#6245])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#6245])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@i915_query@hwconfig_table.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2-9:        NOTRUN -> [SKIP][95] ([i915#4212]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg1:          [PASS][96] -> [FAIL][97] ([i915#14888])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [FAIL][98] ([i915#14888]) +3 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][99] ([i915#14888])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-4.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#10333])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-3/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#1769] / [i915#3555])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2-9:        NOTRUN -> [SKIP][102] ([i915#1769] / [i915#3555])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#1769] / [i915#3555])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#5286]) +6 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-10/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][105] ([i915#5286]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][106] -> [FAIL][107] ([i915#5138])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][108] +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#3638])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3638])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-16/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4538] / [i915#5190]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-dg2-9:        NOTRUN -> [SKIP][112] ([i915#4538] / [i915#5190]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#6187])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4538])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#6095]) +24 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#10307] / [i915#6095]) +163 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#6095]) +46 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#6095]) +29 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][119] ([i915#10307] / [i915#6095]) +14 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#6095]) +69 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#12805])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#12805])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#6095]) +17 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][124] +280 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
    - shard-dg2-9:        NOTRUN -> [SKIP][125] ([i915#6095]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#6095]) +139 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#12313]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#14098] / [i915#6095]) +45 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][129] +148 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#3742]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-9:        NOTRUN -> [SKIP][131] ([i915#13784])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#13781]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#11151] / [i915#7828]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-read.html
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#11151] / [i915#7828]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2-9:        NOTRUN -> [SKIP][135] ([i915#11151] / [i915#7828]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#11151] / [i915#7828]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#11151] / [i915#7828]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#11151] / [i915#7828]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#11151] / [i915#7828]) +10 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-red-to-blue:
    - shard-rkl:          [PASS][140] -> [SKIP][141] ([i915#12655] / [i915#14544]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-3/igt@kms_color@ctm-red-to-blue.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_color@ctm-red-to-blue.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [PASS][142] -> [SKIP][143] ([i915#12655] / [i915#3555])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_color@deep-color.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#3116] / [i915#3299])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#3116] / [i915#3299])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm:
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#6944] / [i915#7116] / [i915#7118])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#6944] / [i915#9424]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@kms_content_protection@uevent.html
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#7118] / [i915#9424]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_content_protection@uevent.html
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#7116] / [i915#9424])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-14/igt@kms_content_protection@uevent.html
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [PASS][151] -> [SKIP][152] ([i915#14544]) +51 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][153] ([i915#13566]) +2 other tests fail
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#3555] / [i915#8814]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#3555]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#3555])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3555])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#13049]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][159] ([i915#12964]) +15 other tests dmesg-warn
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#13049])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][161] ([i915#3555])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#13049])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-rkl:          [PASS][163] -> [FAIL][164] ([i915#13566]) +3 other tests fail
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html
    - shard-tglu:         [PASS][165] -> [FAIL][166] ([i915#13566]) +3 other tests fail
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][167] ([i915#12358] / [i915#14152] / [i915#7882])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][168] ([i915#12358] / [i915#14152])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#13046] / [i915#5354]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#4103]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [PASS][171] -> [FAIL][172] ([i915#2346])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#4103])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#9723])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#9723])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-12/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#9723])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#9833])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#1769] / [i915#3555] / [i915#3804])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#3804])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#1257])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@kms_dp_aux_dev.html
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#1257])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#13707])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#3555] / [i915#3840]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-9/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#3555] / [i915#3840])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-9:        NOTRUN -> [SKIP][185] ([i915#3840] / [i915#9053])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#2065] / [i915#4854])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#1839])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_feature_discovery@display-3x.html
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#14544] / [i915#1839])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#9934])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#9934])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3637] / [i915#9934]) +6 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#3637] / [i915#9934]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#3637] / [i915#9934]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][194] ([i915#12745] / [i915#4839])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][195] ([i915#4839])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#9934]) +5 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-rkl:          [PASS][197] -> [SKIP][198] ([i915#14544] / [i915#3637]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_flip@flip-vs-panning-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-snb:          [PASS][199] -> [FAIL][200] ([i915#10826]) +1 other test fail
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-snb6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-snb4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3555] / [i915#8810] / [i915#8813])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#8810] / [i915#8813])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#2587] / [i915#2672] / [i915#3555])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#2672] / [i915#8813]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#2672]) +6 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#2672]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#2587] / [i915#2672]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#2587] / [i915#2672]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-rkl:          [PASS][211] -> [SKIP][212] ([i915#14544] / [i915#3555]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#2672] / [i915#3555]) +6 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#2587] / [i915#2672]) +6 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#2672] / [i915#3555]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#2672] / [i915#3555])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#2672] / [i915#3555]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#8708]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][220] +30 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#8708]) +13 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-9:        NOTRUN -> [SKIP][222] ([i915#8708]) +5 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#5354]) +13 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-9:        NOTRUN -> [SKIP][224] ([i915#5354]) +10 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-rkl:          [PASS][225] -> [SKIP][226] ([i915#14544] / [i915#1849] / [i915#5354]) +7 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#5439])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#5439])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#5439])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][230] +75 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#14544] / [i915#1849] / [i915#5354])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][232] +5 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#10055]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2-9:        NOTRUN -> [SKIP][234] ([i915#3458]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#3458]) +9 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3023]) +4 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#3458]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#1825]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#8708]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#1825]) +7 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-9:        NOTRUN -> [SKIP][241] ([i915#3555] / [i915#8228])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@bad-vsync-start:
    - shard-rkl:          [PASS][242] -> [SKIP][243] ([i915#14544] / [i915#3555] / [i915#8826])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@kms_invalid_mode@bad-vsync-start.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_invalid_mode@bad-vsync-start.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][244] ([i915#12394])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#12394])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-14/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#10656])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#10656])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#12394])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#12339])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#4816])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#4816])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#4816])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#1839]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#1839]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][255] +8 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - shard-glk10:        NOTRUN -> [SKIP][256] ([i915#11190]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk10/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][257] ([i915#12756] / [i915#13409] / [i915#13476]) +1 other test incomplete
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][258] ([i915#10647] / [i915#12169])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk5/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][259] ([i915#10647]) +1 other test fail
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk5/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-rkl:          [PASS][260] -> [SKIP][261] ([i915#14544] / [i915#7294]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-4/igt@kms_plane_alpha_blend@constant-alpha-mid.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-9:        NOTRUN -> [SKIP][262] ([i915#8821])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#13958])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#13958])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#13958]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#14259])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#12247])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-rkl:          [PASS][268] -> [SKIP][269] ([i915#14544] / [i915#8152])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-rkl:          [PASS][270] -> [SKIP][271] ([i915#14544] / [i915#3555] / [i915#8152])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-a:
    - shard-rkl:          [PASS][272] -> [SKIP][273] ([i915#12247] / [i915#14544]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-a.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#12247]) +4 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#12247] / [i915#6953])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b:
    - shard-snb:          NOTRUN -> [SKIP][276] +67 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-snb5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b.html
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#12247]) +3 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-rkl:          [PASS][278] -> [SKIP][279] ([i915#14544] / [i915#3555] / [i915#6953] / [i915#8152])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b:
    - shard-rkl:          [PASS][280] -> [SKIP][281] ([i915#12247] / [i915#14544] / [i915#8152]) +6 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#5354])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#9812])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#9292])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#9685])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-9:        NOTRUN -> [SKIP][286] ([i915#9685])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#8430])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][288] -> [SKIP][289] ([i915#9519]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#9519])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#14544] / [i915#9519])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#9519])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#9519]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-dg2:          [PASS][294] -> [SKIP][295] ([i915#9519])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-rkl:          [PASS][296] -> [SKIP][297] ([i915#14544] / [i915#9519])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@d3hot:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#6524])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-8/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#12316]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#11520])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#11520]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
    - shard-snb:          NOTRUN -> [SKIP][302] ([i915#11520]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-snb5/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#11520]) +8 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#11520] / [i915#14544])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#11520]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][306] ([i915#11520]) +7 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-9:        NOTRUN -> [SKIP][307] ([i915#11520]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][308] ([i915#11520]) +7 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#11520]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#9683])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#1072] / [i915#9732]) +4 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_psr@fbc-pr-primary-render.html
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#1072] / [i915#9732]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#1072] / [i915#9732]) +16 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][314] ([i915#1072] / [i915#9732]) +5 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#9688]) +7 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-1/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#9732]) +6 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#4077] / [i915#9688]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#9732]) +20 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#12755])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#4235])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#5190]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][322] ([i915#12755] / [i915#5190])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#12755])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#12755] / [i915#5190])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#5289])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#3555]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][327] ([i915#3555]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#8623])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@query-busy@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][329] -> [DMESG-WARN][330] ([i915#12964]) +46 other tests dmesg-warn
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@kms_vblank@query-busy@pipe-a-hdmi-a-1.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_vblank@query-busy@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@wait-forked-hang:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#14544]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_vblank@wait-forked-hang.html

  * igt@kms_vrr@lobf:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#11920])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg2-9:        NOTRUN -> [SKIP][333] ([i915#9906])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#3555] / [i915#9906])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#2437] / [i915#9412])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][336] ([i915#2437]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk5/igt@kms_writeback@writeback-fb-id.html

  * igt@perf_pmu@busy-accuracy-98@rcs0:
    - shard-tglu:         [PASS][337] -> [FAIL][338] ([i915#4349]) +1 other test fail
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-tglu-4/igt@perf_pmu@busy-accuracy-98@rcs0.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-5/igt@perf_pmu@busy-accuracy-98@rcs0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [PASS][339] -> [INCOMPLETE][340] ([i915#13356] / [i915#14242])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-glk6/igt@perf_pmu@rc6-suspend.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk5/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#3708])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@prime_vgem@basic-fence-flip.html
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#3708])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-read:
    - shard-dg2-9:        NOTRUN -> [SKIP][343] ([i915#3291] / [i915#3708])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][344] ([i915#12910]) +9 other tests fail
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-rkl:          [SKIP][345] ([i915#14544] / [i915#2582]) -> [PASS][346] +1 other test pass
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@fbdev@read.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@fbdev@read.html

  * igt@fbdev@write:
    - shard-dg2:          [SKIP][347] ([i915#2582]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@fbdev@write.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@fbdev@write.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][349] ([i915#5784]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg1-17/igt@gem_eio@reset-stress.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fence@syncobj-timeline-unused-fence:
    - shard-dg2:          [SKIP][351] ([i915#2575]) -> [PASS][352] +69 other tests pass
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_exec_fence@syncobj-timeline-unused-fence.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@gem_exec_fence@syncobj-timeline-unused-fence.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-dg1:          [DMESG-WARN][353] ([i915#4423]) -> [PASS][354] +1 other test pass
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg1-15/igt@gem_exec_suspend@basic-s3-devices.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          [TIMEOUT][355] ([i915#12964]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-7/igt@gem_pxp@create-valid-protected-context.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          [TIMEOUT][357] ([i915#12917] / [i915#12964]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([PASS][359], [PASS][360], [PASS][361], [FAIL][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [FAIL][374], [FAIL][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381]) ([i915#14957]) -> ([PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-10/igt@i915_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-8/igt@i915_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-10/igt@i915_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@i915_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-6/igt@i915_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-6/igt@i915_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-1/igt@i915_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-4/igt@i915_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-7/igt@i915_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-3/igt@i915_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-1/igt@i915_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-4/igt@i915_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-3/igt@i915_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-8/igt@i915_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-4/igt@i915_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@i915_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@i915_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-5/igt@i915_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-6/igt@i915_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@i915_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-5/igt@i915_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-8/igt@i915_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-7/igt@i915_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@i915_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@i915_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@i915_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@i915_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@i915_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@i915_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-10/igt@i915_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@i915_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@i915_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@i915_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@i915_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@i915_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@i915_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@i915_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@i915_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@i915_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@i915_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@i915_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@i915_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@i915_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-10/igt@i915_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@i915_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-rkl:          [SKIP][405] ([i915#13328]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@i915_pm_rpm@reg-read-ioctl.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-dg2:          [ABORT][407] -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-10/igt@i915_pm_rpm@system-suspend-devices.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg2:          [SKIP][409] ([i915#14962]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@i915_pm_rpm@system-suspend-execbuf.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][411] ([i915#7984]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-mtlp-1/igt@i915_power@sanity.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-3/igt@i915_power@sanity.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          [FAIL][413] ([i915#15024]) -> [PASS][414] +35 other tests pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@i915_selftest@live@objects.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@i915_selftest@live@objects.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [DMESG-FAIL][415] ([i915#12061]) -> [PASS][416] +1 other test pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-mtlp-4/igt@i915_selftest@live@workarounds.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-1/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg1:          [DMESG-WARN][417] ([i915#4391] / [i915#4423]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg1-17/igt@i915_suspend@basic-s2idle-without-i915.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][419] ([i915#5138]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][421] ([i915#14544]) -> [PASS][422] +44 other tests pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_color@ctm-0-75:
    - shard-rkl:          [SKIP][423] ([i915#12655] / [i915#14544]) -> [PASS][424] +2 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_color@ctm-0-75.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_color@ctm-0-75.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [FAIL][425] ([i915#13566]) -> [PASS][426] +3 other tests pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          [FAIL][427] ([i915#13566]) -> [PASS][428] +1 other test pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [SKIP][429] ([i915#3555]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-rkl:          [SKIP][431] ([i915#14544] / [i915#14561]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_fbcon_fbt@fbc.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-snb:          [TIMEOUT][433] ([i915#14033] / [i915#14350]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [TIMEOUT][435] ([i915#14033]) -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-rkl:          [SKIP][437] ([i915#14544] / [i915#3637]) -> [PASS][438] +4 other tests pass
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_flip@bo-too-big-interruptible.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-rkl:          [SKIP][439] ([i915#14544] / [i915#3555]) -> [PASS][440] +2 other tests pass
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-rkl:          [SKIP][441] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][442] +8 other tests pass
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_frontbuffer_tracking@basic.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][443] -> [PASS][444] +11 other tests pass
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_invalid_mode@bad-hsync-start:
    - shard-rkl:          [SKIP][445] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][446] +1 other test pass
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-start.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-3/igt@kms_invalid_mode@bad-hsync-start.html

  * igt@kms_invalid_mode@overflow-vrefresh:
    - shard-rkl:          [SKIP][447] ([i915#14544] / [i915#8826]) -> [PASS][448]
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_invalid_mode@overflow-vrefresh.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-rkl:          [SKIP][449] ([i915#11190] / [i915#14544]) -> [PASS][450] +2 other tests pass
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-rkl:          [SKIP][451] ([i915#14544] / [i915#8825]) -> [PASS][452]
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_plane@plane-panning-top-left.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - shard-rkl:          [SKIP][453] ([i915#14544] / [i915#7294]) -> [PASS][454] +1 other test pass
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-min.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_plane_alpha_blend@constant-alpha-min.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-rkl:          [SKIP][455] ([i915#14544] / [i915#3555] / [i915#8152]) -> [PASS][456]
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-rkl:          [SKIP][457] ([i915#12247] / [i915#14544]) -> [PASS][458]
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-rkl:          [SKIP][459] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][460]
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [SKIP][461] ([i915#14958] / [i915#9423]) -> [PASS][462] +4 other tests pass
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-rkl:          [SKIP][463] ([i915#14544] / [i915#1849]) -> [PASS][464]
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_pm_rpm@cursor-dpms.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][465] ([i915#9519]) -> [PASS][466] +1 other test pass
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][467] ([i915#14960]) -> [PASS][468] +1 other test pass
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][469] ([i915#14544] / [i915#9519]) -> [PASS][470]
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-rkl:          [SKIP][471] ([i915#14544] / [i915#6524]) -> [PASS][472]
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_prime@basic-crc-vgem.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-rkl:          [SKIP][473] ([i915#11521] / [i915#14544]) -> [PASS][474]
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_setmode@basic:
    - shard-snb:          [FAIL][475] ([i915#5465]) -> [PASS][476] +2 other tests pass
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-snb5/igt@kms_setmode@basic.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-snb7/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][477] ([i915#9196]) -> [PASS][478] +1 other test pass
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-rkl:          [DMESG-WARN][479] ([i915#12917] / [i915#12964]) -> [PASS][480]
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-snb:          [ABORT][481] ([i915#14871]) -> [PASS][482] +1 other test pass
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-snb4/igt@kms_vblank@ts-continuation-suspend.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-snb7/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1:
    - shard-snb:          [DMESG-WARN][483] -> [PASS][484]
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-snb4/igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-snb7/igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-dg2:          [SKIP][485] ([i915#14959]) -> [PASS][486] +4 other tests pass
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@perf_pmu@all-busy-check-all.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-mtlp:         [FAIL][487] ([i915#4349]) -> [PASS][488] +2 other tests pass
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-mtlp-1/igt@perf_pmu@busy-double-start@vecs0.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [DMESG-FAIL][489] ([i915#12964]) -> [PASS][490]
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@perf_pmu@rc6-suspend.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@perf_pmu@rc6-suspend.html

  * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
    - shard-dg2:          [SKIP][491] ([i915#14958]) -> [PASS][492] +61 other tests pass
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html

  * igt@sysfs_heartbeat_interval@mixed@vecs0:
    - shard-rkl:          [DMESG-WARN][493] ([i915#12964]) -> [PASS][494] +25 other tests pass
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@sysfs_heartbeat_interval@mixed@vecs0.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@sysfs_heartbeat_interval@mixed@vecs0.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][495] ([i915#2575]) -> [SKIP][496] ([i915#8411])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][497] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][498] ([i915#3555] / [i915#9323])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          [SKIP][499] ([i915#2575]) -> [SKIP][500] ([i915#8555])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          [SKIP][501] ([i915#14544] / [i915#280]) -> [SKIP][502] ([i915#280]) +1 other test skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@gem_ctx_sseu@engines.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          [SKIP][503] ([i915#280]) -> [SKIP][504] ([i915#14544] / [i915#280])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][505] ([i915#4525]) -> [SKIP][506] ([i915#14544] / [i915#4525]) +1 other test skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@gem_exec_balancer@parallel-balancer.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          [SKIP][507] ([i915#14544] / [i915#4525]) -> [SKIP][508] ([i915#4525])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          [SKIP][509] ([i915#2575]) -> [SKIP][510] ([i915#4812])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_exec_balancer@sliced.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          [SKIP][511] ([i915#14544] / [i915#6334]) -> [SKIP][512] ([i915#6334]) +1 other test skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@gem_exec_capture@capture-invisible.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          [SKIP][513] ([i915#2575]) -> [SKIP][514] ([i915#3539] / [i915#4852])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          [SKIP][515] ([i915#14544] / [i915#3281]) -> [SKIP][516] ([i915#3281]) +3 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][517] ([i915#3281]) -> [SKIP][518] ([i915#14544] / [i915#3281]) +6 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          [SKIP][519] ([i915#2575]) -> [SKIP][520] ([i915#3281]) +6 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg2:          [SKIP][521] ([i915#2575]) -> [SKIP][522] ([i915#4860]) +1 other test skip
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_fenced_exec_thrash@too-many-fences.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          [SKIP][523] ([i915#4613]) -> [SKIP][524] ([i915#14544] / [i915#4613]) +2 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-random.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          [SKIP][525] ([i915#14544] / [i915#4613]) -> [SKIP][526] ([i915#4613]) +2 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@gem_lmem_swapping@verify.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_vme:
    - shard-dg2:          [SKIP][527] ([i915#2575]) -> [SKIP][528] ([i915#284])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_media_vme.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-write:
    - shard-dg2:          [SKIP][529] ([i915#2575]) -> [SKIP][530] ([i915#4077]) +4 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_mmap_gtt@basic-write.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@gem_mmap_gtt@basic-write.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          [SKIP][531] ([i915#2575]) -> [SKIP][532] ([i915#4083]) +2 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_mmap_wc@copy.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-rkl:          [SKIP][533] ([i915#3282]) -> [SKIP][534] ([i915#14544] / [i915#3282]) +5 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-3/igt@gem_partial_pwrite_pread@reads-uncached.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          [SKIP][535] ([i915#2575]) -> [SKIP][536] ([i915#3282]) +3 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncached.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          [SKIP][537] ([i915#14544] / [i915#3282]) -> [SKIP][538] ([i915#3282]) +5 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-dg2:          [SKIP][539] ([i915#2575]) -> [SKIP][540] ([i915#4270]) +1 other test skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_pxp@create-regular-buffer.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [SKIP][541] ([i915#13717]) -> [TIMEOUT][542] ([i915#12917] / [i915#12964])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          [SKIP][543] ([i915#4270]) -> [TIMEOUT][544] ([i915#12917] / [i915#12964])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          [SKIP][545] ([i915#2575] / [i915#5190]) -> [SKIP][546] ([i915#5190] / [i915#8428]) +3 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          [SKIP][547] ([i915#14544] / [i915#8411]) -> [SKIP][548] ([i915#8411]) +1 other test skip
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][549] ([i915#8411]) -> [SKIP][550] ([i915#14544] / [i915#8411])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          [SKIP][551] ([i915#2575]) -> [SKIP][552] ([i915#4885])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          [SKIP][553] ([i915#3297]) -> [SKIP][554] ([i915#14544] / [i915#3297]) +2 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-5/igt@gem_userptr_blits@create-destroy-unsync.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          [SKIP][555] ([i915#2575]) -> [SKIP][556] ([i915#3297] / [i915#4880])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          [SKIP][557] ([i915#2575]) -> [SKIP][558] ([i915#3297]) +3 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          [SKIP][559] ([i915#14544] / [i915#3297]) -> [SKIP][560] ([i915#3297])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          [SKIP][561] ([i915#14544]) -> [SKIP][562] +12 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@gen7_exec_parse@chained-batch.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@gen7_exec_parse@chained-batch.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-dg2:          [SKIP][563] ([i915#2575]) -> [SKIP][564] +1 other test skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gen7_exec_parse@load-register-reg.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg2:          [SKIP][565] ([i915#2575]) -> [SKIP][566] ([i915#2856]) +1 other test skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@gen9_exec_parse@bb-chained.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          [SKIP][567] ([i915#2527]) -> [SKIP][568] ([i915#14544] / [i915#2527]) +2 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-3/igt@gen9_exec_parse@bb-start-param.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-rkl:          [SKIP][569] ([i915#14544] / [i915#2527]) -> [SKIP][570] ([i915#2527]) +1 other test skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_drm_fdinfo@virtual-busy-all:
    - shard-dg2:          [SKIP][571] ([i915#14959]) -> [SKIP][572] ([i915#14118])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@i915_drm_fdinfo@virtual-busy-all.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@i915_drm_fdinfo@virtual-busy-all.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          [SKIP][573] ([i915#2575]) -> [SKIP][574] ([i915#11681])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@i915_pm_rps@thresholds-park.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [FAIL][575] ([i915#15024]) -> [DMESG-FAIL][576] ([i915#12061]) +1 other test dmesg-fail
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@i915_selftest@live@workarounds.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@i915_selftest@live@workarounds.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          [SKIP][577] ([i915#14544] / [i915#7707]) -> [SKIP][578] ([i915#7707])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@intel_hwmon@hwmon-write.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          [SKIP][579] ([i915#14958]) -> [SKIP][580] ([i915#4212])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][581] ([i915#1769] / [i915#3555]) -> [SKIP][582] ([i915#14544])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-dg1:          [SKIP][583] ([i915#4538] / [i915#5286]) -> [SKIP][584] ([i915#4423] / [i915#4538] / [i915#5286])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg1-13/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][585] ([i915#14544]) -> [SKIP][586] ([i915#5286]) +4 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][587] ([i915#5286]) -> [SKIP][588] ([i915#14544]) +2 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          [SKIP][589] ([i915#14544]) -> [SKIP][590] ([i915#3638]) +1 other test skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-rkl:          [SKIP][591] ([i915#3638]) -> [SKIP][592] ([i915#14544]) +1 other test skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          [SKIP][593] ([i915#5190]) -> [SKIP][594] ([i915#4538] / [i915#5190]) +7 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          [SKIP][595] -> [SKIP][596] ([i915#14544]) +12 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][597] -> [SKIP][598] ([i915#10307] / [i915#6095]) +7 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][599] ([i915#14098] / [i915#6095]) -> [SKIP][600] ([i915#14544]) +11 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-rkl:          [SKIP][601] ([i915#14544]) -> [SKIP][602] ([i915#14098] / [i915#6095]) +8 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][603] -> [SKIP][604] ([i915#12313]) +1 other test skip
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-rkl:          [SKIP][605] ([i915#12313]) -> [SKIP][606] ([i915#14544]) +1 other test skip
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][607] ([i915#14544]) -> [SKIP][608] ([i915#12313]) +1 other test skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][609] ([i915#12805]) -> [SKIP][610] ([i915#14544])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][611] ([i915#6095]) -> [SKIP][612] ([i915#14098] / [i915#6095])
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][613] ([i915#14098] / [i915#6095]) -> [SKIP][614] ([i915#6095]) +3 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          [SKIP][615] ([i915#14544] / [i915#3742]) -> [SKIP][616] ([i915#3742])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_cdclk@mode-transition.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2:          [SKIP][617] ([i915#14958]) -> [SKIP][618] +1 other test skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_chamelium_color@ctm-0-50.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          [SKIP][619] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][620] ([i915#11151] / [i915#7828]) +3 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg1:          [SKIP][621] ([i915#11151] / [i915#4423] / [i915#7828]) -> [SKIP][622] ([i915#11151] / [i915#7828])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg1-15/igt@kms_chamelium_frames@dp-crc-fast.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2:          [SKIP][623] ([i915#14958]) -> [SKIP][624] ([i915#11151] / [i915#7828]) +2 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          [SKIP][625] ([i915#11151] / [i915#7828]) -> [SKIP][626] ([i915#11151] / [i915#14544] / [i915#7828]) +7 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          [SKIP][627] ([i915#14958]) -> [SKIP][628] ([i915#3299])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_content_protection@dp-mst-type-0.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          [SKIP][629] ([i915#14544]) -> [SKIP][630] ([i915#9424])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_content_protection@lic-type-1.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][631] ([i915#7118]) -> [SKIP][632] ([i915#14544])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_content_protection@srm.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          [SKIP][633] ([i915#14958]) -> [SKIP][634] ([i915#3555]) +2 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][635] ([i915#13566]) -> [DMESG-WARN][636] ([i915#12964])
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          [SKIP][637] ([i915#14958]) -> [SKIP][638] ([i915#13049]) +2 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x512.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][639] ([i915#14544]) -> [SKIP][640] ([i915#13049])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][641] ([i915#14544]) -> [SKIP][642] ([i915#3555]) +6 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-rkl:          [SKIP][643] ([i915#13049]) -> [SKIP][644] ([i915#14544])
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          [SKIP][645] ([i915#4103]) -> [SKIP][646] ([i915#11190] / [i915#14544])
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2:          [SKIP][647] ([i915#14958]) -> [SKIP][648] ([i915#13046] / [i915#5354]) +2 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][649] ([i915#14544]) -> [FAIL][650] ([i915#2346])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          [SKIP][651] -> [SKIP][652] ([i915#13749])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_dp_link_training@non-uhbr-mst.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          [SKIP][653] ([i915#13749]) -> [SKIP][654] ([i915#14544])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-sst.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          [SKIP][655] ([i915#13707]) -> [SKIP][656] ([i915#14544])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          [SKIP][657] -> [SKIP][658] ([i915#8812])
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-gtt.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][659] ([i915#14544]) -> [SKIP][660] ([i915#3840])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          [SKIP][661] -> [SKIP][662] ([i915#3840])
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          [SKIP][663] ([i915#3555] / [i915#3840]) -> [SKIP][664] ([i915#14544])
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          [SKIP][665] ([i915#14544]) -> [SKIP][666] ([i915#3555] / [i915#3840])
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][667] ([i915#9337]) -> [SKIP][668] ([i915#14544] / [i915#9337])
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          [SKIP][669] ([i915#14544] / [i915#658]) -> [SKIP][670] ([i915#658])
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_feature_discovery@psr2.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          [SKIP][671] ([i915#2575]) -> [SKIP][672] ([i915#4881])
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_fence_pin_leak.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          [SKIP][673] ([i915#9934]) -> [SKIP][674] ([i915#14544] / [i915#9934]) +5 other tests skip
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-7/igt@kms_flip@2x-blocking-wf_vblank.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          [SKIP][675] ([i915#14544] / [i915#9934]) -> [SKIP][676] ([i915#9934]) +7 other tests skip
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_flip@2x-plain-flip.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          [SKIP][677] ([i915#14958]) -> [SKIP][678] ([i915#9934]) +5 other tests skip
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2:          [SKIP][679] -> [SKIP][680] ([i915#2672] / [i915#3555])
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-rkl:          [SKIP][681] ([i915#2672] / [i915#3555]) -> [SKIP][682] ([i915#14544] / [i915#3555]) +3 other tests skip
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          [SKIP][683] ([i915#14544] / [i915#3555]) -> [SKIP][684] ([i915#2672] / [i915#3555]) +1 other test skip
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2:          [SKIP][685] ([i915#5190]) -> [SKIP][686] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][687] -> [SKIP][688] ([i915#8708]) +7 other tests skip
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][689] ([i915#1825]) -> [SKIP][690] ([i915#14544] / [i915#1849] / [i915#5354]) +26 other tests skip
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          [SKIP][691] -> [SKIP][692] ([i915#5354]) +17 other tests skip
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][693] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][694]
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][695] ([i915#3458]) -> [SKIP][696] ([i915#10433] / [i915#3458]) +6 other tests skip
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          [SKIP][697] ([i915#3023]) -> [SKIP][698] ([i915#14544] / [i915#1849] / [i915#5354]) +22 other tests skip
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][699] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][700] ([i915#1825]) +26 other tests skip
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-dg1:          [SKIP][701] ([i915#3458]) -> [SKIP][702] ([i915#3458] / [i915#4423])
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][703] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][704] ([i915#5439])
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][705] -> [SKIP][706] ([i915#3458]) +6 other tests skip
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][707] ([i915#10433] / [i915#3458]) -> [SKIP][708] ([i915#3458])
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][709] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][710] ([i915#3023]) +13 other tests skip
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg1:          [SKIP][711] ([i915#4423]) -> [SKIP][712]
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          [SKIP][713] ([i915#1187] / [i915#12713]) -> [SKIP][714] ([i915#12713])
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-16/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][715] ([i915#3555] / [i915#8228]) -> [SKIP][716] ([i915#14544]) +1 other test skip
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@kms_hdr@invalid-hdr.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          [SKIP][717] ([i915#14544]) -> [SKIP][718] ([i915#3555] / [i915#8228])
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          [SKIP][719] ([i915#10656]) -> [SKIP][720] ([i915#10656] / [i915#14544])
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-2/igt@kms_joiner@basic-big-joiner.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          [SKIP][721] ([i915#12339]) -> [SKIP][722] ([i915#12339] / [i915#14544])
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_joiner@basic-ultra-joiner.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-rkl:          [SKIP][723] ([i915#14544]) -> [DMESG-WARN][724] ([i915#12964]) +2 other tests dmesg-warn
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_plane_lowres@tiling-x.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          [SKIP][725] ([i915#14958]) -> [SKIP][726] ([i915#3555] / [i915#8821])
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          [SKIP][727] ([i915#14544]) -> [SKIP][728] ([i915#13958])
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-rkl:          [SKIP][729] ([i915#13958]) -> [SKIP][730] ([i915#14544])
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-yf.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][731] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][732] ([i915#12247]) +3 other tests skip
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][733] ([i915#12247] / [i915#14544]) -> [SKIP][734] ([i915#12247]) +1 other test skip
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][735] ([i915#12247]) -> [SKIP][736] ([i915#12247] / [i915#14544])
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][737] ([i915#12247]) -> [SKIP][738] ([i915#12247] / [i915#14544] / [i915#8152]) +1 other test skip
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          [SKIP][739] ([i915#14544] / [i915#5354]) -> [SKIP][740] ([i915#5354])
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          [SKIP][741] ([i915#14544] / [i915#9685]) -> [SKIP][742] ([i915#9685])
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          [SKIP][743] ([i915#9685]) -> [SKIP][744] ([i915#14544] / [i915#9685]) +1 other test skip
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][745] ([i915#14544] / [i915#9519]) -> [SKIP][746] ([i915#9519])
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][747] ([i915#14960]) -> [SKIP][748] ([i915#9519])
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][749] ([i915#9519]) -> [SKIP][750] ([i915#14544] / [i915#9519])
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-dg2:          [SKIP][751] ([i915#14960]) -> [SKIP][752]
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_pm_rpm@modeset-pc8-residency-stress.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          [SKIP][753] ([i915#15026]) -> [SKIP][754] ([i915#6524] / [i915#6805])
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_prime@basic-crc-vgem.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          [SKIP][755] -> [SKIP][756] ([i915#11520]) +3 other tests skip
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][757] ([i915#11520] / [i915#14544]) -> [SKIP][758] ([i915#11520]) +5 other tests skip
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][759] ([i915#11520]) -> [SKIP][760] ([i915#11520] / [i915#14544]) +6 other tests skip
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          [SKIP][761] -> [SKIP][762] ([i915#9683]) +1 other test skip
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_psr2_su@page_flip-p010.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-rkl:          [SKIP][763] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][764] ([i915#1072] / [i915#9732]) +14 other tests skip
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_psr@fbc-psr-primary-page-flip.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          [SKIP][765] ([i915#1072] / [i915#9732]) -> [SKIP][766] ([i915#1072] / [i915#4423] / [i915#9732])
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg1-12/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-13/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          [SKIP][767] ([i915#1072] / [i915#9732]) -> [SKIP][768] ([i915#1072] / [i915#14544] / [i915#9732]) +17 other tests skip
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-4/igt@kms_psr@pr-sprite-mmap-gtt.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          [SKIP][769] -> [SKIP][770] ([i915#1072] / [i915#9732]) +9 other tests skip
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_psr@psr2-primary-mmap-gtt.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          [SKIP][771] ([i915#14958]) -> [SKIP][772] ([i915#12755])
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][773] ([i915#14544]) -> [SKIP][774] ([i915#5289])
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          [SKIP][775] ([i915#5289]) -> [SKIP][776] ([i915#14544])
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-rkl:          [SKIP][777] ([i915#3555]) -> [SKIP][778] ([i915#14544] / [i915#3555])
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-7/igt@kms_setmode@clone-exclusive-crtc.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          [SKIP][779] ([i915#14544]) -> [SKIP][780] ([i915#9906])
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_vrr@max-min.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          [SKIP][781] ([i915#9906]) -> [SKIP][782] ([i915#14544]) +1 other test skip
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          [SKIP][783] ([i915#14958]) -> [SKIP][784] ([i915#2437]) +1 other test skip
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_writeback@writeback-check-output.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_writeback@writeback-check-output.html
    - shard-rkl:          [SKIP][785] ([i915#14544] / [i915#2437]) -> [SKIP][786] ([i915#2437])
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@kms_writeback@writeback-check-output.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2:          [SKIP][787] ([i915#14958]) -> [SKIP][788] ([i915#2437] / [i915#9412])
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [SKIP][789] ([i915#2434]) -> [SKIP][790] ([i915#14544] / [i915#2434])
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-8/igt@perf@mi-rpc.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@perf@mi-rpc.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][791] ([i915#14544] / [i915#3708]) -> [SKIP][792] ([i915#3708])
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          [SKIP][793] ([i915#3708]) -> [SKIP][794] ([i915#14544] / [i915#3708])
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-5/igt@prime_vgem@fence-read-hang.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2:          [SKIP][795] ([i915#14958]) -> [SKIP][796] ([i915#9917])
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-rkl:          [SKIP][797] ([i915#14544] / [i915#9917]) -> [SKIP][798] ([i915#9917])
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10333]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14561
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14871
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#14957]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14957
  [i915#14958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14958
  [i915#14959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14959
  [i915#14960]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14960
  [i915#14962]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14962
  [i915#15024]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15024
  [i915#15026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15026
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
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
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
  [i915#9292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8550 -> IGTPW_13805
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_17263: af3cdefd0a1ad2dad29fcde0854ccbce494cc28a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13805: 13805
  IGT_8550: 4f8c7886ad02e116804ec08714f17bce1755c6e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/index.html

--===============2389348969499197289==
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
<tr><td><b>Series:</b></td><td>Add tests to help verify VF migration (rev3)=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/154616/">https://patchwork.freedesktop.org/series/154616/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13805/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13805/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_17263_full -&gt; IGTPW_13805_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13805_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_13805_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/index=
.html</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1380=
5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-3:<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-10/igt@kms_hdr@static-toggle-suspend@pi=
pe-a-dp-3.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_hdr@static-toggle-suspend:<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13805/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html"=
>ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13805_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_bad_reloc@negative-reloc-bltcopy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@gem_bad_reloc@negative-reloc-blt=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-4/igt@gem_caching@writes.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@=
gem_caching@writes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-8/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@gem_ccs@suspend-resume.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-com=
pressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1380=
5/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427">i915=
#13427</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-snb7/igt@gem_ctx_persistence@legacy-engines=
-persistence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-10/igt@gem_ctx_sseu@mmap-args.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-5/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl=
-3/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_exec_balancer@bonded-true-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-9/igt@gem_exec_balancer@parallel-out-f=
ence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@gem_exec_fence@submit67.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_exec_fence@submit67.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_exec_flush@basic-uc-pro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@gem_exec_flush@basic-uc-rw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_exec_params@secure-non-root.h=
tml">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-active.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3281">i915#3281</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-active.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3281">i915#3281</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-12/igt@gem_exec_reloc@basic-gtt-active.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-noreloc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_exec_reloc@basic-write-gtt-no=
reloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-=
chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-c=
hain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@gem_exec_schedule@preempt-queue-=
chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-7/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl=
-3/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_fence_thrash@bo-copy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify=
-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4860">i915#4860</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify=
-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fe=
nces.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@gem_huc_copy@huc-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/21=
90">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-r=
andom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk5/igt@gem_lmem_swapping@massive-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@gem_lmem_swapping@smem-oom.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_lmem_swapping@smem-oom.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_mmap_gtt@cpuset-medium-copy-o=
dd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@gem_mmap_gtt@fault-concurrent-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-16/igt@gem_mmap_gtt@fault-concurrent-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@gem_mmap_gtt@zero-extend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_mmap_wc@read.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i9=
15#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-6/igt@gem_mmap_wc@read-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@gem_mmap_wc@read-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
83">i915#4083</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-12/igt@gem_mmap_wc@read-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3282">i915#3282</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_partial_pwrite_pread@reads.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3282">i915#3282</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-16/igt@gem_partial_pwrite_pread@reads.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@gem_partial_pwrite_pread@write-s=
noop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk1/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk1/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_pwrite@basic-self.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
2">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_pxp@create-regular-context-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_pxp@display-protected-crc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-=
2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13805/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-2.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12964">i915#12964</a>) +2 other tests timeout</l=
i>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-af=
ter-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-y-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-1/igt@gem_render_copy@y-tiled-to-vebox-=
yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-3/igt@gem_set_tiling_vs_blt@tiled-to-u=
ntiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@gem_userptr_blits@unsync-overlap=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk10/igt@gen9_exec_parse@allowed-single.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@gen9_exec_parse@batch-zero-lengt=
h.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@gen9_exec_parse@shadow-peek.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-2/igt@gen9_exec_parse@shadow-peek.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@gen9_exec_parse@valid-registers.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-4/igt@i915_drm_fdinfo@virtual-busy-han=
g-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-8/igt@i915_module_load@reload-no-display.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/=
shard-dg2-5/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i91=
5#13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@i915_module_load@resize-bar.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6412">i915#6412</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-13/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7178">i915#7178</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-2/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6412">i915#6412</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-1/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-12/igt@i915_query@hwconfig_table.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6245">i915#6245</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@i915_query@hwconfig_table.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6245">i915#6245</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@i915_query@hwconfig_table.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_addfb_basic@addfb25-framebuff=
er-vs-set-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13805/shard-dg1-18/igt@kms_async_flips@alternate-sync-async-flip.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk1/igt@kms_async_flips@alternate-sync-asy=
nc-flip-atomic@pipe-c-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +3 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_async_flips@alternate-sync-a=
sync-flip@pipe-c-hdmi-a-4.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-3/igt@kms_async_flips@test-cursor.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/10333">i915#10333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_atomic_transition@plane-all-m=
odeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-10/igt@kms_big_fb@4-tiled-32bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13805/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp=
-rotate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-=
180.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-16/igt@kms_big_fb@y-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_ccs@bad-pixel-format-4-tiled=
-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_ccs@bad-pixel-format-y-tiled=
-ccs@pipe-c-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +163 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +46 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-6/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-y-tiled=
-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-til=
ed-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6095">i915#6095</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk10/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-mc-ccs.html">SKIP</a> +280 other tests skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +139 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-c=
cs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +45 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk1/igt@kms_cdclk@mode-transition.html">SK=
IP</a> +148 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3742">i915#3742</a>) +1 other test skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_cdclk@mode-transition-all-out=
puts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13784">i915#13784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b=
-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_chamelium_edid@hdmi-edid-rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_chamelium_edid@hdmi-edid-stre=
ss-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_chamelium_frames@dp-crc-fast.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd-for-eac=
h-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@kms_chamelium_hpd@vga-hpd-with-e=
nabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-3/igt@kms_color@ctm-red-to-blue.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl=
-6/igt@kms_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_color@deep-color.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-8/i=
gt@kms_color@deep-color.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-2/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_content_protection@uevent.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-14/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-10/igt@kms_content_protection@uevent.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x256.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
805/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-25=
6x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-3=
2x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8814">i915#8814</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@kms_cursor_crc@cursor-onscreen-3=
2x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x=
128@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +15 other tests dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_cursor_crc@cursor-rapid-movem=
ent-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805=
/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13=
566</a>) +3 other tests fail</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-64x21.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1380=
5/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-64x21.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#=
13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk6/igt@kms_cursor_crc@cursor-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk6/igt@kms_cursor_crc@cursor-suspend@pipe=
-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_cursor_legacy@2x-long-cursor-=
vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3805/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">=
i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-10/igt@kms_cursor_legacy@short-busy-fl=
ip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9723">i915#9723</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-12/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@kms_dp_aux_dev.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915=
#1257</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_dp_aux_dev.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i91=
5#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-9/igt@kms_dsc@dsc-with-bpc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3840">i915#3840</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2065">i915#2065</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_feature_discovery@display-3x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_feature_discovery@display-3x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-m=
odeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_flip@2x-flip-vs-dpms-off-vs-=
modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-=
modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other t=
ests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-=
modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk1/igt@kms_flip@2x-flip-vs-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ab-hdm=
i-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_flip@2x-single-buffer-flip-vs=
-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_flip@flip-vs-panning-interruptible.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
805/shard-rkl-6/igt@kms_flip@flip-vs-panning-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-snb6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3805/shard-snb4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826"=
>i915#10826</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i=
915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">=
i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#267=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp=
-ytile-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i=
915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672"=
>i915#2672</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
 +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-=
offscren-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-stridechange.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13805/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-stridechange.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5439">i915#5439</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354=
">i915#5354</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/10055">i915#10055</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscren-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +9 other tests skip=
</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +4 other tests skip=
</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests=
 skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@kms_invalid_mode@bad-vsync-start.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/sh=
ard-rkl-6/igt@kms_invalid_mode@bad-vsync-start.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8826">i915#8826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12394">i915#12394</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-14/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12394">i915#12394</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-8/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/10656">i915#10656</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@kms_joiner@basic-force-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10656">i915#10656</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_joiner@basic-force-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12394">i915#12394</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-3/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4816">i915#4816</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_multipipe_modeset@basic-max-p=
ipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4816">i915#4816</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-p=
ipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4816">i915#4816</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1839">i915#1839</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_pipe_b_c_ivb@disable-pipe-b-e=
nable-pipe-c.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk10/igt@kms_pipe_crc_basic@hang-read-crc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11190">i915#11190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-cr=
c@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915=
#13476</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk5/igt@kms_plane_alpha_blend@constant-alp=
ha-max.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk5/igt@kms_plane_alpha_blend@constant-alp=
ha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-4/igt@kms_plane_alpha_blend@constant-alpha-mid.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13805/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-mid.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/7294">i915#7294</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_plane_lowres@tiling-y.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-3/igt@kms_plane_multiple@2x-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-2/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_plane_scaling@plane-downscale=
-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-=
with-pixel-format.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-=
unity-scaling-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-modifiers.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@plane-scaler=
-with-clipping-clamping-modifiers.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe=
-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-modifiers@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@plane=
-scaler-with-clipping-clamping-modifiers@pipe-a.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-snb5/igt@kms_plane_scaling@planes-downscale=
-factor-0-5@pipe-b.html">SKIP</a> +67 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-75.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@planes-unity-sc=
aling-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i91=
5#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-75@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_scaling@planes-u=
nity-scaling-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8152">i915#8152</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-2/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-5/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9292">i915#9292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i=
915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i=
915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8=
/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no=
-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9519">i915#9519</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no=
-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9519">i915#9519</a>) +1 other test skip</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-d=
g2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-r=
kl-6/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#951=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-8/igt@kms_prime@d3hot.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i9=
15#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12316">i915#12316</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-u=
pdate-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-snb5/igt@kms_psr2_sf@fbc-pr-cursor-plane-up=
date-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-updat=
e-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk1/igt@kms_psr2_sf@pr-overlay-primary-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_psr2_sf@pr-primary-plane-upda=
te-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk10/igt@kms_psr2_sf@psr2-cursor-plane-mov=
e-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-8/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_psr@fbc-pr-primary-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@kms_psr@fbc-pr-primary-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_psr@fbc-psr-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_psr@fbc-psr-primary-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-1/igt@kms_psr@pr-sprite-blt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/96=
88">i915#9688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_psr@psr-sprite-mmap-gtt@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4077">i915#4077</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-6/igt@kms_psr@psr2-cursor-plane-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_rotation_crc@bad-pixel-format=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_rotation_crc@exhaust-fences.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12755">i915#12755</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-10/igt@kms_rotation_crc@primary-yf-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-c=
enter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-4/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@kms_vblank@query-busy@pipe-a-hdmi-a-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_138=
05/shard-rkl-7/igt@kms_vblank@query-busy@pipe-a-hdmi-a-1.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1296=
4">i915#12964</a>) +46 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_vblank@wait-forked-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@kms_vrr@max-min.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i91=
5#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-1/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-3/igt@kms_writeback@writeback-check-ou=
tput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-glk5/igt@kms_writeback@writeback-fb-id.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2437">i915#2437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98@rcs0:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-tglu-4/igt@perf_pmu@busy-accuracy-98@rcs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/sha=
rd-tglu-5/igt@perf_pmu@busy-accuracy-98@rcs0.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +=
1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-glk6/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-glk5/igt@=
perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242">i915#14242</a>)</=
li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg1-18/igt@prime_vgem@basic-fence-flip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@prime_vgem@basic-fence-flip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-dg2-9/igt@prime_vgem@basic-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/329=
1">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe=
-off@numvfs-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@fbdev@read.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915=
#2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13805/shard-rkl-8/igt@fbdev@read.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@fbdev@write.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg=
2-11/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg1-17/igt@gem_eio@reset-stress.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805=
/shard-dg1-18/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-unused-fence:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_exec_fence@syncobj-timeline-unused-fence=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@gem_exec_fence@syncobj-timeline-un=
used-fence.html">PASS</a> +69 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg1-15/igt@gem_exec_suspend@basic-s3-devices.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13805/shard-dg1-18/igt@gem_exec_suspend@basic-s3-devices.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-7/igt@gem_pxp@create-valid-protected-context.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_pxp@create-valid-protected-conte=
xt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@gem_pxp@verify-pxp-execution-after-suspend-re=
sume.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_pxp@v=
erify-pxp-execution-after-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_17263/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-8/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_17263/shard-dg2-10/igt@i915_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/s=
hard-dg2-11/igt@i915_module_load@load.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-6/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_17263/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-1/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_17263/shard-dg2-4/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shar=
d-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-3/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_17263/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-4/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_17263/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2=
-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-4/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17=
263/shard-dg2-11/igt@i915_module_load@load.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@i915_modu=
le_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_17263/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-6/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_17263/shard-dg2-11/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1726=
3/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17263/shard-dg2-8/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_17263/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14957">i915#1=
4957</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13805/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13805/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/sha=
rd-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-10/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13805/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@i915_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13805/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/s=
hard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13805/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13805/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-=
1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@i915_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1380=
5/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-10/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13805/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-3/igt@i=
915_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328">i91=
5#13328</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13805/shard-rkl-6/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-10/igt@i915_pm_rpm@system-suspend-devices.html">ABO=
RT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1380=
5/shard-dg2-3/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@i915_pm_rpm@system-suspend-execbuf.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4962">i915#14962</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13805/shard-dg2-7/igt@i915_pm_rpm@system-suspend-execbuf.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-mtlp-1/igt@i915_power@sanity.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/sh=
ard-mtlp-3/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@i915_selftest@live@objects.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15024">i9=
15#15024</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13805/shard-dg2-6/igt@i915_selftest@live@objects.html">PASS</a> +35 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-mtlp-4/igt@i915_selftest@live@workarounds.html">DMESG-F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12061">i915#12061</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-mtlp-1/igt@i915_selftest@live@workarounds.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg1-17/igt@i915_suspend@basic-s2idle-without-i915.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4391">i915#4391</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@i915_suspend@basic-=
s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13805/shard-mtlp-5/igt@kms_big_fb@4-tiled-max=
-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_big_fb@x-tile=
d-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +44 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13805/shard-rkl-5/igt@kms_color@ctm-0-75.html">PASS</a> +2 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-128x42.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-128x42.ht=
ml">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-h=
dmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_cursor_crc@cursor-sli=
ding-256x85@pipe-a-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13805/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
61">i915#14561</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13805/shard-rkl-8/igt@kms_fbcon_fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html=
">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14033">i915#14033</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14350">i915#14350</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-snb7/igt@kms_flip@2x-flip-vs=
-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-v=
ga1-hdmi-a1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14033">i915#14033</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-snb7/igt@kms_flip@2x-flip-vs=
-suspend-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_flip@bo-too-big-interruptible.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3637">i915#3637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_flip@bo-too-big-interrupti=
ble.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp=
-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@=
kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">PASS<=
/a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_frontbuffer_tra=
cking@basic.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur=
-indfb-move.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13805/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-prims=
crn-cur-indfb-move.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-start.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-3/igt@kms_invalid_mode@=
bad-hsync-start.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8826">i915#8826</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_invalid_mode@overflow-vre=
fresh.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequ=
ence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_pipe_crc=
_basic@nonblocking-crc-frame-sequence.html">PASS</a> +2 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_plane@plane-panning-top-left.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_plane@plane-panning-top-lef=
t.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-min.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/7294">i915#7294</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_plane_alpha_blend@c=
onstant-alpha-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#815=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1380=
5/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pix=
el-formats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/sha=
rd-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-fo=
rmats@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152"=
>i915#8152</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13805/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-cla=
mping-pixel-formats@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-=
5-upscale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14958">i915#14958</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@km=
s_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">PASS</a> +4=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1849">i915#1849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13805/shard-rkl-7/igt@kms_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805=
/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14960">i915#14960</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13805/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9519">i915#9519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6524">i915#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_prime@basic-crc-vgem.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11521">i915#11521</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_properties@plane-pr=
operties-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-snb5/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shar=
d-snb7/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-ed=
p-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9196">i915#9196</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13805/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-=
leak@pipe-d-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-rpm.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_vblank@ts-contin=
uation-dpms-rpm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-snb4/igt@kms_vblank@ts-continuation-suspend.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
871">i915#14871</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13805/shard-snb7/igt@kms_vblank@ts-continuation-suspend.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-snb4/igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi=
-a-1.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13805/shard-snb7/igt@kms_vblank@ts-continuation-suspend@pipe=
-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-check-all:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14959">i=
915#14959</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13805/shard-dg2-4/igt@perf_pmu@all-busy-check-all.html">PASS</a> +4 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-mtlp-1/igt@perf_pmu@busy-double-start@vecs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/434=
9">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13805/shard-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@perf_pmu@rc6-suspend.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i91=
5#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13805/shard-rkl-4/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-all-for-submit-delayed-submit:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed=
-submit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14958">i915#14958</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@syncobj_timeline@wait-all=
-for-submit-delayed-submit.html">PASS</a> +61 other tests pass</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vecs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@sysfs_heartbeat_interval@mixed@vecs0.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13805/shard-rkl-2/igt@sysfs_heartbeat_interval@mixed@vecs=
0.html">PASS</a> +25 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13805/shard-dg2-7/igt@api_intel_bb@blit-reloc-purge-cache.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_ccs@block-copy-c=
ompressed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13805/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13805/shard-rkl-8/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/=
shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#28=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@gem_exec_balancer@parallel-balancer.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13805/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_exec_balancer@parallel-b=
b-first.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_exec_balancer@sliced.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3805/shard-dg2-4/igt@gem_exec_balancer@sliced.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@gem_exec_capture@capture-invisible.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6334">i915#6334</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_exec_capture@capture-invi=
sible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13805/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-r=
ead-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13805/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"=
>i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13805/shard-dg2-5/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i91=
5#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_fenced_exec_thrash@too-many-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-dg2-11/igt@gem_fenced_exec_thrash@too-many-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-random.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13805/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13805/shard-rkl-4/igt@gem_lmem_swapping@verify.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">=
i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_media_vme.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-=
dg2-5/igt@gem_media_vme.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_mmap_gtt@basic-write.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3805/shard-dg2-1/igt@gem_mmap_gtt@basic-write.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_mmap_wc@copy.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/sha=
rd-dg2-4/igt@gem_mmap_wc@copy.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-3/igt@gem_partial_pwrite_pread@reads-uncached.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncached.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13805/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncache=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13805/shard-rkl-8/igt@gem_pwrite@basic-exhaustion.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_pxp@create-regular-buffer.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13805/shard-dg2-6/igt@gem_pxp@create-regular-buffer.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#=
4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717"=
>i915#13717</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13805/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917=
">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4270">i915#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@gem_pxp@reject-modify-context-pro=
tection-off-1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@gem_render_copy@y-=
tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@gem_set_tiling_vs_blt@til=
ed-to-untiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13805/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13805/shard-dg2-7/igt@gem_softpin@evict-snoop-interruptible.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-5/igt@gem_userptr_blits@create-destroy-unsync.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overl=
ap-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_13805/shard-dg2-6/igt@gem_userptr_blits@map-fixed=
-invalidate-overlap-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"=
>i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13805/shard-dg2-3/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i91=
5#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@gem_userptr_blits@uns=
ync-unmap-after-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@gen7_exec_parse@chained-batch.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13805/shard-rkl-2/igt@gen7_exec_parse@chained-batch.html">SKIP</a> +12=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gen7_exec_parse@load-register-reg.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/25=
75">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13805/shard-dg2-7/igt@gen7_exec_parse@load-register-reg.html">SKIP<=
/a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i91=
5#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13805/shard-dg2-1/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-3/igt@gen9_exec_parse@bb-start-param.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">=
i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13805/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@gen9_exec_parse@unaligned-acces=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@i915_drm_fdinfo@virtual-busy-all.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/149=
59">i915#14959</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13805/shard-dg2-11/igt@i915_drm_fdinfo@virtual-busy-all.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@i915_pm_rps@thresholds-park.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13805/shard-dg2-5/igt@i915_pm_rps@thresholds-park.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#116=
81</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@i915_selftest@live@workarounds.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15024=
">i915#15024</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13805/shard-dg2-6/igt@i915_selftest@live@workarounds.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/7707">i915#7707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-rkl-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i9=
15#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14958">i915#14958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13805/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-r=
kl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-interna=
l-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg1-13/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13805/shard-dg1-15/igt@kms_big_fb@4-tiled-16bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_big_fb@4-tiled-max-h=
w-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_big_fb@4-tiled-max-h=
w-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13805/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/36=
38">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13805/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/51=
90">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13805/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/453=
8">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl=
-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.=
html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13805/shard-dg2-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_ccs@bad-rotation-=
90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +11 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_ccs@ccs-on-another-bo-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.ht=
ml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13805/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2313">i915#12313</a>) +1 other test skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bm=
g-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-ln=
l-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-r=
c-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-5/igt@kms_ccs@crc-s=
prite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#1=
4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/i=
gt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3742">i915#3742</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_cdclk@mode-transition.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742=
">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14958">=
i915#14958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13805/shard-dg2-11/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/i=
gt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#1=
1151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg1-15/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/111=
51">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-13/igt@kms_chamelium_f=
rames@dp-crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_chamelium_frames@hdmi-crc-nonplanar-form=
ats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14958">i915#14958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc=
-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#=
11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"=
>i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_content_protection@dp-mst-type-0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14958">i915#14958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_content_protection@lic-type-1.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13805/shard-rkl-4/igt@kms_content_protection@lic-type-1.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/94=
24">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_content_protection@srm.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915=
#7118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13805/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-32x10.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14958">i915#14958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-32x10.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14958">i915#14958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x512.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13805/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32x10.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tr=
ansitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14958">i915#14958</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-5/igt@kms_cursor_legacy@curso=
rb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-legac=
y.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/=
shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#137=
49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/137=
49">i915#13749</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13805/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13707">i915#13707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/=
shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13805/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1380=
5/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#38=
40</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3840">i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13805/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i9=
15#9337</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13805/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_feature_discovery@psr2.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658"=
>i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_fence_pin_leak.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805=
/shard-dg2-1/igt@kms_fence_pin_leak.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-7/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">=
i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13805/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13805/shard-rkl-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915=
#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-v=
s-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14958">i915#14958</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_flip@=
2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i9=
15#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32b=
pp-yftileccs-upscaling.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_flip_scaled_crc@flip-3=
2bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt=
@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rk=
l-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downsca=
ling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bp=
p-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-7/igt@kms_flip_s=
caled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i9=
15#2672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/184=
9">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5354">i915#5354</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-ind=
fb-plflip-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +17 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptra=
ck-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl=
-8/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-=
pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-4/igt@kms_frontbuff=
er_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10=
433</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3458">i915#3458</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3023">i915#3023</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13805/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +22 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard=
-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1825">i915#1825</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-stridechange=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13805/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-s=
tridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3458">i915#3458</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_front=
buffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri=
-shrfb-draw-render.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-=
1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-=
indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg2-11/ig=
t@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-=
indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/sha=
rd-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3023">i915#3023</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri=
-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-dg1-19/igt@kms_frontbuffer=
_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i9=
15#1187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12713">i915#12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13805/shard-dg1-16/igt@kms_hdr@brightness-with-hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13805/shard-rkl-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13805/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i9=
15#10656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13805/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10=
656</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">=
i915#12339</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13805/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i91=
5#12339</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13805/shard-rkl-2/igt@kms_plane_lowres@tiling-x.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#=
12964</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14958">i9=
15#14958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13805/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13805/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i=
915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958=
">i915#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13805/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-=
with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#815=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1380=
5/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotatio=
n@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-ro=
tation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@km=
s_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i91=
5#12247</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_sca=
ling@plane-upscale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#122=
47</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_plane_sca=
ling@plane-upscale-factor-0-25-with-rotation@pipe-b.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#122=
47</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@kms_pm_backlight@basic-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9685">i915#9685</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/sha=
rd-rkl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9519">i915#9519</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-n=
on-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14960">i915#=
14960</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13805/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">=
i915#9519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13805/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_pm_rpm@modeset-pc8-residency-stress.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14960">i915#14960</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_pm_rpm@modeset-pc8-residency-stre=
ss.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15026">i915=
#15026</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13805/shard-dg2-1/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805"=
>i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.=
html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13805/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-2/igt@kms_ps=
r2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#115=
20</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-ar=
ea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-d=
g2-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/107=
2">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-7/igt@kms_psr@fbc-psr-=
primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg1-12/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/107=
2">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13805/shard-dg1-13/igt@kms_psr@fbc-psr2-sprite-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-4/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915=
#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072=
">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shar=
d-dg2-5/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#=
9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14958">i915#14958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13805/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13805/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-7/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13805/shard-rkl-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/sha=
rd-rkl-2/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906"=
>i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13805/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_writeback@writeback-check-output.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14958">i915#14958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13805/shard-dg2-8/igt@kms_writeback@writeback-check-output.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2437">i915#2437</a>) +1 other test skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@kms_writeback@writeback-check-output.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2437">i915#2437</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_13805/shard-rkl-4/igt@kms_writeback@writeback-che=
ck-output.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@kms_writeback@writeback-fb-id-xrgb2101010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14958">i915#14958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13805/shard-dg2-11/igt@kms_writeback@writeback-fb-id-xrgb=
2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-8/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl=
-6/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13805/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/37=
08">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-5/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915=
#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13805/shard-rkl-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/37=
08">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-dg2-11/igt@sriov_basic@enable-vfs-bind-unbind-each.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14958">i915#14958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13805/shard-dg2-11/igt@sriov_basic@enable-vfs-bind-unbind-e=
ach.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17263/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_13805/shard-rkl-8/igt@sriov_basic@enable-vfs-b=
ind-unbind-each.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8550 -&gt; IGTPW_13805</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17263: af3cdefd0a1ad2dad29fcde0854ccbce494cc28a @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_13805: 13805<br />
  IGT_8550: 4f8c7886ad02e116804ec08714f17bce1755c6e4 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2389348969499197289==--
