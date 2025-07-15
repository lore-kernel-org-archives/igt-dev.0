Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D56C83F1A
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 01:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C405510E0D7;
	Tue, 15 Jul 2025 01:57:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767C810E0D7;
 Tue, 15 Jul 2025 01:57:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4068521281862038807=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms=5Fvrr=3A_Pull_?=
 =?utf-8?q?Panel_Replay_check_before_setting_up_output_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 15 Jul 2025 01:57:55 -0000
Message-ID: <175254467541.160541.18376111049795780585@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250714145556.213318-1-jeevan.b@intel.com>
In-Reply-To: <20250714145556.213318-1-jeevan.b@intel.com>
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

--===============4068521281862038807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Pull Panel Replay check before setting up output (rev3)
URL   : https://patchwork.freedesktop.org/series/151561/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_16863_full -> IGTPW_13463_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13463_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13463_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13463_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@kms:
    - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-6/igt@gem_eio@kms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@gem_eio@kms.html

  * igt@gem_linear_blits@normal:
    - shard-dg2:          [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-7/igt@gem_linear_blits@normal.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@gem_linear_blits@normal.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-mtlp:         [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-3/igt@kms_psr@psr2-sprite-render.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-6/igt@kms_psr@psr2-sprite-render.html

  
New tests
---------

  New tests have been introduced between CI_DRM_16863_full and IGTPW_13463_full:

### New IGT tests (3) ###

  * igt@kms_async_flips@crc@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_async_flips@crc@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_flip@bo-too-big@d-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  

Known issues
------------

  Here are the changes found in IGTPW_13463_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2-9:        NOTRUN -> [SKIP][7] ([i915#8411]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg1:          [PASS][8] -> [DMESG-WARN][9] ([i915#4391] / [i915#4423])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-18/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@eof:
    - shard-rkl:          [PASS][10] -> [SKIP][11] ([i915#14544] / [i915#2582])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@fbdev@eof.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@fbdev@eof.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][12] ([i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][15] ([i915#13356])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][16] ([i915#12392] / [i915#13356])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglu-1:       NOTRUN -> [SKIP][17] +41 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][18] ([i915#1099]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#5882]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][20] -> [FAIL][21] ([i915#5784])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-15/igt@gem_eio@reset-stress.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2-9:        NOTRUN -> [SKIP][22] ([i915#4771])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#4525])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][24] ([i915#11713])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-6/igt@gem_exec_big@single.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#4812])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-8/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2-9:        NOTRUN -> [SKIP][26] ([i915#4812])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#3539] / [i915#4852])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg2-9:        NOTRUN -> [SKIP][28] ([i915#3539] / [i915#4852])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][29] ([i915#3539])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#3281])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-12/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#3281]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][32] ([i915#3281]) +9 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@fairslice:
    - shard-rkl:          [PASS][33] -> [DMESG-WARN][34] ([i915#12964]) +31 other tests dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@gem_exec_schedule@fairslice.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@gem_exec_schedule@fairslice.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#7276])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          NOTRUN -> [ABORT][36] ([i915#7975] / [i915#8213]) +1 other test abort
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4860])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-glk:          NOTRUN -> [SKIP][38] ([i915#4613]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk8/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#4613])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#4613]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-5/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-dg2-9:        NOTRUN -> [DMESG-WARN][41] ([i915#5493]) +1 other test dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#4613])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#12193])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4613])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-5/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4565])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#284])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@gem_media_vme.html
    - shard-dg2-9:        NOTRUN -> [SKIP][47] ([i915#284])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_media_vme.html

  * igt@gem_mmap@bad-offset:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4083]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap@pf-nonblock:
    - shard-dg2-9:        NOTRUN -> [SKIP][49] ([i915#4083]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_gtt@basic-copy:
    - shard-dg2-9:        NOTRUN -> [SKIP][50] ([i915#4077]) +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_mmap_gtt@basic-copy.html

  * igt@gem_mmap_wc@copy:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4083])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3282]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-5/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#3282])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#3282])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-2/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3282]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@uncached:
    - shard-dg2-9:        NOTRUN -> [SKIP][56] ([i915#3282]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_pread@uncached.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [PASS][57] -> [TIMEOUT][58] ([i915#12964])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4270])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#13398])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg2-9:        NOTRUN -> [SKIP][61] ([i915#4270])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-rkl:          [PASS][62] -> [TIMEOUT][63] ([i915#12917] / [i915#12964]) +1 other test timeout
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][64] ([i915#5190] / [i915#8428]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#5190] / [i915#8428]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@gem_render_copy@yf-tiled-ccs-to-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][66] ([i915#4079])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#14544] / [i915#8411])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#14544] / [i915#3282])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4079])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4079])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-6/igt@gem_set_tiling_vs_pwrite.html
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4079])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4885])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu-1:       NOTRUN -> [SKIP][73] ([i915#3297])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][74] ([i915#3323])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#3297])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-2/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#2527] / [i915#2856]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-5/igt@gen9_exec_parse@basic-rejected.html
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#2856])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@gen9_exec_parse@basic-rejected.html
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#2527])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@gen9_exec_parse@basic-rejected.html
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#2527])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#2856])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-dg2-9:        NOTRUN -> [SKIP][81] ([i915#2856]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_drm_fdinfo@busy-check-all@bcs0:
    - shard-dg2-9:        NOTRUN -> [SKIP][82] ([i915#11527]) +7 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@i915_drm_fdinfo@busy-check-all@bcs0.html

  * igt@i915_drm_fdinfo@busy-hang@vcs0:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#14073]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@i915_drm_fdinfo@busy-hang@vcs0.html

  * igt@i915_drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2-9:        NOTRUN -> [SKIP][84] ([i915#14073]) +7 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@i915_drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2-9:        NOTRUN -> [SKIP][85] ([i915#14118])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][86] ([i915#13029] / [i915#14545])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          [PASS][87] -> [DMESG-WARN][88] ([i915#13029] / [i915#14545])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-17/igt@i915_module_load@reload-no-display.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#8399])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][90] ([i915#13790] / [i915#2681]) +1 other test warn
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4077]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#4077])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-4/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-rkl:          [PASS][93] -> [SKIP][94] ([i915#13328])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@i915_pm_rpm@reg-read-ioctl.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2-9:        NOTRUN -> [SKIP][95] ([i915#11681])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_power@sanity:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#7984])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-2/igt@i915_power@sanity.html
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#7984])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@i915_power@sanity.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][98] -> [DMESG-FAIL][99] ([i915#12061]) +1 other test dmesg-fail
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-7/igt@i915_selftest@live@workarounds.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-5/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-rkl:          [PASS][100] -> [DMESG-WARN][101] ([i915#12917] / [i915#12964]) +3 other tests dmesg-warn
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@i915_suspend@basic-s2idle-without-i915.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][102] ([i915#4817] / [i915#7443])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-5/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2-9:        NOTRUN -> [SKIP][103] ([i915#4212])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2-9:        NOTRUN -> [SKIP][104] ([i915#4215] / [i915#5190])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-9:        NOTRUN -> [SKIP][105] ([i915#12967] / [i915#6228])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][106] ([i915#1769])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#1769] / [i915#3555])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-rkl:          [PASS][108] -> [SKIP][109] ([i915#14544]) +33 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#5286]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-10/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][111] +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#5286]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4538] / [i915#5286]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-mtlp:         [PASS][114] -> [FAIL][115] ([i915#5138])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-6/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#3638]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][117] +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][118] +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#3638])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][120] ([i915#4538] / [i915#5190]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4538] / [i915#5190]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-9:        NOTRUN -> [SKIP][122] ([i915#5190])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4538]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#14544])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#6095]) +37 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#6095]) +19 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-10/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#12313]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#14098] / [i915#6095]) +39 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#10307] / [i915#6095]) +94 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#6095]) +9 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-7/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][131] +257 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#12805])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#6095]) +115 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][134] ([i915#6095]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#6095]) +29 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#6095]) +19 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [PASS][137] -> [INCOMPLETE][138] ([i915#12796])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][139] ([i915#12796])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][140] ([i915#12796]) +1 other test incomplete
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][141] ([i915#10307] / [i915#6095]) +44 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#10307] / [i915#10434] / [i915#6095])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][143] ([i915#12313]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#13784])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-8/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#3742])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#3742])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#3742])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#13784])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#13781]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][150] ([i915#13783]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#11151] / [i915#7828]) +7 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-2/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][152] ([i915#11151] / [i915#7828]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#11151] / [i915#7828]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_chamelium_frames@hdmi-frame-dump.html
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#11151] / [i915#7828]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_chamelium_frames@hdmi-frame-dump.html
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#11151] / [i915#7828]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#11151] / [i915#7828]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg2-9:        NOTRUN -> [SKIP][157] ([i915#11151] / [i915#7828]) +6 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@ctm-0-75:
    - shard-rkl:          [PASS][158] -> [SKIP][159] ([i915#12655] / [i915#14544])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_color@ctm-0-75.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_color@ctm-0-75.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#3555] / [i915#9979])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#7118] / [i915#9424])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#7118] / [i915#9424])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#7116] / [i915#9424])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_content_protection@atomic-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#6944] / [i915#9424])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#3116] / [i915#3299]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-9:        NOTRUN -> [SKIP][167] ([i915#7118] / [i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-9:        NOTRUN -> [SKIP][168] ([i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-9:        NOTRUN -> [SKIP][169] ([i915#13049])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         [PASS][170] -> [FAIL][171] ([i915#13566]) +3 other tests fail
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg2-9:        NOTRUN -> [SKIP][172] ([i915#3555]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#3555]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#13049]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu-1:       NOTRUN -> [FAIL][175] ([i915#13566]) +1 other test fail
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#3555]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#13049])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#13049])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#13049])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][180] -> [FAIL][181] ([i915#13566]) +1 other test fail
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#9809])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
    - shard-dg2-9:        NOTRUN -> [SKIP][183] ([i915#13046] / [i915#5354])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#4103] / [i915#4213])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#4103])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][186] ([i915#4103] / [i915#4213])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-rkl:          [PASS][187] -> [SKIP][188] ([i915#11190] / [i915#14544]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#13046] / [i915#5354]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-rkl:          [PASS][190] -> [FAIL][191] ([i915#2346])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][192] ([i915#12964]) +11 other tests dmesg-warn
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#9833])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#9723])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#9723])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#9723]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#13691])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [PASS][198] -> [SKIP][199] ([i915#1257])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-11/igt@kms_dp_aux_dev.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#13749])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#13748])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-10/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-9:        NOTRUN -> [SKIP][202] ([i915#13707])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#3555] / [i915#3840])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3840])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][205] ([i915#3555] / [i915#3840])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#3555] / [i915#3840])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [PASS][207] -> [SKIP][208] ([i915#14544] / [i915#14561])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-9:        NOTRUN -> [SKIP][209] ([i915#3469])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#1839])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-9:        NOTRUN -> [SKIP][211] ([i915#1839])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#9337])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#9337])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#9337])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_feature_discovery@dp-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#9337])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#658])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#658])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2-9:        NOTRUN -> [SKIP][218] ([i915#4881])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#14544] / [i915#9934])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#9934])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#3637] / [i915#9934]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#3637] / [i915#9934])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-glk:          [PASS][223] -> [SKIP][224]
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-glk3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][225] -> [FAIL][226] ([i915#13027]) +1 other test fail
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-snb6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][227] ([i915#3637] / [i915#9934]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#9934]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-9:        NOTRUN -> [SKIP][229] ([i915#9934]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2-9:        NOTRUN -> [SKIP][230] ([i915#8381])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][231] -> [SKIP][232] ([i915#14544] / [i915#3637]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_flip@flip-vs-suspend.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][233] ([i915#12314] / [i915#4839])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#2672]) +6 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#2672] / [i915#3555]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#2587] / [i915#2672]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#2587] / [i915#2672]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#2672] / [i915#3555]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#2587] / [i915#2672]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][241] ([i915#2672] / [i915#3555])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#2672]) +4 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#2672] / [i915#3555]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#2672] / [i915#8813]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-rkl:          [PASS][248] -> [SKIP][249] ([i915#14544] / [i915#3555]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
    - shard-dg2-9:        NOTRUN -> [SKIP][250] ([i915#2672] / [i915#3555] / [i915#5190])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][251] ([i915#2672]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          NOTRUN -> [SKIP][252] +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          [PASS][253] -> [SKIP][254] ([i915#14544] / [i915#1849] / [i915#5354]) +7 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [FAIL][255] ([i915#6880])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-9:        NOTRUN -> [FAIL][256] ([i915#6880])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#1825]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#5354]) +18 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][259] ([i915#8708]) +9 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [PASS][260] -> [FAIL][261] ([i915#6880])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#8708]) +7 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#3458]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][264] +13 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#1825]) +4 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][266] +57 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#3023]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-9:        NOTRUN -> [SKIP][268] ([i915#9766])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#8708])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][270] ([i915#3458]) +13 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#3458]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#8708]) +13 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][273] ([i915#5354]) +21 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][274] +39 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          [PASS][275] -> [SKIP][276] ([i915#3555] / [i915#8228])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#12713])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#3555] / [i915#8228])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#3555] / [i915#8228])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-10/igt@kms_hdr@static-swap.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-rkl:          [PASS][280] -> [SKIP][281] ([i915#14544] / [i915#3555] / [i915#8826]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_invalid_mode@bad-vsync-end.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#12339])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-snb:          [PASS][283] -> [ABORT][284] ([i915#12817]) +1 other test abort
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-snb7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][285] ([i915#13705])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format:
    - shard-rkl:          [PASS][286] -> [SKIP][287] ([i915#14544] / [i915#8825]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane@pixel-format.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane@pixel-format.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][288] ([i915#10647] / [i915#12177])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][289] ([i915#10647]) +1 other test fail
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#3555] / [i915#8821])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#13958])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-12/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2-9:        NOTRUN -> [SKIP][292] ([i915#13958])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#13958])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-9:        NOTRUN -> [SKIP][294] ([i915#12247] / [i915#9423])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-9:        NOTRUN -> [SKIP][295] ([i915#12247]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#12247]) +3 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#12247]) +9 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#12247]) +4 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#12247]) +9 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-rkl:          [PASS][300] -> [SKIP][301] ([i915#14544] / [i915#8152])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#12247] / [i915#6953]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#12247]) +16 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:
    - shard-rkl:          [PASS][304] -> [SKIP][305] ([i915#12247] / [i915#14544] / [i915#8152]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#12247] / [i915#6953] / [i915#9423])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#12247]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][308] ([i915#12247] / [i915#3555])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - shard-rkl:          [PASS][309] -> [SKIP][310] ([i915#12247] / [i915#14544]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#5354])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@kms_pm_backlight@basic-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#5354])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_pm_backlight@basic-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#9812])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#12343])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-9:        NOTRUN -> [SKIP][315] ([i915#3828])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#9685])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#4077]) +5 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#9519]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [PASS][319] -> [DMESG-WARN][320] ([i915#4423])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-17/igt@kms_pm_rpm@i2c.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][321] -> [SKIP][322] ([i915#9519])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#9519])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2-9:        NOTRUN -> [SKIP][324] ([i915#6524] / [i915#6805])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-rkl:          [PASS][325] -> [SKIP][326] ([i915#11521] / [i915#14544])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_properties@crtc-properties-atomic.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][327] ([i915#11520])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#11520])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#12316])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#11520])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#11520]) +6 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][332] ([i915#11520]) +8 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#11520]) +3 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-dg2-9:        NOTRUN -> [SKIP][334] ([i915#11520]) +4 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][335] ([i915#11520]) +5 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#9683])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#9683])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#1072] / [i915#14544] / [i915#9732])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#1072] / [i915#9732]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-14/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr-primary-blt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][340] ([i915#9688]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-4/igt@kms_psr@fbc-psr-primary-blt@edp-1.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][341] ([i915#1072] / [i915#9732]) +13 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#9732]) +13 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][343] ([i915#9732]) +5 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#1072] / [i915#9732]) +7 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#5190])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][346] ([i915#12755] / [i915#5190])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#12755])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][348] ([i915#13179]) +1 other test abort
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_selftest@drm_framebuffer.html
    - shard-tglu:         NOTRUN -> [ABORT][349] ([i915#13179]) +1 other test abort
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#3555])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#3555]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#3555] / [i915#8809])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#8623])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#1311])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#3555]) +3 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - shard-dg2-9:        NOTRUN -> [SKIP][356] ([i915#9906])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#9906])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][358] ([i915#9906])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-9:        NOTRUN -> [SKIP][359] ([i915#2437])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-glk:          NOTRUN -> [SKIP][360] ([i915#2437])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#2437] / [i915#9412])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-14/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu-1:       NOTRUN -> [SKIP][362] ([i915#2437])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#2437])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#2437] / [i915#9412]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@non-zero-reason:
    - shard-dg2-9:        NOTRUN -> [FAIL][365] ([i915#9100]) +1 other test fail
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@perf@non-zero-reason.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2-9:        NOTRUN -> [FAIL][366] ([i915#4349]) +4 other tests fail
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#14121]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#14121]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-19/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
    - shard-mtlp:         NOTRUN -> [SKIP][369] ([i915#14121]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#3708] / [i915#4077])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@prime_vgem@basic-gtt.html

  * igt@runner@aborted:
    - shard-mtlp:         NOTRUN -> ([FAIL][371], [FAIL][372]) ([i915#14489])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@runner@aborted.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@runner@aborted.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#9917])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#9917])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#9917])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][376] ([i915#12910]) +9 other tests fail
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html
    - shard-mtlp:         NOTRUN -> [FAIL][377] ([i915#12910]) +9 other tests fail
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2-9:        NOTRUN -> [SKIP][378] ([i915#9917])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-dg2:          [FAIL][379] -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-3/igt@fbdev@read.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-8/igt@fbdev@read.html
    - shard-rkl:          [SKIP][381] ([i915#14544] / [i915#2582]) -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@fbdev@read.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@fbdev@read.html
    - shard-dg1:          [FAIL][383] -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-18/igt@fbdev@read.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@fbdev@read.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][385] ([i915#5784]) -> [PASS][386] +1 other test pass
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-19/igt@gem_eio@unwedge-stress.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-12/igt@gem_eio@unwedge-stress.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-rkl:          [TIMEOUT][387] ([i915#12917] / [i915#12964]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@kms_busy@basic:
    - shard-rkl:          [SKIP][389] ([i915#11190] / [i915#14544]) -> [PASS][390] +2 other tests pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_busy@basic.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_busy@basic.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-rkl:          [SKIP][391] ([i915#12655] / [i915#14544]) -> [PASS][392] +2 other tests pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_color@legacy-gamma-reset.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [SKIP][393] ([i915#14544]) -> [PASS][394] +46 other tests pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [FAIL][395] ([i915#13566]) -> [PASS][396] +5 other tests pass
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          [FAIL][397] ([i915#13566]) -> [PASS][398] +1 other test pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-rkl:          [DMESG-WARN][399] ([i915#12964]) -> [PASS][400] +38 other tests pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_draw_crc@draw-method-mmap-gtt.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_feature_discovery@display-1x:
    - shard-rkl:          [SKIP][401] ([i915#14544] / [i915#9738]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_feature_discovery@display-1x.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg1:          [DMESG-WARN][403] ([i915#4423]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-13/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-14/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-rkl:          [SKIP][405] ([i915#14544] / [i915#3637]) -> [PASS][406] +5 other tests pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-rkl:          [SKIP][407] ([i915#14544] / [i915#3555]) -> [PASS][408] +4 other tests pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-rkl:          [DMESG-WARN][409] ([i915#12917] / [i915#12964]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_flip_tiling@flip-change-tiling.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][411] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][412] +13 other tests pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-snb:          [SKIP][413] -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [FAIL][415] ([i915#6880]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-rkl:          [SKIP][417] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][418] +1 other test pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [SKIP][419] ([i915#12388]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-rkl:          [SKIP][421] ([i915#14544] / [i915#7294]) -> [PASS][422] +1 other test pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-rkl:          [SKIP][423] ([i915#14544] / [i915#8152]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-rkl:          [SKIP][425] ([i915#14544] / [i915#3555] / [i915#8152]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:
    - shard-rkl:          [SKIP][427] ([i915#12247] / [i915#14544]) -> [PASS][428] +2 other tests pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-rkl:          [SKIP][429] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][430] +3 other tests pass
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-rkl:          [SKIP][431] ([i915#13441] / [i915#14544]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-negative.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][433] ([i915#9519]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][435] ([i915#9519]) -> [PASS][436] +2 other tests pass
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-rkl:          [SKIP][437] ([i915#14544] / [i915#9519]) -> [PASS][438] +1 other test pass
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-rkl:          [SKIP][439] ([i915#14544] / [i915#6524]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_prime@basic-crc-vgem.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-rkl:          [SKIP][441] ([i915#11521] / [i915#14544]) -> [PASS][442] +1 other test pass
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_setmode@basic:
    - shard-dg1:          [FAIL][443] ([i915#5465]) -> [PASS][444] +1 other test pass
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-17/igt@kms_setmode@basic.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][445] ([i915#5465]) -> [PASS][446] +2 other tests pass
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@perf@blocking:
    - shard-mtlp:         [FAIL][447] ([i915#10538]) -> [PASS][448] +1 other test pass
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-6/igt@perf@blocking.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-6/igt@perf@blocking.html

  * igt@perf@polling-small-buf:
    - shard-rkl:          [FAIL][449] ([i915#14550]) -> [PASS][450]
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@perf@polling-small-buf.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@perf@polling-small-buf.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-mtlp:         [FAIL][451] ([i915#11943]) -> [PASS][452] +1 other test pass
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          [SKIP][453] ([i915#14544] / [i915#8411]) -> [SKIP][454] ([i915#8411])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][455] ([i915#11078]) -> [SKIP][456] ([i915#11078] / [i915#14544]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          [SKIP][457] ([i915#3281]) -> [SKIP][458] ([i915#14544] / [i915#3281]) +7 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@gem_bad_reloc@negative-reloc-lut.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][459] ([i915#14544] / [i915#9323]) -> [SKIP][460] ([i915#9323])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          [SKIP][461] ([i915#7697]) -> [SKIP][462] ([i915#14544] / [i915#7697])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@gem_close_race@multigpu-basic-process.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          [SKIP][463] ([i915#6335]) -> [SKIP][464] ([i915#14544] / [i915#6335])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@gem_create@create-ext-cpu-access-big.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          [SKIP][465] ([i915#14544] / [i915#6335]) -> [SKIP][466] ([i915#6335])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          [SKIP][467] ([i915#8562]) -> [SKIP][468] ([i915#14544] / [i915#8562])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@gem_create@create-ext-set-pat.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          [SKIP][469] ([i915#280]) -> [SKIP][470] ([i915#14544] / [i915#280])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          [SKIP][471] ([i915#4525]) -> [SKIP][472] ([i915#14544] / [i915#4525])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@gem_exec_balancer@parallel-ordering.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          [SKIP][473] ([i915#14544] / [i915#4525]) -> [SKIP][474] ([i915#4525])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-rkl:          [SKIP][475] ([i915#14544] / [i915#3281]) -> [SKIP][476] ([i915#3281]) +9 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-noreloc.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          [SKIP][477] ([i915#4613] / [i915#7582]) -> [SKIP][478] ([i915#14544] / [i915#4613] / [i915#7582])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@gem_lmem_evict@dontneed-evict-race.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-rkl:          [SKIP][479] ([i915#4613]) -> [SKIP][480] ([i915#14544] / [i915#4613]) +2 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@gem_lmem_swapping@heavy-random.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-rkl:          [SKIP][481] ([i915#14544] / [i915#4613]) -> [SKIP][482] ([i915#4613]) +2 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-rkl:          [SKIP][483] ([i915#3282]) -> [SKIP][484] ([i915#14544] / [i915#3282]) +3 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@gem_madvise@dontneed-before-pwrite.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          [SKIP][485] ([i915#14544] / [i915#3282]) -> [SKIP][486] ([i915#3282]) +6 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          [SKIP][487] ([i915#14544] / [i915#4270]) -> [TIMEOUT][488] ([i915#12917] / [i915#12964])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          [TIMEOUT][489] ([i915#12917] / [i915#12964]) -> [SKIP][490] ([i915#14544] / [i915#4270])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          [SKIP][491] ([i915#3297]) -> [SKIP][492] ([i915#14544] / [i915#3297])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@gem_userptr_blits@coherency-sync.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          [SKIP][493] ([i915#14544] / [i915#3297]) -> [SKIP][494] ([i915#3297]) +1 other test skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-rkl:          [SKIP][495] ([i915#2527]) -> [SKIP][496] ([i915#14544] / [i915#2527])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@gen9_exec_parse@bb-secure.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          [SKIP][497] ([i915#14544] / [i915#2527]) -> [SKIP][498] ([i915#2527]) +4 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][499] ([i915#8399]) -> [SKIP][500] ([i915#14544] / [i915#8399]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          [SKIP][501] ([i915#14498] / [i915#14544]) -> [SKIP][502] ([i915#14498])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][503] ([i915#14544] / [i915#4387]) -> [SKIP][504] ([i915#4387])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@i915_pm_sseu@full-enable.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          [SKIP][505] ([i915#12454] / [i915#12712] / [i915#14544]) -> [SKIP][506] ([i915#12454] / [i915#12712])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          [SKIP][507] ([i915#14544]) -> [SKIP][508] ([i915#9531])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg1:          [SKIP][509] ([i915#4423] / [i915#4538] / [i915#5286]) -> [SKIP][510] ([i915#4538] / [i915#5286])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-18/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][511] ([i915#5286]) -> [SKIP][512] ([i915#14544]) +3 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-rkl:          [SKIP][513] ([i915#14544]) -> [SKIP][514] ([i915#5286]) +2 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          [SKIP][515] ([i915#3638]) -> [SKIP][516] ([i915#14544]) +2 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][517] ([i915#14544]) -> [SKIP][518] ([i915#3638])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          [SKIP][519] ([i915#14544]) -> [SKIP][520] +14 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][521] ([i915#6095]) -> [SKIP][522] ([i915#14098] / [i915#6095])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][523] ([i915#14098] / [i915#6095]) -> [SKIP][524] ([i915#14544]) +12 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][525] ([i915#14098] / [i915#6095]) -> [SKIP][526] ([i915#6095]) +3 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg1:          [SKIP][527] ([i915#12313]) -> [SKIP][528] ([i915#12313] / [i915#4423])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][529] ([i915#14544]) -> [SKIP][530] ([i915#14098] / [i915#6095]) +15 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          [SKIP][531] ([i915#14544] / [i915#3742]) -> [SKIP][532] ([i915#3742])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_cdclk@mode-transition.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-rkl:          [SKIP][533] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][534] ([i915#11151] / [i915#7828]) +9 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][535] ([i915#11151] / [i915#7828]) -> [SKIP][536] ([i915#11151] / [i915#14544] / [i915#7828]) +6 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          [FAIL][537] ([i915#7173]) -> [SKIP][538] ([i915#7118] / [i915#9424])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-11/igt@kms_content_protection@atomic.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-rkl:          [SKIP][539] ([i915#9424]) -> [SKIP][540] ([i915#14544])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_content_protection@content-type-change.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          [SKIP][541] ([i915#14544]) -> [SKIP][542] ([i915#9424])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_content_protection@lic-type-1.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][543] ([i915#9433]) -> [SKIP][544] ([i915#9424])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-13/igt@kms_content_protection@mei-interface.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          [SKIP][545] ([i915#14544]) -> [SKIP][546] ([i915#7118] / [i915#9424]) +1 other test skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_content_protection@type1.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-rkl:          [SKIP][547] ([i915#14544]) -> [SKIP][548] ([i915#3555]) +2 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][549] ([i915#13049]) -> [SKIP][550] ([i915#14544])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x512.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][551] ([i915#14544]) -> [SKIP][552] ([i915#13049]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][553] -> [SKIP][554] ([i915#14544]) +15 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          [SKIP][555] ([i915#14544]) -> [SKIP][556] ([i915#4103]) +1 other test skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          [SKIP][557] ([i915#14544]) -> [SKIP][558] ([i915#13749])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          [SKIP][559] ([i915#14544]) -> [SKIP][560] ([i915#13748])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          [SKIP][561] ([i915#13707]) -> [SKIP][562] ([i915#14544])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][563] ([i915#3840]) -> [SKIP][564] ([i915#14544])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          [SKIP][565] ([i915#3555] / [i915#3840]) -> [SKIP][566] ([i915#14544])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][567] ([i915#14544] / [i915#3955]) -> [SKIP][568] ([i915#3955])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][569] ([i915#3955]) -> [SKIP][570] ([i915#14544] / [i915#3955])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          [SKIP][571] ([i915#4854]) -> [SKIP][572] ([i915#14544] / [i915#4854])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_feature_discovery@chamelium.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          [SKIP][573] ([i915#1839]) -> [SKIP][574] ([i915#14544] / [i915#1839])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_feature_discovery@display-4x.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          [SKIP][575] ([i915#14544] / [i915#9934]) -> [SKIP][576] ([i915#9934]) +8 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_flip@2x-plain-flip.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-rkl:          [SKIP][577] ([i915#9934]) -> [SKIP][578] ([i915#14544] / [i915#9934]) +4 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][579] ([i915#12745] / [i915#4839]) -> [INCOMPLETE][580] ([i915#12314] / [i915#12745] / [i915#4839])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-glk5/igt@kms_flip@flip-vs-suspend.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][581] ([i915#14544] / [i915#3555]) -> [SKIP][582] ([i915#2672] / [i915#3555]) +4 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-rkl:          [SKIP][583] ([i915#2672] / [i915#3555]) -> [SKIP][584] ([i915#14544] / [i915#3555]) +1 other test skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][585] ([i915#1825]) -> [SKIP][586] ([i915#14544] / [i915#1849] / [i915#5354]) +27 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          [SKIP][587] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][588] ([i915#3023]) +18 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][589] -> [SKIP][590] ([i915#14544] / [i915#1849] / [i915#5354]) +1 other test skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          [SKIP][591] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][592] ([i915#9766])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][593] ([i915#10433] / [i915#3458]) -> [SKIP][594] ([i915#3458]) +3 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][595] ([i915#3023]) -> [SKIP][596] ([i915#14544] / [i915#1849] / [i915#5354]) +17 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          [SKIP][597] ([i915#3458]) -> [SKIP][598] ([i915#3458] / [i915#4423])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg1:          [SKIP][599] ([i915#4423]) -> [SKIP][600]
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][601] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][602] ([i915#1825]) +37 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2:          [SKIP][603] ([i915#3458]) -> [SKIP][604] ([i915#10433] / [i915#3458])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][605] ([i915#1187] / [i915#12713]) -> [SKIP][606] ([i915#12713])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][607] ([i915#3555] / [i915#8228]) -> [SKIP][608] ([i915#14544]) +1 other test skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_hdr@static-toggle.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          [SKIP][609] ([i915#14544]) -> [SKIP][610] ([i915#3555] / [i915#8228]) +1 other test skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          [SKIP][611] ([i915#12388] / [i915#14544]) -> [SKIP][612] ([i915#12388])
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          [SKIP][613] ([i915#13688] / [i915#14544]) -> [SKIP][614] ([i915#13688])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          [SKIP][615] ([i915#12394] / [i915#14544]) -> [SKIP][616] ([i915#12394])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg1:          [SKIP][617] ([i915#12339]) -> [SKIP][618] ([i915#12339] / [i915#4423])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-19/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][619] ([i915#4816]) -> [SKIP][620] ([i915#1839] / [i915#4816])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][621] ([i915#14544]) -> [SKIP][622] ([i915#6301])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_panel_fitting@legacy.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-rkl:          [DMESG-WARN][623] ([i915#12964]) -> [SKIP][624] ([i915#11190] / [i915#14544])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-3/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          [SKIP][625] ([i915#14544]) -> [SKIP][626] ([i915#13958])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          [SKIP][627] ([i915#14544]) -> [SKIP][628] ([i915#14259])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [SKIP][629] ([i915#6953]) -> [SKIP][630] ([i915#14544] / [i915#6953] / [i915#8152])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-rkl:          [SKIP][631] ([i915#12247]) -> [SKIP][632] ([i915#12247] / [i915#14544] / [i915#8152]) +4 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-rkl:          [SKIP][633] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152]) -> [SKIP][634] ([i915#12247] / [i915#6953])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-rkl:          [SKIP][635] ([i915#12247] / [i915#14544]) -> [SKIP][636] ([i915#12247]) +3 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-rkl:          [SKIP][637] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][638] ([i915#12247]) +6 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-rkl:          [SKIP][639] ([i915#12247] / [i915#3555]) -> [SKIP][640] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#8152])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-rkl:          [SKIP][641] ([i915#12247]) -> [SKIP][642] ([i915#12247] / [i915#14544]) +2 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-rkl:          [DMESG-WARN][643] ([i915#12964]) -> [SKIP][644] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152])
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b:
    - shard-rkl:          [DMESG-WARN][645] ([i915#12964]) -> [SKIP][646] ([i915#12247] / [i915#14544] / [i915#8152])
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          [SKIP][647] ([i915#14544] / [i915#5354]) -> [SKIP][648] ([i915#5354]) +2 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][649] ([i915#9519]) -> [SKIP][650] ([i915#14544] / [i915#9519]) +2 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][651] ([i915#6524]) -> [SKIP][652] ([i915#14544] / [i915#6524]) +1 other test skip
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_prime@basic-modeset-hybrid.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][653] ([i915#11520]) -> [SKIP][654] ([i915#11520] / [i915#14544]) +4 other tests skip
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][655] ([i915#11520] / [i915#14544]) -> [SKIP][656] ([i915#11520]) +6 other tests skip
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-dg1:          [SKIP][657] ([i915#1072] / [i915#9732]) -> [SKIP][658] ([i915#1072] / [i915#4423] / [i915#9732])
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-16/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-rkl:          [SKIP][659] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][660] ([i915#1072] / [i915#9732]) +21 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_psr@psr-cursor-render.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          [SKIP][661] ([i915#1072] / [i915#9732]) -> [SKIP][662] ([i915#1072] / [i915#14544] / [i915#9732]) +13 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          [SKIP][663] ([i915#5289]) -> [SKIP][664] ([i915#14544])
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-rkl:          [SKIP][665] ([i915#3555]) -> [SKIP][666] ([i915#14544]) +1 other test skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_scaling_modes@scaling-mode-center.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-rkl:          [DMESG-WARN][667] ([i915#12964]) -> [SKIP][668] ([i915#14544]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_vblank@wait-forked-busy-hang.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          [SKIP][669] ([i915#14544]) -> [SKIP][670] ([i915#3555] / [i915#9906])
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_vrr@negative-basic.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          [SKIP][671] ([i915#14544]) -> [SKIP][672] ([i915#9906])
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          [SKIP][673] ([i915#14544] / [i915#2435]) -> [SKIP][674] ([i915#2435])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@module-unload:
    - shard-rkl:          [DMESG-FAIL][675] ([i915#12964]) -> [FAIL][676] ([i915#14433])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@perf_pmu@module-unload.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          [SKIP][677] ([i915#3708]) -> [SKIP][678] ([i915#14544] / [i915#3708])
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@prime_vgem@coherency-gtt.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-rkl:          [SKIP][679] ([i915#9917]) -> [SKIP][680] ([i915#14544] / [i915#9917])
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#12967]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#1311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1311
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14489
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14550
  [i915#14561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14561
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
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
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
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
  [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8457 -> IGTPW_13463
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_16863: 9579a27e412210571020a1640bc8a99ed770444d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13463: 414c6d463822c7d5a6b2074f24e9d01230915bac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/index.html

--===============4068521281862038807==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Pull Panel Replay check before setting up output (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151561/">https://patchwork.freedesktop.org/series/151561/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_16863_full -&gt; IGTPW_13463_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13463_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13463_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13463_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-6/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@gem_eio@kms.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@normal:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-7/igt@gem_linear_blits@normal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@gem_linear_blits@normal.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-3/igt@kms_psr@psr2-sprite-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-6/igt@kms_psr@psr2-sprite-render.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_16863_full and IGTPW_13463_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_async_flips@crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@d-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13463_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-18/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391">i915#4391</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-15/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-7/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-6/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-8/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_exec_fence@submit67.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-12/igt@gem_exec_reloc@basic-cpu-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@gem_exec_reloc@basic-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@gem_exec_schedule@fairslice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@gem_exec_schedule@fairslice.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213">i915#8213</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk8/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-5/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_lmem_swapping@smem-oom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-5/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@gem_mmap@bad-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@pf-nonblock:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_mmap@pf-nonblock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-copy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_mmap_gtt@basic-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@gem_mmap_wc@copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-5/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-2/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_pread@uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@gem_render_copy@yf-tiled-ccs-to-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-2/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-5/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@i915_drm_fdinfo@busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@i915_drm_fdinfo@busy-hang@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@i915_drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-17/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-4/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328">i915#13328</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@i915_pm_rps@thresholds-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-2/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-7/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-5/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967">i915#12967</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-10/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-7/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-6/igt@kms_big_fb@linear-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-10/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-7/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +257 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +115 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784">i915#13784</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784">i915#13784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-2/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_color@ctm-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-11/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-1/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-10/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14561">i915#14561</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-2/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-glk3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-snb6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-10/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_invalid_mode@bad-vsync-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-snb7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817">i915#12817</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane@pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-12/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +9 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-17/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_properties@crtc-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_properties@crtc-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521">i915#11521</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-14/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-4/igt@kms_psr@fbc-psr-primary-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-3/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-9/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1311">i915#1311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk9/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-14/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-7/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@perf@non-zero-reason.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100">i915#9100</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-6/igt@prime_mmap@test_aperture_limit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-19/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-1/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14489">i915#14489</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-9/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-3/igt@fbdev@read.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-8/igt@fbdev@read.html">PASS</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@fbdev@read.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-18/igt@fbdev@read.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-19/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-12/igt@gem_eio@unwedge-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_busy@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_color@legacy-gamma-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_color@legacy-gamma-reset.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html">PASS</a> +46 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_draw_crc@draw-method-mmap-gtt.html">PASS</a> +38 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738">i915#9738</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_feature_discovery@display-1x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-13/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-14/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_flip@flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294">i915#7294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441">i915#13441</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +2 other tests pass</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_prime@basic-crc-vgem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521">i915#11521</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_properties@plane-properties-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-17/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-15/igt@kms_setmode@basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-7/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf@blocking:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-6/igt@perf@blocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-6/igt@perf@blocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14550">i915#14550</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943">i915#11943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-18/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-18/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-11/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-7/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-13/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-17/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i915#4854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-glk5/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-glk8/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-19/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-3/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-dg1-16/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-dg1-13/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@kms_vblank@wait-forked-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@kms_vblank@wait-forked-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-2/igt@perf_pmu@module-unload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-7/igt@perf_pmu@module-unload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-4/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16863/shard-rkl-7/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13463/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8457 -&gt; IGTPW_13463</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16863: 9579a27e412210571020a1640bc8a99ed770444d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13463: 414c6d463822c7d5a6b2074f24e9d01230915bac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4068521281862038807==--
