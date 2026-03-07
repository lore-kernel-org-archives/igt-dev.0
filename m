Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2790F55100
	for <igt-dev@archiver.kernel.org>; Sat,  7 Mar 2026 16:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499AF10E17F;
	Sat,  7 Mar 2026 16:12:38 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEC710E045;
 Sat,  7 Mar 2026 16:12:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1927024488387856224=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_igt=3A_reduce_igt=5Fcrtc?=
 =?utf-8?q?=5Ffor=5Fpipe=28=29_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 07 Mar 2026 16:12:36 -0000
Message-ID: <177289995619.329958.8393536514668947847@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1772803372.git.jani.nikula@intel.com>
In-Reply-To: <cover.1772803372.git.jani.nikula@intel.com>
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

--===============1927024488387856224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: igt: reduce igt_crtc_for_pipe() usage
URL   : https://patchwork.freedesktop.org/series/162757/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18104_full -> IGTPW_14690_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14690_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14690_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14690_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@perf_pmu@rc6-suspend:
    - shard-tglu-1:       NOTRUN -> [ABORT][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         [SKIP][3] ([i915#4816]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-mtlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2:          [SKIP][5] ([i915#4816]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          [SKIP][7] ([i915#1839] / [i915#4816]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          [SKIP][9] ([i915#1839]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-18/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  
Known issues
------------

  Here are the changes found in IGTPW_14690_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#3281]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#13008])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][19] -> [INCOMPLETE][20] ([i915#13356])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#14544] / [i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][23] ([i915#6335])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html
    - shard-dg2:          [PASS][24] -> [FAIL][25] ([i915#15454])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-3/igt@gem_create@create-ext-cpu-access-big.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#6335])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][27] ([i915#1099])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-snb7/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#280])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@gem_ctx_sseu@mmap-args.html
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#280]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#4771])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#8555])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-7/igt@gem_exec_balancer@noheartbeat.html
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#8555]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@gem_exec_balancer@noheartbeat.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#8555])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-tglu-1:       NOTRUN -> [SKIP][37] ([i915#4525])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#4525]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@gem_exec_balancer@parallel-bb-first.html
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#4525])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-7/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu-1:       NOTRUN -> [SKIP][40] ([i915#6334]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][41] ([i915#11965]) +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3539])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-7/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3281]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@gem_exec_reloc@basic-cpu-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3281]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#3281]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-6/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#14544] / [i915#3281]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4812])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-snb:          NOTRUN -> [SKIP][50] +87 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-snb5/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4860]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4860]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-16/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4860]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-glk:          NOTRUN -> [SKIP][54] ([i915#4613]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk8/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#4613] / [i915#7582])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#4613] / [i915#7582])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4613])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#4613]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#284])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-16/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-short:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4077]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-8/igt@gem_mmap_gtt@basic-short.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4077]) +7 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4083]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3282]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3282]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#3282]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-3/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3282]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@exhaustion:
    - shard-glk11:        NOTRUN -> [WARN][67] ([i915#2658])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4270]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#8428]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#5190] / [i915#8428]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4079])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@gem_render_tiled_blits@basic.html
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4079])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@gem_render_tiled_blits@basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4079])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#8411])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][75] ([i915#13809])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk9/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#3297]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3297])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu-1:       NOTRUN -> [SKIP][78] ([i915#3297] / [i915#3323])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3282] / [i915#3297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#2527]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#2527] / [i915#2856]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#2856])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-6/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#2856])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][85] ([i915#2527] / [i915#2856]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#2527]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#14544] / [i915#2527])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#11527]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@i915_drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#6412])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][90] ([i915#13790] / [i915#2681]) +1 other test warn
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][91] ([i915#4817] / [i915#7443])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html
    - shard-glk:          [PASS][92] -> [INCOMPLETE][93] ([i915#4817]) +1 other test incomplete
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-glk2/igt@i915_suspend@basic-s3-without-i915.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4077]) +6 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [PASS][95] -> [ABORT][96] ([i915#15140])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@i915_suspend@sysfs-reader.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#7707])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][98] ([i915#7707])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg1:          NOTRUN -> [FAIL][99] ([i915#14888]) +1 other test fail
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [PASS][100] -> [FAIL][101] ([i915#5956]) +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-mtlp:         [PASS][102] -> [FAIL][103] ([i915#5956]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-mtlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#5286]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][105] ([i915#5286]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#5286]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#4538] / [i915#5286]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3638]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#3638]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#3828])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4538] / [i915#5190]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][112] +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4538]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#6095]) +211 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#6095]) +79 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][116] +149 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#12313])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][118] +29 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#6095]) +39 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#12805])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#6095]) +74 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#6095]) +59 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#6095]) +19 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][124] ([i915#15582]) +2 other tests incomplete
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#12313]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#12313])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#12313])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#12313])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#14544] / [i915#6095]) +9 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#14098] / [i915#14544] / [i915#6095]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#14098] / [i915#6095]) +52 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#10307] / [i915#6095]) +114 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#3742])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#11151] / [i915#14544] / [i915#7828])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#11151] / [i915#7828])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#11151] / [i915#7828]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#11151] / [i915#7828]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#11151] / [i915#7828]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-1:
    - shard-mtlp:         NOTRUN -> [FAIL][140] ([i915#15733]) +25 other tests fail
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-1.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#6944] / [i915#7118] / [i915#9424])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#6944])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#6944] / [i915#9424])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#15330]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#15330] / [i915#3116] / [i915#3299]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#15330]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#15330])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#15330])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#15330])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#6944] / [i915#9424])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#6944] / [i915#7118])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#6944])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#13049])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#3555]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][155] ([i915#13566]) +1 other test fail
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][156] -> [FAIL][157] ([i915#13566]) +1 other test fail
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][158] -> [FAIL][159] ([i915#13566]) +3 other tests fail
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3555])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@kms_cursor_crc@cursor-random-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#3555] / [i915#8814])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#13049])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#3555]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][164] ([i915#12358] / [i915#14152] / [i915#7882])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][165] ([i915#12358] / [i915#14152])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][166] +11 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#9723])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#13749])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#13748])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#13707])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#13707])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#13707])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#13707])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#13707])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#3555] / [i915#3840])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3840] / [i915#9053])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][177] ([i915#9878])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk9/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-rkl:          [PASS][178] -> [INCOMPLETE][179] ([i915#9878])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3469]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3955]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3469]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#3469]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#1839]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@kms_feature_discovery@display-2x.html
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#1839])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#1839]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#1839]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_feature_discovery@display-2x.html
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#1839]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#9337])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#9934])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#3637] / [i915#9934])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#3637] / [i915#9934]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-10/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#9934])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#8381])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][195] ([i915#12745] / [i915#4839])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk10/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-snb:          [PASS][196] -> [TIMEOUT][197] ([i915#14033] / [i915#14350])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][198] -> [TIMEOUT][199] ([i915#14033])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][200] ([i915#4839])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk10/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#9934]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#9934]) +5 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#3637] / [i915#9934]) +4 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][204] -> [FAIL][205] ([i915#10826])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][206] ([i915#10826])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#15643])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#15643]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#15643]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#3555] / [i915#8810] / [i915#8813])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#8810] / [i915#8813])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#14544] / [i915#15643])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#15643]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#15643]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#15643]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#15643] / [i915#5190])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#15104]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][218] +29 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][219] +51 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#1825]) +29 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#8708]) +12 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#8708]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#14544] / [i915#1825]) +5 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#15104])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#14544] / [i915#15102] / [i915#3023]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#15102] / [i915#3458]) +6 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][227] +26 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#5354]) +10 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#1825]) +10 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#8708]) +3 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#15102] / [i915#3458]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#5439])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#9766])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#9766])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#15102]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#15104]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#15102])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-glk:          NOTRUN -> [SKIP][238] +428 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#15102]) +19 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#15102] / [i915#3023]) +10 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#15102]) +9 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#12713])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [PASS][243] -> [SKIP][244] ([i915#3555] / [i915#8228])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_hdr@static-toggle.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#12713] / [i915#3555] / [i915#8228])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8228])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-1/igt@kms_hdr@static-toggle-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8228])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#3555] / [i915#8228])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#3555] / [i915#8228]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#14544] / [i915#15460])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#13688])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#15460])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#15458])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#6301])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#14712])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#15709])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#15709]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#15608]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#15709])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#15709])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#15608]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#15709]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-rkl:          [PASS][263] -> [INCOMPLETE][264] ([i915#14412]) +1 other test incomplete
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][265] ([i915#12178])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][266] ([i915#7862]) +1 other test fail
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk11:        NOTRUN -> [FAIL][267] ([i915#10647] / [i915#12169]) +1 other test fail
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [FAIL][268] ([i915#10647]) +3 other tests fail
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#3555]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#13958])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#14259])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#14259])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#14259])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-2/igt@kms_plane_multiple@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#14259])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-8/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#14259])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#15329] / [i915#3555])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#15329]) +6 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#12343])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#9812])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#5354])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][281] ([i915#9812])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#3828])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#15739])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#8430])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@package-g7:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#15403])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg2:          NOTRUN -> [SKIP][286] +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-5/igt@kms_pm_rpm@pc8-residency.html
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#14544]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#6524])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#11520]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#11520]) +9 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#9808])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#12316]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-glk10:        NOTRUN -> [SKIP][293] ([i915#11520])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][294] ([i915#11520]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][295] ([i915#11520]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-snb5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#11520]) +5 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#11520]) +7 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#11520] / [i915#14544]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][299] ([i915#11520]) +10 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk9/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#11520]) +4 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#1072] / [i915#14544] / [i915#9732])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-mmap-cpu.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#9732]) +16 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-2/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#1072] / [i915#9732]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@fbc-psr-cursor-render@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#9688]) +4 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@kms_psr@fbc-psr-cursor-render@edp-1.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#9732]) +7 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#1072] / [i915#9732]) +19 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#1072] / [i915#9732]) +12 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#9685])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#9685])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-16/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#9685])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#9685])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#5190])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#5289])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#5289])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#5289])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#5289])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][317] ([i915#5289])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#3555]) +3 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][319] ([i915#13179]) +1 other test abort
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][320] ([i915#13179]) +1 other test abort
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#8623])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][322] ([i915#12276]) +1 other test incomplete
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#15243] / [i915#3555]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-4/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#9906])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#9906])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#9906]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#9906])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#8808] / [i915#9906])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#2434])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@perf@mi-rpc.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [PASS][330] -> [FAIL][331] ([i915#15520]) +2 other tests fail
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@perf_pmu@most-busy-idle-check-all.html
    - shard-dg1:          [PASS][332] -> [FAIL][333] ([i915#15520]) +1 other test fail
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all.html
    - shard-mtlp:         [PASS][334] -> [FAIL][335] ([i915#15520]) +1 other test fail
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][336] ([i915#13356])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#8516])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#3708])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-4/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#3708]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#14544] / [i915#9917])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#9917])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
    - shard-tglu-1:       NOTRUN -> [FAIL][342] ([i915#12910]) +8 other tests fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

  
#### Possible fixes ####

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][343] ([i915#11713]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-tglu-2/igt@gem_exec_big@single.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-10/igt@gem_exec_big@single.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-dg1:          [FAIL][345] ([i915#15734]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-17/igt@gem_lmem_swapping@smem-oom.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [CRASH][347] ([i915#5493]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][349] ([i915#5566]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk8/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [DMESG-WARN][351] ([i915#13029] / [i915#14545]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-5/igt@i915_module_load@reload-no-display.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-5/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          [DMESG-WARN][353] ([i915#13029] / [i915#14545]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-12/igt@i915_module_load@reload-no-display.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-rkl:          [INCOMPLETE][355] ([i915#13356]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-rkl:          [ABORT][357] ([i915#15131]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [INCOMPLETE][359] ([i915#4817]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-glk5/igt@i915_suspend@debugfs-reader.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][361] ([i915#15733] / [i915#5138]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][363] ([i915#14694] / [i915#15582]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-rkl:          [FAIL][365] ([i915#13566]) -> [PASS][366] +1 other test pass
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][367] ([i915#13566]) -> [PASS][368] +1 other test pass
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          [SKIP][369] ([i915#3555] / [i915#8228]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [INCOMPLETE][371] ([i915#12756] / [i915#13476]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][373] ([i915#13476]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][375] ([i915#14544] / [i915#15073]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][377] ([i915#15073]) -> [PASS][378] +1 other test pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          [SKIP][379] ([i915#15073]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][381] ([i915#15073]) -> [PASS][382] +4 other tests pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg1:          [DMESG-WARN][383] ([i915#4423]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-14/igt@kms_pm_rpm@system-suspend-modeset.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@perf_pmu@semaphore-busy@vcs0:
    - shard-mtlp:         [FAIL][385] ([i915#4349]) -> [PASS][386] +3 other tests pass
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vcs0.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@perf_pmu@semaphore-busy@vcs0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [FAIL][387] ([i915#4349]) -> [PASS][388] +3 other tests pass
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-18/igt@perf_pmu@semaphore-busy@vcs1.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-dg2:          [FAIL][389] ([i915#4349]) -> [PASS][390] +5 other tests pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-3/igt@perf_pmu@semaphore-busy@vecs0.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@perf_pmu@semaphore-busy@vecs0.html

  
#### Warnings ####

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          [SKIP][391] ([i915#14544] / [i915#7697]) -> [SKIP][392] ([i915#7697])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          [SKIP][393] ([i915#3281]) -> [SKIP][394] ([i915#14544] / [i915#3281]) +3 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-5/igt@gem_exec_reloc@basic-wc-read-noreloc.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-rkl:          [SKIP][395] ([i915#14544] / [i915#3281]) -> [SKIP][396] ([i915#3281]) +2 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-noreloc.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          [SKIP][397] ([i915#14544] / [i915#2190]) -> [SKIP][398] ([i915#2190])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@gem_huc_copy@huc-copy.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-rkl:          [SKIP][399] ([i915#14544] / [i915#4613]) -> [SKIP][400] ([i915#4613]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          [SKIP][401] ([i915#4613]) -> [SKIP][402] ([i915#14544] / [i915#4613]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@gem_lmem_swapping@parallel-multi.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          [SKIP][403] ([i915#3282]) -> [SKIP][404] ([i915#14544] / [i915#3282]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@gem_partial_pwrite_pread@reads.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pread@bench:
    - shard-rkl:          [SKIP][405] ([i915#14544] / [i915#3282]) -> [SKIP][406] ([i915#3282])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@gem_pread@bench.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@gem_pread@bench.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [SKIP][407] ([i915#13717]) -> [SKIP][408] ([i915#13717] / [i915#14544])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          [SKIP][409] ([i915#3297]) -> [SKIP][410] ([i915#14544] / [i915#3297]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-rkl:          [SKIP][411] ([i915#2527]) -> [SKIP][412] ([i915#14544] / [i915#2527])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@gen9_exec_parse@basic-rejected-ctx-param.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          [SKIP][413] ([i915#6245]) -> [SKIP][414] ([i915#14544] / [i915#6245])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@i915_query@hwconfig_table.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@i915_query@hwconfig_table.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          [SKIP][415] ([i915#9531]) -> [SKIP][416] ([i915#14544] / [i915#9531])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][417] ([i915#5286]) -> [SKIP][418] ([i915#14544] / [i915#5286]) +3 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][419] ([i915#14544] / [i915#5286]) -> [SKIP][420] ([i915#5286]) +2 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          [SKIP][421] ([i915#14544] / [i915#3638]) -> [SKIP][422] ([i915#3638]) +2 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][423] ([i915#14544] / [i915#3828]) -> [SKIP][424] ([i915#3828])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][425] ([i915#3638]) -> [SKIP][426] ([i915#14544] / [i915#3638]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][427] -> [SKIP][428] ([i915#14544]) +6 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-rkl:          [SKIP][429] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][430] ([i915#14098] / [i915#6095]) +4 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][431] ([i915#6095]) -> [SKIP][432] ([i915#14544] / [i915#6095]) +3 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][433] ([i915#14544] / [i915#6095]) -> [SKIP][434] ([i915#6095])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          [INCOMPLETE][435] ([i915#14694] / [i915#15582]) -> [INCOMPLETE][436] ([i915#15582])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][437] ([i915#14098] / [i915#6095]) -> [SKIP][438] ([i915#14098] / [i915#14544] / [i915#6095]) +7 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-rkl:          [SKIP][439] ([i915#11151] / [i915#7828]) -> [SKIP][440] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-7/igt@kms_chamelium_frames@dp-frame-dump.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][441] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][442] ([i915#11151] / [i915#7828]) +2 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          [SKIP][443] ([i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][444] ([i915#14544] / [i915#6944] / [i915#7118] / [i915#9424])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_content_protection@atomic-dpms.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-rkl:          [SKIP][445] ([i915#14544] / [i915#6944] / [i915#9424]) -> [SKIP][446] ([i915#6944] / [i915#9424]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_content_protection@content-type-change.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-rkl:          [SKIP][447] ([i915#6944]) -> [SKIP][448] ([i915#14544] / [i915#6944])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@kms_content_protection@legacy-hdcp14.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][449] ([i915#6944] / [i915#9424]) -> [SKIP][450] ([i915#9433])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-18/igt@kms_content_protection@mei-interface.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-rkl:          [SKIP][451] ([i915#3555]) -> [SKIP][452] ([i915#14544] / [i915#3555]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][453] ([i915#13049]) -> [SKIP][454] ([i915#13049] / [i915#14544]) +1 other test skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-dg1:          [SKIP][455] ([i915#13049]) -> [SKIP][456] ([i915#13049] / [i915#4423])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          [SKIP][457] ([i915#13049] / [i915#14544]) -> [SKIP][458] ([i915#13049])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][459] ([i915#4103]) -> [SKIP][460] ([i915#14544] / [i915#4103]) +1 other test skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-rkl:          [SKIP][461] ([i915#14544]) -> [SKIP][462] +9 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][463] ([i915#9723]) -> [SKIP][464] ([i915#14544] / [i915#9723])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          [SKIP][465] ([i915#3555] / [i915#3804]) -> [SKIP][466] ([i915#14544] / [i915#3555] / [i915#3804])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][467] ([i915#3804]) -> [SKIP][468] ([i915#14544] / [i915#3804])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          [SKIP][469] ([i915#14544] / [i915#3840]) -> [SKIP][470] ([i915#3840])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          [SKIP][471] ([i915#3555] / [i915#3840]) -> [SKIP][472] ([i915#14544] / [i915#3555] / [i915#3840])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          [SKIP][473] ([i915#14544] / [i915#3840] / [i915#9053]) -> [SKIP][474] ([i915#3840] / [i915#9053])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          [SKIP][475] ([i915#14544] / [i915#9934]) -> [SKIP][476] ([i915#9934]) +4 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-rkl:          [SKIP][477] ([i915#9934]) -> [SKIP][478] ([i915#14544] / [i915#9934])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-rkl:          [SKIP][479] ([i915#15643]) -> [SKIP][480] ([i915#14544] / [i915#15643]) +1 other test skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-rkl:          [SKIP][481] ([i915#14544] / [i915#1825]) -> [SKIP][482] ([i915#1825]) +14 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-rkl:          [SKIP][483] ([i915#15102]) -> [SKIP][484] ([i915#14544] / [i915#15102]) +2 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][485] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][486] ([i915#15102] / [i915#3023]) +3 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][487] ([i915#1825]) -> [SKIP][488] ([i915#14544] / [i915#1825]) +12 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg1:          [SKIP][489] -> [SKIP][490] ([i915#4423]) +1 other test skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-dg2:          [SKIP][491] ([i915#15102] / [i915#3458]) -> [SKIP][492] ([i915#10433] / [i915#15102] / [i915#3458]) +3 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          [SKIP][493] ([i915#14544] / [i915#15102]) -> [SKIP][494] ([i915#15102]) +1 other test skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][495] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][496] ([i915#15102] / [i915#3458]) +2 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-rkl:          [SKIP][497] ([i915#15102] / [i915#3023]) -> [SKIP][498] ([i915#14544] / [i915#15102] / [i915#3023]) +7 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [INCOMPLETE][499] ([i915#15436]) -> [SKIP][500] ([i915#3555] / [i915#8228])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][501] ([i915#15709]) -> [SKIP][502] ([i915#14544] / [i915#15709]) +2 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-rkl:          [SKIP][503] ([i915#14544] / [i915#15709]) -> [SKIP][504] ([i915#15709]) +1 other test skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          [SKIP][505] ([i915#9685]) -> [SKIP][506] ([i915#14544] / [i915#9685])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [SKIP][507] ([i915#15128]) -> [FAIL][508] ([i915#15752])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          [SKIP][509] ([i915#8430]) -> [SKIP][510] ([i915#14544] / [i915#8430])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][511] ([i915#11520]) -> [SKIP][512] ([i915#11520] / [i915#14544]) +2 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][513] ([i915#11520] / [i915#14544]) -> [SKIP][514] ([i915#11520]) +2 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          [SKIP][515] ([i915#14544] / [i915#9683]) -> [SKIP][516] ([i915#9683])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          [SKIP][517] ([i915#9683]) -> [SKIP][518] ([i915#14544] / [i915#9683])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][519] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][520] ([i915#1072] / [i915#9732]) +8 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg1:          [SKIP][521] ([i915#1072] / [i915#4423] / [i915#9732]) -> [SKIP][522] ([i915#1072] / [i915#9732])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-17/igt@kms_psr@pr-primary-page-flip.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-rkl:          [SKIP][523] ([i915#1072] / [i915#9732]) -> [SKIP][524] ([i915#1072] / [i915#14544] / [i915#9732]) +11 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-1/igt@kms_psr@psr-cursor-mmap-cpu.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          [SKIP][525] ([i915#8623]) -> [SKIP][526] ([i915#14544] / [i915#8623])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [ABORT][527] ([i915#15778]) -> [ABORT][528] ([i915#13029] / [i915#15778])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-tglu-6/igt@perf_pmu@module-unload.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-9/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          [SKIP][529] ([i915#14544] / [i915#3708]) -> [SKIP][530] ([i915#3708])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@prime_vgem@fence-read-hang.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          [SKIP][531] ([i915#14544] / [i915#9917]) -> [SKIP][532] ([i915#9917])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15520
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15734]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15734
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15752]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15752
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8782 -> IGTPW_14690
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_18104: a48305e6a2e6a1ed90df374101dd29542c105d8f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14690: 4c1653ce91ca83828b2bdd133bb072bf50f59891 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/index.html

--===============1927024488387856224==
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
<tr><td><b>Series:</b></td><td>igt: reduce igt_crtc_for_pipe() usage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162757/">https://patchwork.freedesktop.org/series/162757/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18104_full -&gt; IGTPW_14690_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14690_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14690_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14690_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@perf_pmu@rc6-suspend.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-mtlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-18/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14690_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-2/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-3/igt@gem_create@create-ext-cpu-access-big.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454">i915#15454</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-snb7/igt@gem_ctx_persistence@hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-7/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-7/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-7/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-6/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@smoketest-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-snb5/igt@gem_exec_schedule@smoketest-all.html">SKIP</a> +87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-16/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk8/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-16/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-short:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-8/igt@gem_mmap_gtt@basic-short.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@gem_mmap_gtt@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_mmap_wc@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-3/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@gem_render_copy@linear-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk9/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-6/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-1/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@i915_drm_fdinfo@busy-idle-check-all@vcs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-glk2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk3/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@i915_suspend@fence-restore-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@i915_suspend@sysfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140">i915#15140</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-mtlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +211 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a>) +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk9/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-10/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk10/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033">i915#14033</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350">i915#14350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033">i915#14033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk10/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a> +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +29 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +12 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> +428 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-1/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412">i915#14412</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-5/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-7/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-snb5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk9/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-2/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@kms_psr@fbc-psr-cursor-render@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-16/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk1/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-6/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15520">i915#15520</a>) +2 other tests fail</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15520">i915#15520</a>) +1 other test fail</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15520">i915#15520</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk11/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-4/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +8 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-tglu-2/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-10/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-17/igt@gem_lmem_swapping@smem-oom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15734">i915#15734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_lmem_swapping@smem-oom.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-glk9/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk8/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-5/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-5/igt@i915_module_load@reload-no-display.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-12/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-glk5/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk4/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-14/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-18/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-mtlp-7/igt@perf_pmu@semaphore-busy@vcs0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-18/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vecs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-3/igt@perf_pmu@semaphore-busy@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-8/igt@perf_pmu@semaphore-busy@vecs0.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-5/igt@gem_exec_reloc@basic-wc-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@gem_pread@bench.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@gem_pread@bench.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-7/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-18/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-12/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436">i915#15436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128">i915#15128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15752">i915#15752</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-dg1-17/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-dg1-17/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-1/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-tglu-6/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-tglu-9/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-8/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18104/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14690/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8782 -&gt; IGTPW_14690</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18104: a48305e6a2e6a1ed90df374101dd29542c105d8f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14690: 4c1653ce91ca83828b2bdd133bb072bf50f59891 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1927024488387856224==--
