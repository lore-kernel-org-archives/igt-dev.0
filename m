Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EADCCD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 21:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABAE10E304;
	Wed,  3 Jun 2026 21:31:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184E410E304;
 Wed,  3 Jun 2026 21:31:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4300096052243325521=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_tests/kms=5Fbw=3A_fix_co?=
 =?utf-8?q?nnected_output_count_when_connectors_exceed_pipe_count_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 03 Jun 2026 21:31:04 -0000
Message-ID: <178052226408.41774.16412087005618610348@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602052407.3326517-1-sowmiya.s@intel.com>
In-Reply-To: <20260602052407.3326517-1-sowmiya.s@intel.com>
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

--===============4300096052243325521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_bw: fix connected output count when connectors exceed pipe count (rev2)
URL   : https://patchwork.freedesktop.org/series/167710/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18613_full -> IGTPW_15287_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_15287_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15287_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15287_full:

### IGT changes ###

#### Warnings ####

  * igt@dumb_buffer@create-clear:
    - shard-glk:          [FAIL][1] ([i915#16307]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk1/igt@dumb_buffer@create-clear.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@dumb_buffer@create-clear.html

  
Known issues
------------

  Here are the changes found in IGTPW_15287_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#11078])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@device_reset@cold-reset-bound.html
    - shard-tglu:         NOTRUN -> [SKIP][4] ([i915#11078])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-5/igt@device_reset@cold-reset-bound.html
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#11078])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@device_reset@cold-reset-bound.html
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#11078])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-1/igt@device_reset@cold-reset-bound.html
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#11078])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][8] ([i915#11078])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@dumb_buffer@create-clear:
    - shard-rkl:          NOTRUN -> [FAIL][9] ([i915#16307])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@dumb_buffer@create-clear.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#3555] / [i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#9323]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#7697])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#6335])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@gem_create@create-ext-cpu-access-big.html
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#6335])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@gem_create@create-ext-cpu-access-big.html
    - shard-dg2:          NOTRUN -> [FAIL][15] ([i915#15454])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#6335])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8555])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][18] ([i915#1099]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-snb5/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#280]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-tglu:         [PASS][21] -> [DMESG-WARN][22] ([i915#13363])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-5/igt@gem_eio@kms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#4812]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#4812]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#4812])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#4525])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][27] ([i915#4525])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#4525])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_big@single:
    - shard-mtlp:         [PASS][29] -> [FAIL][30] ([i915#15871])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-6/igt@gem_exec_big@single.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6344])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#3281]) +6 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@gem_exec_reloc@basic-gtt-read.html
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#14544] / [i915#3281]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#3281]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3281]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#3281]) +8 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4537] / [i915#4812])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4537] / [i915#4812])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][40] ([i915#13356]) +1 other test incomplete
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4860])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4860])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#4613] / [i915#7582])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][44] ([i915#4613]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#4613])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#4613]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html
    - shard-tglu-1:       NOTRUN -> [SKIP][47] ([i915#4613]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4613]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#284])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@gem_media_vme.html
    - shard-tglu-1:       NOTRUN -> [SKIP][50] ([i915#284])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4077]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4077]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_gtt@ptrace:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4077]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@gem_mmap_gtt@ptrace.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4083]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4083]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4083]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-5/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3282]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-3/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#3282]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3282]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][60] ([i915#2658])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk3/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][61] ([i915#2658])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4270]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-1/igt@gem_pxp@reject-modify-context-protection-off-3.html
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4270]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3282]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-3/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#8428]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@gem_render_copy@y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#5190] / [i915#8428]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_softpin@noreloc-s3:
    - shard-rkl:          NOTRUN -> [ABORT][67] ([i915#15131])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3297]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#3297]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3297]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3297]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3297]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#3281] / [i915#3297])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@gem_userptr_blits@relocations.html
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#3281] / [i915#3297])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#3281] / [i915#3297])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@gem_userptr_blits@relocations.html
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#3281] / [i915#3297])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][77] ([i915#3297])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][78] -> [ABORT][79] ([i915#5566])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk8/igt@gen9_exec_parse@allowed-single.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#2527]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#2527]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@gen9_exec_parse@bb-oversize.html
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#2856]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#2527] / [i915#2856]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#2856]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-3/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglu-1:       NOTRUN -> [SKIP][85] ([i915#2527] / [i915#2856]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#14073]) +6 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-3/igt@i915_drm_fdinfo@most-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#14073]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#14073]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#14118])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#14118])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@i915_drm_fdinfo@virtual-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#14118])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#13786])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#16080] / [i915#16166])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][94] ([i915#13356])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk9/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          NOTRUN -> [INCOMPLETE][95] ([i915#13356] / [i915#15172])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#16079])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#5723])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#5723])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#5723])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [PASS][100] -> [INCOMPLETE][101] ([i915#16182] / [i915#4817])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk3/igt@i915_suspend@debugfs-reader.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4212])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4212])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][104] ([i915#14888]) +2 other tests fail
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][105] ([i915#12761] / [i915#16314]) +1 other test incomplete
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic@atomic-plane-damage:
    - shard-glk10:        NOTRUN -> [SKIP][106] +140 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_atomic@atomic-plane-damage.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#5286]) +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#5286])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#5286]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#5286]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#14544] / [i915#5286])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4538] / [i915#5286]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-mtlp:         NOTRUN -> [FAIL][113] ([i915#15733] / [i915#5138])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [FAIL][114] ([i915#16308])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-glk11:        NOTRUN -> [FAIL][115] ([i915#16308])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk10:        NOTRUN -> [FAIL][116] ([i915#16308])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#3638]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#3638]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [FAIL][119] ([i915#16308])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#3828])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-glk:          NOTRUN -> [FAIL][121] ([i915#16308])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#3828]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#4538] / [i915#5190]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4538])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#6187])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#5190]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#12313])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#6095]) +24 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][130] +479 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#10307] / [i915#6095]) +119 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#6095]) +79 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#12313]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#12313]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#14544] / [i915#6095]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#14098] / [i915#14544] / [i915#6095])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-mtlp:         [PASS][137] -> [FAIL][138] ([i915#12469] / [i915#15733])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-edp-1:
    - shard-mtlp:         [PASS][139] -> [FAIL][140] ([i915#15733]) +3 other tests fail
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-edp-1.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#6095]) +24 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][142] ([i915#15582] / [i915#16205]) +1 other test incomplete
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#14098] / [i915#6095]) +50 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#12313])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#12313])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#12313])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#6095]) +54 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#6095]) +71 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#6095]) +209 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#3742])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#13781]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2:          NOTRUN -> [SKIP][152] +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#11151] / [i915#7828]) +7 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#11151] / [i915#7828]) +5 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#11151] / [i915#7828]) +5 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#11151] / [i915#14544] / [i915#7828])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#11151] / [i915#7828]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#11151] / [i915#7828]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#11151] / [i915#7828]) +9 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#15330] / [i915#3116] / [i915#3299]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-5/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#15330] / [i915#3299])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#15330] / [i915#3299])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#15330] / [i915#3299])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#15330])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#15330] / [i915#3116])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#15865]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#15865]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#15865])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#15865]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#15865]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#15865])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][172] ([i915#7173]) +1 other test fail
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-3.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#13049]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#13049])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#3555] / [i915#8814])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          NOTRUN -> [FAIL][176] ([i915#13566]) +3 other tests fail
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-tglu:         NOTRUN -> [FAIL][177] ([i915#13566]) +3 other tests fail
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#8814]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][179] -> [FAIL][180] ([i915#13566]) +1 other test fail
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][181] -> [FAIL][182] ([i915#13566]) +1 other test fail
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#13049]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#3555]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#13049]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][186] ([i915#12358] / [i915#14152] / [i915#7882])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk3/igt@kms_cursor_crc@cursor-suspend.html
    - shard-rkl:          [PASS][187] -> [INCOMPLETE][188] ([i915#12358] / [i915#14152])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_cursor_crc@cursor-suspend.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][189] ([i915#12358] / [i915#14152])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][190] ([i915#12358] / [i915#14152])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#4103])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#13046] / [i915#5354]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#9809]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#9067])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#9723])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#9833])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#9723])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#9723])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#9723])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#13691])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#1769] / [i915#3555] / [i915#3804])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#3804])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3804])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3555]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#13748])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3555] / [i915#3840])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3555] / [i915#3840])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#3555] / [i915#3840]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#3555] / [i915#3840])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#3469])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#3955])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#16081])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_feature_discovery@display-4x.html
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#16081])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_feature_discovery@display-4x.html
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#16081])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_feature_discovery@display-4x.html
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#16081])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_feature_discovery@display-4x.html
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#16081])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#9934]) +5 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#3637] / [i915#9934]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][219] ([i915#9934])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#8381])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#8381])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#8381])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][223] ([i915#12314] / [i915#12745] / [i915#4839] / [i915#6113])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][224] ([i915#12314] / [i915#12745])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk5/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#3637] / [i915#9934]) +6 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#9934]) +8 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#9934]) +10 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#14544] / [i915#9934]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#3637] / [i915#9934]) +3 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-tglu:         [PASS][230] -> [FAIL][231] ([i915#13027]) +1 other test fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          NOTRUN -> [FAIL][232] ([i915#13027]) +1 other test fail
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][233] -> [INCOMPLETE][234] ([i915#16276] / [i915#6113]) +1 other test incomplete
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#15643]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#15643])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#15643] / [i915#5190]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#15643]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#15643])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#3555] / [i915#8813])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#8810] / [i915#8813])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#15643]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#15643]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         [PASS][244] -> [SKIP][245] ([i915#15672])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-7/igt@kms_force_connector_basic@prune-stale-modes.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#15990] / [i915#8708]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#15991] / [i915#1825]) +13 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#15989]) +16 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][249] -> [SKIP][250] ([i915#15989]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#15991]) +21 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#15989]) +15 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][253] ([i915#16056])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#5439])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#5439])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          [PASS][256] -> [SKIP][257] ([i915#15989]) +13 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#10055])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][259] +173 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#15104] / [i915#15990])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#15104] / [i915#15990])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#15102] / [i915#3023]) +21 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#15990] / [i915#8708]) +10 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#15990]) +16 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#14544] / [i915#15102]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#15989]) +13 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#15102]) +19 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#15102]) +31 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][269] +85 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#15989]) +19 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#15989]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#15989]) +9 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-glk:          [PASS][273] -> [SKIP][274] +4 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-2p-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] +70 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][276] +47 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#14544]) +3 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#15990]) +7 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#9766])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#15102]) +51 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#15990] / [i915#8708]) +8 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#1825]) +4 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#15991] / [i915#5354]) +23 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#15990]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#15102]) +28 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#15991]) +29 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][287] +123 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#15102]) +21 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-mtlp:         [PASS][289] -> [SKIP][290] ([i915#15725])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-5/igt@kms_hdmi_inject@inject-4k.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#16012] / [i915#3555] / [i915#8228]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#16012] / [i915#3555] / [i915#8228])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_hdr@bpc-switch-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#16012] / [i915#3555] / [i915#8228])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-19/igt@kms_hdr@bpc-switch-suspend.html
    - shard-snb:          NOTRUN -> [FAIL][294] ([i915#16018])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-snb7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010:
    - shard-snb:          NOTRUN -> [FAIL][295] ([i915#16013]) +1 other test fail
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-snb7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#16012]) +3 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-4-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#16012]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-19/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-4-xrgb2101010.html

  * igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#16012]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#16011]) +7 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1-xrgb2101010.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#16011] / [i915#3555] / [i915#8228])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f:
    - shard-tglu-1:       NOTRUN -> [SKIP][301] ([i915#16011]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-2-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#16011]) +5 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-2-xrgb2101010.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#16011] / [i915#3555] / [i915#8228])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_hdr@static-swap.html
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#16011] / [i915#3555] / [i915#8228])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-19/igt@kms_hdr@static-swap.html
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#16011] / [i915#3555] / [i915#8228])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_hdr@static-swap.html
    - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#16011] / [i915#3555] / [i915#8228])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-3/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-swap@pipe-a-edp-1-xrgb2101010:
    - shard-mtlp:         NOTRUN -> [SKIP][307] ([i915#16011]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-3/igt@kms_hdr@static-swap@pipe-a-edp-1-xrgb2101010.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-1-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#16011]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_hdr@static-swap@pipe-a-hdmi-a-1-xrgb2101010.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#16011]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#15460])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#15459])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#15458])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#15458])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#15638] / [i915#15722])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#15815])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#15815])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#15815])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][318] +9 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#14712])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#14712])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#14712]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#13705])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#15709]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#15608]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#15709]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#14544] / [i915#15709])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#15709]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#15709]) +4 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#15709]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4:
    - shard-glk11:        NOTRUN -> [SKIP][330] +137 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][331] ([i915#15709]) +3 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][332] ([i915#13026]) +1 other test incomplete
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk11:        NOTRUN -> [FAIL][333] ([i915#12178])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [FAIL][334] ([i915#7862]) +1 other test fail
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk10:        NOTRUN -> [FAIL][335] ([i915#10647] / [i915#12169])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][336] ([i915#10647]) +1 other test fail
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#3555]) +5 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#11614] / [i915#3582]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#13958])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#14259])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#15329]) +4 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#15329]) +7 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#12343] / [i915#5354])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-5/igt@kms_pm_backlight@bad-brightness.html
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#12343] / [i915#5354])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#12343] / [i915#5354])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#12343] / [i915#9812])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#12343])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#12343])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-1/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#12343])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-19/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#12343])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#15948])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#15948])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#3828])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#3828])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-mtlp:         NOTRUN -> [SKIP][356] ([i915#3828])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#15739])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][358] ([i915#15073])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#15073])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][360] ([i915#15073])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          [PASS][361] -> [SKIP][362] ([i915#15073]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][363] -> [SKIP][364] ([i915#15073]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          [PASS][365] -> [INCOMPLETE][366] ([i915#14419])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-glk11:        NOTRUN -> [SKIP][367] ([i915#11520]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][368] ([i915#11520]) +10 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][369] ([i915#11520]) +3 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-snb1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][370] ([i915#11520]) +5 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#12316]) +7 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][372] ([i915#9808]) +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#11520]) +6 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][374] ([i915#11520]) +4 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-glk10:        NOTRUN -> [SKIP][375] ([i915#11520]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#11520]) +7 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu:         NOTRUN -> [SKIP][377] ([i915#11520]) +12 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][378] ([i915#9683])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#9683])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][380] ([i915#9683])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_psr2_su@page_flip-p010.html
    - shard-mtlp:         NOTRUN -> [SKIP][381] ([i915#4348])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#9683]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][383] ([i915#9688]) +9 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][384] ([i915#9732]) +15 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][385] ([i915#9732]) +17 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#1072] / [i915#9732]) +12 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#1072] / [i915#9732]) +15 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_psr@psr-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#1072] / [i915#14544] / [i915#9732])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#1072] / [i915#9732]) +21 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][390] ([i915#15949])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][391] ([i915#15949])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][392] ([i915#15500] / [i915#16184])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-glk:          NOTRUN -> [INCOMPLETE][393] ([i915#15492] / [i915#16184])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][394] ([i915#5289])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][395] ([i915#5289])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][396] ([i915#12755] / [i915#15867])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#5289])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][398] ([i915#5289])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#3555]) +3 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-tglu:         NOTRUN -> [SKIP][400] ([i915#3555]) +6 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [PASS][401] -> [FAIL][402] ([i915#15106]) +2 other tests fail
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][403] ([i915#3555] / [i915#8809] / [i915#8823])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][404] ([i915#8623])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][405] ([i915#12276]) +1 other test incomplete
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flipline:
    - shard-rkl:          NOTRUN -> [SKIP][406] ([i915#15243] / [i915#3555])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][407] ([i915#9906])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf_pmu@busy-idle:
    - shard-mtlp:         [PASS][408] -> [FAIL][409] ([i915#4349]) +1 other test fail
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-6/igt@perf_pmu@busy-idle.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@perf_pmu@busy-idle.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][410] ([i915#13356] / [i915#16236])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@perf_pmu@rc6-suspend.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [SKIP][411] ([i915#16066]) +9 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][412] ([i915#13356] / [i915#16348]) -> [PASS][413] +1 other test pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-4/igt@gem_ccs@suspend-resume.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_eio@hibernate:
    - shard-rkl:          [ABORT][414] ([i915#7975]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-1/igt@gem_eio@hibernate.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-mtlp:         [ABORT][416] ([i915#15511]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-5/igt@gem_eio@kms.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@gem_eio@kms.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          [INCOMPLETE][418] ([i915#13196] / [i915#13356]) -> [PASS][419] +1 other test pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk8/igt@gem_exec_suspend@basic-s3.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-rkl:          [SKIP][420] ([i915#4270]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@i915_pm_rps@engine-order:
    - shard-glk:          [FAIL][422] ([i915#14896]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk5/igt@i915_pm_rps@engine-order.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk2/igt@i915_pm_rps@engine-order.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          [INCOMPLETE][424] ([i915#4817]) -> [PASS][425] +1 other test pass
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@i915_suspend@forcewake.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@i915_suspend@forcewake.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][426] ([i915#12761]) -> [PASS][427] +1 other test pass
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@test-cursor:
    - shard-dg1:          [DMESG-WARN][428] ([i915#4423]) -> [PASS][429]
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-17/igt@kms_async_flips@test-cursor.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-mtlp:         [FAIL][430] ([i915#15733] / [i915#5138]) -> [PASS][431] +1 other test pass
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2:          [ABORT][432] ([i915#15132]) -> [PASS][433]
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [SKIP][434] ([i915#12655] / [i915#3555]) -> [PASS][435]
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-8/igt@kms_color@deep-color.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_color@deep-color.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [FAIL][436] ([i915#13566]) -> [PASS][437] +1 other test pass
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          [FAIL][438] ([i915#13566]) -> [PASS][439] +1 other test pass
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [SKIP][440] ([i915#13707]) -> [PASS][441]
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
    - shard-tglu:         [FAIL][442] ([i915#14600]) -> [PASS][443] +1 other test pass
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render:
    - shard-glk:          [SKIP][444] -> [PASS][445] +3 other tests pass
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-dg2:          [SKIP][446] ([i915#15989]) -> [PASS][447] +10 other tests pass
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt:
    - shard-rkl:          [SKIP][448] ([i915#15989]) -> [PASS][449] +6 other tests pass
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [SKIP][450] ([i915#15459]) -> [PASS][451]
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][452] ([i915#15073]) -> [PASS][453] +1 other test pass
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          [SKIP][454] ([i915#15073]) -> [PASS][455]
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][456] ([i915#15106]) -> [PASS][457] +2 other tests pass
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-4/igt@kms_setmode@basic.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][458] ([i915#3555] / [i915#9323]) -> [SKIP][459] ([i915#14544] / [i915#3555] / [i915#9323])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          [SKIP][460] ([i915#13008] / [i915#14544]) -> [SKIP][461] ([i915#13008])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          [SKIP][462] ([i915#4525]) -> [SKIP][463] ([i915#14544] / [i915#4525])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [FAIL][464] ([i915#15816]) -> [FAIL][465] ([i915#15944])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-3/igt@gem_exec_big@single.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@gem_exec_big@single.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-rkl:          [SKIP][466] ([i915#14544] / [i915#3281]) -> [SKIP][467] ([i915#3281])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          [SKIP][468] ([i915#3281]) -> [SKIP][469] ([i915#14544] / [i915#3281])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          [SKIP][470] ([i915#14544] / [i915#4613] / [i915#7582]) -> [SKIP][471] ([i915#4613] / [i915#7582])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-rkl:          [SKIP][472] ([i915#4613]) -> [SKIP][473] ([i915#14544] / [i915#4613])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-multi.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          [SKIP][474] ([i915#14544] / [i915#4613]) -> [SKIP][475] ([i915#4613])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-rkl:          [SKIP][476] ([i915#14544] / [i915#3282]) -> [SKIP][477] ([i915#3282])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [SKIP][478] ([i915#13717]) -> [SKIP][479] ([i915#13717] / [i915#14544])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          [SKIP][480] ([i915#14544] / [i915#3297]) -> [SKIP][481] ([i915#3297])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-rkl:          [SKIP][482] ([i915#2527]) -> [SKIP][483] ([i915#14544] / [i915#2527]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-7/igt@gen9_exec_parse@allowed-single.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          [SKIP][484] ([i915#14544] / [i915#2527]) -> [SKIP][485] ([i915#2527]) +1 other test skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [INCOMPLETE][486] ([i915#4817]) -> [ABORT][487] ([i915#15131] / [i915#15140])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@i915_suspend@debugfs-reader.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-rkl:          [SKIP][488] ([i915#14544] / [i915#5286]) -> [SKIP][489] ([i915#5286])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][490] ([i915#5286]) -> [SKIP][491] ([i915#14544] / [i915#5286])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][492] ([i915#14544] / [i915#3828]) -> [SKIP][493] ([i915#3828])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][494] ([i915#14544] / [i915#3638]) -> [SKIP][495] ([i915#3638]) +2 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][496] ([i915#14098] / [i915#6095]) -> [SKIP][497] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][498] ([i915#14544] / [i915#6095]) -> [SKIP][499] ([i915#6095]) +2 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][500] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][501] ([i915#14098] / [i915#6095]) +3 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][502] ([i915#12313] / [i915#14544]) -> [SKIP][503] ([i915#12313])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][504] ([i915#6095]) -> [SKIP][505] ([i915#14544] / [i915#6095]) +3 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-rkl:          [SKIP][506] ([i915#11151] / [i915#7828]) -> [SKIP][507] ([i915#11151] / [i915#14544] / [i915#7828])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-dg2:          [FAIL][508] ([i915#7173]) -> [SKIP][509] ([i915#15865])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-10/igt@kms_content_protection@atomic-hdcp14.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_content_protection@atomic-hdcp14.html
    - shard-rkl:          [SKIP][510] ([i915#14544] / [i915#15865]) -> [SKIP][511] ([i915#15865])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_content_protection@atomic-hdcp14.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-rkl:          [SKIP][512] ([i915#14544] / [i915#15330]) -> [SKIP][513] ([i915#15330])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          [SKIP][514] ([i915#15330] / [i915#3116]) -> [SKIP][515] ([i915#14544] / [i915#15330] / [i915#3116])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][516] ([i915#15865]) -> [SKIP][517] ([i915#9433])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-19/igt@kms_content_protection@mei-interface.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-dg2:          [SKIP][518] ([i915#15865]) -> [FAIL][519] ([i915#7173]) +1 other test fail
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-3/igt@kms_content_protection@uevent-hdcp14.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          [SKIP][520] ([i915#14544] / [i915#3555]) -> [SKIP][521] ([i915#3555])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          [SKIP][522] ([i915#13049]) -> [SKIP][523] ([i915#13049] / [i915#14544])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][524] ([i915#14544] / [i915#4103]) -> [SKIP][525] ([i915#4103])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][526] ([i915#14544]) -> [SKIP][527] +31 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          [SKIP][528] ([i915#4103]) -> [SKIP][529] ([i915#14544] / [i915#4103])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          [SKIP][530] ([i915#13691]) -> [SKIP][531] ([i915#13691] / [i915#14544])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-rkl:          [SKIP][532] ([i915#9934]) -> [SKIP][533] ([i915#14544] / [i915#9934]) +1 other test skip
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][534] ([i915#12314] / [i915#12745] / [i915#4839]) -> [INCOMPLETE][535] ([i915#12745] / [i915#4839])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][536] ([i915#12314] / [i915#12745]) -> [INCOMPLETE][537] ([i915#12745])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-rkl:          [SKIP][538] ([i915#14544] / [i915#9934]) -> [SKIP][539] ([i915#9934]) +2 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][540] ([i915#12314] / [i915#12745] / [i915#4839]) -> [INCOMPLETE][541] ([i915#12745] / [i915#4839] / [i915#6113])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk8/igt@kms_flip@flip-vs-suspend.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][542] ([i915#12314] / [i915#12745]) -> [INCOMPLETE][543] ([i915#12745] / [i915#6113])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][544] ([i915#14544] / [i915#15643]) -> [SKIP][545] ([i915#15643])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][546] ([i915#15643]) -> [SKIP][547] ([i915#14544] / [i915#15643]) +1 other test skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-rkl:          [SKIP][548] -> [SKIP][549] ([i915#14544]) +27 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          [SKIP][550] ([i915#10433] / [i915#15102]) -> [SKIP][551] ([i915#15102]) +1 other test skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][552] ([i915#14544] / [i915#1825]) -> [SKIP][553] ([i915#1825]) +1 other test skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][554] ([i915#1825]) -> [SKIP][555] ([i915#14544] / [i915#1825]) +1 other test skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          [SKIP][556] ([i915#4423]) -> [SKIP][557]
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][558] ([i915#14544] / [i915#5439]) -> [SKIP][559] ([i915#5439])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:
    - shard-rkl:          [SKIP][560] ([i915#15102]) -> [SKIP][561] ([i915#14544] / [i915#15102]) +2 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][562] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][563] ([i915#15102] / [i915#3023]) +5 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-rkl:          [SKIP][564] ([i915#15102] / [i915#3023]) -> [SKIP][565] ([i915#14544] / [i915#15102] / [i915#3023]) +6 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-rkl:          [SKIP][566] ([i915#14544] / [i915#15102]) -> [SKIP][567] ([i915#15102]) +5 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          [SKIP][568] ([i915#15460]) -> [SKIP][569] ([i915#14544] / [i915#15460])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_joiner@basic-big-joiner.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-rkl:          [SKIP][570] ([i915#15709]) -> [SKIP][571] ([i915#14544] / [i915#15709])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-rkl:          [SKIP][572] ([i915#14544] / [i915#15709]) -> [SKIP][573] ([i915#15709])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-dg1:          [SKIP][574] ([i915#15709] / [i915#4423]) -> [SKIP][575] ([i915#15709])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-16/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          [SKIP][576] ([i915#13958] / [i915#14544]) -> [SKIP][577] ([i915#13958])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][578] ([i915#14544] / [i915#15329]) -> [SKIP][579] ([i915#15329]) +3 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          [SKIP][580] ([i915#12343] / [i915#5354]) -> [SKIP][581] ([i915#12343] / [i915#14544] / [i915#5354]) +1 other test skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][582] ([i915#14544] / [i915#15073]) -> [SKIP][583] ([i915#15073])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][584] ([i915#11520] / [i915#14544]) -> [SKIP][585] ([i915#11520]) +1 other test skip
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][586] ([i915#11520]) -> [SKIP][587] ([i915#11520] / [i915#14544]) +1 other test skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-rkl:          [SKIP][588] ([i915#1072] / [i915#9732]) -> [SKIP][589] ([i915#1072] / [i915#14544] / [i915#9732]) +4 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_psr@pr-cursor-mmap-cpu.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          [SKIP][590] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][591] ([i915#1072] / [i915#9732]) +4 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          [SKIP][592] ([i915#12755] / [i915#15867]) -> [SKIP][593] ([i915#15867])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-3/igt@kms_rotation_crc@primary-rotation-270.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          [SKIP][594] ([i915#12755] / [i915#15867] / [i915#5190]) -> [SKIP][595] ([i915#15867] / [i915#5190])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          [SKIP][596] ([i915#14544] / [i915#5289]) -> [SKIP][597] ([i915#5289])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-rkl:          [SKIP][598] ([i915#3555]) -> [SKIP][599] ([i915#14544] / [i915#3555])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-2/igt@kms_setmode@clone-exclusive-crtc.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [SKIP][600] ([i915#14544] / [i915#2434]) -> [SKIP][601] ([i915#2434])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@perf@mi-rpc.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@perf@mi-rpc.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-rkl:          [SKIP][602] ([i915#14544] / [i915#9917]) -> [SKIP][603] ([i915#9917])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12469
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#14896]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14896
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15511]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15511
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871
  [i915#15944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16011]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011
  [i915#16012]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012
  [i915#16013]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16013
  [i915#16018]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16018
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16066]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16205]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16205
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16307
  [i915#16308]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16308
  [i915#16314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16314
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
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
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8947 -> IGTPW_15287
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_18613: ab2d36ce7e67d2825cea19ea956947a21e932f70 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15287: 15287
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/index.html

--===============4300096052243325521==
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
<tr><td><b>Series:</b></td><td>tests/kms_bw: fix connected output count when connectors exceed pipe count (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167710/">https://patchwork.freedesktop.org/series/167710/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18613_full -&gt; IGTPW_15287_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_15287_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15287_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/index.html</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15287_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@dumb_buffer@create-clear:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk1/igt@dumb_buffer@create-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16307">i915#16307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@dumb_buffer@create-clear.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15287_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-5/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-1/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@dumb_buffer@create-clear:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@dumb_buffer@create-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16307">i915#16307</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@gem_create@create-ext-cpu-access-big.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454">i915#15454</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-snb5/igt@gem_ctx_persistence@processes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-5/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-6/igt@gem_exec_big@single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871">i915#15871</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +6 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@ptrace:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@gem_mmap_gtt@ptrace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@gem_mmap_wc@write-gtt-read-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-5/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-3/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk3/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-5/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-1/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-3/igt@gem_readwrite@new-obj.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@gem_render_copy@y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-1/igt@gem_softpin@noreloc-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk8/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk4/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-3/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-3/igt@i915_drm_fdinfo@most-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@i915_drm_fdinfo@virtual-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@i915_drm_fdinfo@virtual-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@i915_fb_tiling@basic-x-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk9/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172">i915#15172</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk3/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk4/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16314">i915#16314</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_atomic@atomic-plane-damage.html">SKIP</a> +140 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_big_fb@linear-16bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16308">i915#16308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@kms_big_fb@linear-16bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16308">i915#16308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_big_fb@linear-32bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16308">i915#16308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_big_fb@linear-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16308">i915#16308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16308">i915#16308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +479 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +119 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12469">i915#12469</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16205">i915#16205</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +209 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_chamelium_color@ctm-max.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk5/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-7/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> +173 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +16 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-rte.html">SKIP</a> +70 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-2p-rte.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +8 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> +123 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-5/igt@kms_hdmi_inject@inject-4k.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-19/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-snb7/igt@kms_hdr@bpc-switch-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16018">i915#16018</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-snb7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16013">i915#16013</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-19/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-4-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-2-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-19/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-3/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-3/igt@kms_hdr@static-swap@pipe-a-edp-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_hdr@static-swap@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-12/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4.html">SKIP</a> +137 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226">i915#10226</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-5/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-19/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-snb1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348">i915#4348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-2/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk10/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492">i915#15492</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-16/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-2/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823">i915#8823</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-6/igt@perf_pmu@busy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@perf_pmu@busy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk11/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236">i915#16236</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066">i915#16066</a>) +9 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-4/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-1/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-5/igt@gem_eio@kms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15511">i915#15511</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-6/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk8/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk6/igt@gem_exec_suspend@basic-s3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_pxp@protected-raw-src-copy-not-readible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk5/igt@i915_pm_rps@engine-order.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14896">i915#14896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk2/igt@i915_pm_rps@engine-order.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@i915_suspend@forcewake.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-17/igt@kms_async_flips@test-cursor.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-18/igt@kms_async_flips@test-cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-mtlp-7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-mtlp-7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-8/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-4/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-tglu-3/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-tglu-7/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944">i915#15944</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-7/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-1/igt@i915_suspend@debugfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140">i915#15140</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-10/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-7/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-19/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-3/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk8/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk1/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg1-16/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg1-13/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-8/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-3/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-2/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-5/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18613/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15287/shard-rkl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8947 -&gt; IGTPW_15287</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18613: ab2d36ce7e67d2825cea19ea956947a21e932f70 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15287: 15287<br />
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4300096052243325521==--
