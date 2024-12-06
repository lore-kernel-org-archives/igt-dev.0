Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A896E7716F
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 04:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242A610E03D;
	Fri,  6 Dec 2024 04:08:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6E710E03D;
 Fri,  6 Dec 2024 04:08:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Update_skip_messages_in_?=
 =?utf-8?q?scaling_modes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 04:08:22 -0000
Message-ID: <173345810283.3172147.18156427135855918810@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205122528.3761118-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20241205122528.3761118-1-ramanaidu.naladala@intel.com>
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

Series: Update skip messages in scaling modes (rev2)
URL   : https://patchwork.freedesktop.org/series/141850/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15798_full -> IGTPW_12257_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12257_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12257_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12257_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@debugfs-reader:
    - shard-snb:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-snb7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15798_full and IGTPW_12257_full:

### New IGT tests (7) ###

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.23, 2.26] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.26] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.24] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.77] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12257_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@virtual-busy-hang-all:
    - shard-mtlp:         NOTRUN -> [SKIP][3] ([i915#8414])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-6/igt@drm_fdinfo@virtual-busy-hang-all.html
    - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8414])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-8/igt@drm_fdinfo@virtual-busy-hang-all.html
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#8414])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-14/igt@drm_fdinfo@virtual-busy-hang-all.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#7697]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][7] ([i915#7297]) +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-3/igt@gem_ccs@suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-5/igt@gem_ccs@suspend-resume.html
    - shard-tglu-1:       NOTRUN -> [SKIP][9] ([i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-1/igt@gem_ccs@suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@gem_ccs@suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#7697])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#7697])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-5/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#7697])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-10/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#7697])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_ctx_persistence@hostile:
    - shard-rkl:          [PASS][16] -> [FAIL][17] ([i915#11980] / [i915#12580])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15798/shard-rkl-3/igt@gem_ctx_persistence@hostile.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][18] ([i915#1099]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-snb1/igt@gem_ctx_persistence@processes.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][19] ([i915#10030] / [i915#7975] / [i915#8213])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-2/igt@gem_eio@hibernate.html
    - shard-rkl:          NOTRUN -> [ABORT][20] ([i915#7975] / [i915#8213])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-tglu-1:       NOTRUN -> [ABORT][21] ([i915#13218]) +2 other tests abort
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-1/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#4812]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#4812]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#3539])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-14/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#5107])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-6/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#3281]) +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-10/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#3281]) +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#3281]) +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#3281]) +9 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#4537] / [i915#4812])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-7/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4537] / [i915#4812])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4812]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-14/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4613]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#4613]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][35] ([i915#4613]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-glk5/igt@gem_lmem_swapping@random-engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4613]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4077]) +8 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-8/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4077]) +9 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-8/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_gtt@medium-copy:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4077]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@gem_mmap_gtt@medium-copy.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4083]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-5/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@read:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4083]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-3/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4083]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3282]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-7/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pwrite_snooped:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3282]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@gem_pwrite_snooped.html
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3282]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@gem_pwrite_snooped.html
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3282]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-4/igt@gem_pwrite_snooped.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [TIMEOUT][47] ([i915#12917] / [i915#12964])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#5190] / [i915#8428]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#8428]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4079])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-12/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4079])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@gem_tiled_pread_pwrite.html
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4079])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-6/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3297]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-12/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#3297]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#3297]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3297] / [i915#4880])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@relocations:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3281] / [i915#3297])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@gem_userptr_blits@relocations.html
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3281] / [i915#3297])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-7/igt@gem_userptr_blits@relocations.html
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#3281] / [i915#3297])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3281] / [i915#3297])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3297]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap.html
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3297]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#2856])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-8/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#2527]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-7/igt@gen9_exec_parse@bb-start-param.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#2527]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-14/igt@gen9_exec_parse@bb-start-param.html
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#2527] / [i915#2856]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-2/igt@gen9_exec_parse@bb-start-param.html
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#2856]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-7/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#7091])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-1/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#8436])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#8399])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#8399])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          NOTRUN -> [FAIL][72] ([i915#3591])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#11681] / [i915#6621])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-14/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#11681] / [i915#6621])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-7/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          NOTRUN -> [INCOMPLETE][75] ([i915#7790])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-snb7/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][76] ([i915#7443])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-3/igt@i915_suspend@basic-s3-without-i915.html
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#6645])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][78] ([i915#4817])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-glk9/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4215])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4212]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4212])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-5/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4212])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-12/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#6228])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-1/igt@kms_async_flips@invalid-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#6228])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#5286]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4538] / [i915#5286]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-12/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#5286]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][88] +21 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3638]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3638]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4538] / [i915#5190]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4538])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-12/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#6187])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#5190])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][96] +206 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-glk9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#10307] / [i915#10434] / [i915#6095])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#6095]) +44 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#10307] / [i915#6095]) +48 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#6095]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#6095]) +64 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][102] ([i915#12796]) +1 other test incomplete
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#12313])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#12313])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#12313])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#12313])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#12313])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#6095]) +45 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#6095]) +64 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#7828]) +7 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#7828]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#7828]) +6 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-3/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#7828]) +7 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#7828]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#6944] / [i915#9424])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-5/igt@kms_content_protection@content-type-change.html
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#9424])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-10/igt@kms_content_protection@content-type-change.html
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#9424])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-3/igt@kms_content_protection@content-type-change.html
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#9424])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-18/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#6944] / [i915#9424]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-4/igt@kms_content_protection@uevent.html
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#7118] / [i915#9424])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@kms_content_protection@uevent.html
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#7118] / [i915#9424])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_content_protection@uevent.html
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#3555])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#3555]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#3555] / [i915#8814]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#3555]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#13049]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#13049])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#13049]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#13049]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#13049])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-snb:          NOTRUN -> [ABORT][132] ([i915#13242]) +13 other tests abort
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-snb4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#9809])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#9833])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#9723])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#9723])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#9723]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#9833])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#3555] / [i915#3840]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#3555] / [i915#3840]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-6/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3555] / [i915#3840]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3555] / [i915#3840]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#3555] / [i915#3840]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#3955])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#3469])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#3469])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-9/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#3469])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#1839])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-6/igt@kms_feature_discovery@display-2x.html
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#1839])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@kms_feature_discovery@display-2x.html
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#1839])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#1839])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#1839])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#658])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-18/igt@kms_feature_discovery@psr2.html
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#658])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-5/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#658])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-10/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#658])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-busy-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#3637]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-1/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#3637]) +9 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#9934]) +8 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#9934]) +9 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#9934]) +8 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3637]) +7 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-snb:          NOTRUN -> [FAIL][163] ([i915#11989]) +1 other test fail
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-rkl:          NOTRUN -> [FAIL][164] ([i915#11989]) +1 other test fail
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#3555] / [i915#8810] / [i915#8813])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#3555] / [i915#8810])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#2587] / [i915#2672] / [i915#3555])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#2587] / [i915#2672] / [i915#3555])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#2587] / [i915#2672])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#2672]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#2587] / [i915#2672])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#2672] / [i915#3555]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#2672]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#2672] / [i915#3555] / [i915#8813]) +5 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#2672] / [i915#3555]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#8708]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#1825]) +20 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][179] +29 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#8708]) +8 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#1825]) +27 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#8708]) +10 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#3023]) +14 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#10433] / [i915#3458])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#9766])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#9766])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#9766])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#9766])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#5354]) +25 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#3458]) +6 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#3458]) +7 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][192] +53 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3555] / [i915#8228])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#3555] / [i915#8228])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-3/igt@kms_hdr@bpc-switch-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#3555] / [i915#8228])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-1/igt@kms_hdr@bpc-switch-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#3555] / [i915#8228])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#10656])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_joiner@basic-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#10656])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#12388])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-7/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#12388])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-4/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#12388])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-7/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#12388])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#10656]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#12394])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#12394])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#12394])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#10656])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#12339])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#12339])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#12339])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-10/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#12339])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#12339])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#6301])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-7/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#6301])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-10/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#6301])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-1/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#6301])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][217] +14 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-5/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3555]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][219] ([i915#8292]) +1 other test fail
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#6953])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-4/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#6953] / [i915#9423])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#6953])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#12247] / [i915#9423]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#12247]) +9 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#12247]) +8 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#12247]) +18 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#12247]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#12247]) +14 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#12247] / [i915#6953])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#5354]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#5354]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#9812]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-4/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#9685])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#9685])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#9685])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#9685])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-10/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#9292])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#9519])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#9519])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#9519])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#9519])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#9519])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          [PASS][243] -> [INCOMPLETE][244] ([i915#10553])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15798/shard-glk4/igt@kms_pm_rpm@system-suspend-modeset.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-glk8/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][245] ([i915#11520]) +6 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-snb4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#11520]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-10/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#12316]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#9808]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#11520]) +7 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#11520]) +5 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#11520]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-glk:          NOTRUN -> [SKIP][252] ([i915#11520]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-glk4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#9683]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#9683]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#9683]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#4348]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#9683])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#9688]) +24 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-8/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][259] ([i915#9732])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-1/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#1072] / [i915#9732]) +16 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-8/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#1072] / [i915#9732]) +22 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#1072] / [i915#9732]) +18 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#4077] / [i915#9688]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-6/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#9732]) +19 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-9/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#12755] / [i915#5190])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#5289])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#5289])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#5289])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#12755])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][270] ([i915#5465]) +2 other tests fail
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-snb5/igt@kms_setmode@basic.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-snb:          NOTRUN -> [SKIP][271] +330 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-snb7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-mtlp:         NOTRUN -> [FAIL][272] ([i915#9196]) +1 other test fail
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#9906])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-glk:          NOTRUN -> [ABORT][274] ([i915#13218]) +22 other tests abort
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-glk3/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start:
    - shard-tglu:         NOTRUN -> [ABORT][275] ([i915#13218]) +25 other tests abort
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-2/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         NOTRUN -> [FAIL][276] ([i915#4349])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][277] ([i915#12964]) +2 other tests dmesg-warn
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-5/igt@perf_pmu@busy-double-start@vcs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][278] ([i915#4349]) +3 other tests fail
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@busy-start:
    - shard-rkl:          NOTRUN -> [ABORT][279] ([i915#13218]) +27 other tests abort
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-5/igt@perf_pmu@busy-start.html

  * igt@perf_pmu@event-wait:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#8807])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-7/igt@perf_pmu@event-wait.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8807])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-7/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@init-wait@rcs0:
    - shard-mtlp:         NOTRUN -> [ABORT][282] ([i915#13218]) +33 other tests abort
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-4/igt@perf_pmu@init-wait@rcs0.html

  * igt@perf_pmu@multi-client@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][283] ([i915#13218]) +15 other tests abort
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-snb5/igt@perf_pmu@multi-client@rcs0.html
    - shard-dg1:          NOTRUN -> [ABORT][284] ([i915#13218]) +23 other tests abort
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-18/igt@perf_pmu@multi-client@rcs0.html

  * igt@perf_pmu@semaphore-wait-idle@rcs0:
    - shard-dg2:          NOTRUN -> [ABORT][285] ([i915#13218]) +22 other tests abort
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-7/igt@perf_pmu@semaphore-wait-idle@rcs0.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#3291] / [i915#3708])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-4/igt@prime_vgem@basic-write.html
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#3291] / [i915#3708])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-7/igt@prime_vgem@basic-write.html
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#3708])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-17/igt@prime_vgem@basic-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#10216] / [i915#3708])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-2/igt@prime_vgem@basic-write.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#9917])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-11/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#9917])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][292] ([i915#12910]) +9 other tests fail
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-tglu-3/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html
    - shard-mtlp:         NOTRUN -> [FAIL][293] ([i915#12910]) +9 other tests fail
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-4/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][294] +17 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-7/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#4818])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-14/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#4818])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-7/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#4818])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg2-1/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@nonpriv-switch:
    - shard-rkl:          [DMESG-WARN][298] ([i915#12964]) -> [PASS][299] +3 other tests pass
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15798/shard-rkl-4/igt@gem_ctx_isolation@nonpriv-switch.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-rkl-3/igt@gem_ctx_isolation@nonpriv-switch.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg1:          [DMESG-WARN][300] ([i915#4423]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15798/shard-dg1-14/igt@kms_pm_rpm@system-suspend-modeset.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-dg1-13/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-mtlp:         [FAIL][302] ([i915#12857]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15798/shard-mtlp-5/igt@kms_psr@psr2-primary-page-flip.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-3/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr@psr2-primary-page-flip@edp-1:
    - shard-mtlp:         [FAIL][304] ([i915#10105]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15798/shard-mtlp-5/igt@kms_psr@psr2-primary-page-flip@edp-1.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/shard-mtlp-3/igt@kms_psr@psr2-primary-page-flip@edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
  [i915#10105]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10105
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11980]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12580
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12857]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12857
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#13242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13242
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6645
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7091]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7091
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7297
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7790
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8436
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8807]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
  [i915#9292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
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
  * IGT: IGT_8139 -> IGTPW_12257
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15798: 784dd0b20e39add60971ccdd5d2f7f3c27cf37bb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12257: 8300741ee6be9aa2661f5585f1f6b2c2d9450d4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8139: b0c59bb94e6c990589eb6825c1436ce412804dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/index.html
