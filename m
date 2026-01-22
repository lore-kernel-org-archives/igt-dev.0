Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FD4D6CFA2
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 19:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3296510E0FC;
	Thu, 22 Jan 2026 19:18:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC7F10E0FC;
 Thu, 22 Jan 2026 19:18:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1845622334328536617=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Close_any_open_drm_devic?=
 =?utf-8?q?e_after_engine_initialization_in_GPUTOP_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jan 2026 19:18:09 -0000
Message-ID: <176910948994.185190.9472090951196909139@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122084526.538837-1-soham.purkait@intel.com>
In-Reply-To: <20260122084526.538837-1-soham.purkait@intel.com>
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

--===============1845622334328536617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Close any open drm device after engine initialization in GPUTOP (rev7)
URL   : https://patchwork.freedesktop.org/series/158161/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8712_full -> IGTPW_14395_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14395_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14395_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14395_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_spin_batch@resubmit-new-all@vecs0:
    - shard-dg1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-14/igt@gem_spin_batch@resubmit-new-all@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@gem_spin_batch@resubmit-new-all@vecs0.html

  
New tests
---------

  New tests have been introduced between IGT_8712_full and IGTPW_14395_full:

### New IGT tests (51) ###

  * igt@gem_spin_batch@2x-flip-vs-panning-vs-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@2x-long-cursor-vs-flip-legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@addfb25-y-tiled-small-legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@bad-pitch-128:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@basic-auth:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@basic-busy-flip-before-cursor-legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@blob-multiple:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@blocking:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@cursor-onscreen-128x42:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@cursor-rapid-movement-64x21:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@cursor-vs-flip-atomic-transitions-varying-size:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@cursora-vs-flipb-varying-size:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@dsc-with-formats:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@etime-multi-wait-all-for-submit-unsubmitted-submitted:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@export-wait-after-attach:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@fbc-1p-offscreen-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@fbc-1p-primscrn-spr-indfb-draw-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@fbcpsr-1p-primscrn-cur-indfb-move:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@invalid-pad:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@invalid-param-get:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@invalid-single-wait-all-unsubmitted:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@linear-16bpp-rotate-270:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@media-freq:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@memory-info-resident:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@multi-wait-all-for-submit-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@pixel-format-source-clamping:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@plane-immutable-zpos:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@preempt-other:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@psr-2p-primscrn-spr-indfb-fullscreen:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@psr-abgr161616f-draw-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@reject-modify-context-protection-off-3:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@reset-stress:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@shrink:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@single-wait-all-for-submit-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@standalone:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@sync_merge:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@system-suspend-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@test_userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@waits:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@x-tiled-max-hw-stride-32bpp-rotate-0:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@y-tiled-16bpp-rotate-90:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_14395_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8411])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#8411])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8411]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][7] ([i915#6230])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@api_intel_bb@crc32.html

  * igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][8] ([i915#15095]) +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][9] ([i915#15095]) +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#7697]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#3936])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][14] ([i915#13356]) +1 other test incomplete
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@gem_ccs@suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@gem_ccs@suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@gem_ccs@suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#7697]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#6335])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#8562])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][24] ([i915#9561]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][25] ([i915#13356]) +1 other test incomplete
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk1/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#8555]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][27] ([i915#1099])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-snb1/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#280])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#280]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][32] ([i915#13390])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#8555]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#4525]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu-1:       NOTRUN -> [SKIP][35] ([i915#4525]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#4525])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][37] ([i915#11713])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#6344])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4812]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_reloc@basic-range:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#3281]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@gem_exec_reloc@basic-range.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3281]) +14 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3281]) +8 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3281]) +12 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4812]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@gem_exec_schedule@preempt-queue.html
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4537] / [i915#4812])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue.html
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4537] / [i915#4812])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][49] ([i915#13356]) +1 other test incomplete
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][50] -> [INCOMPLETE][51] ([i915#13356]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4860]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4860]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4860])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][55] ([i915#2190])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][56] ([i915#2190])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4613] / [i915#7582])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#4613]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4613]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#4613]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][61] ([i915#4613]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk5/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#4613]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#8289])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4083]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4077]) +7 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@gem_mmap_gtt@fault-concurrent-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4077]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4077]) +15 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4083]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@gem_mmap_wc@close.html
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4083])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@gem_mmap_wc@close.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3282]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3282]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3282]) +13 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][73] ([i915#2658])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk6/igt@gem_pread@exhaustion.html
    - shard-tglu-1:       NOTRUN -> [WARN][74] ([i915#2658])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][75] ([i915#2658])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-snb6/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][76] ([i915#2658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#3282])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#13398])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4270]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4270]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][81] +249 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#5190] / [i915#8428]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#8428])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4079]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4885])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4885])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4885])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@gem_softpin@evict-snoop.html

  * igt@gem_spin_batch@resubmit-new-all:
    - shard-dg1:          [PASS][88] -> [ABORT][89] ([i915#13562])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-14/igt@gem_spin_batch@resubmit-new-all.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@gem_spin_batch@resubmit-new-all.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4079]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3297]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#3297]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#3297]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#3297])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#3297] / [i915#3323])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][97] ([i915#3323])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk1/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#3297] / [i915#3323])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3297] / [i915#4880])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#3297] / [i915#4880]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@gen9_exec_parse@basic-rejected.html
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#2856])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#2527] / [i915#2856]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#2527]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#2856]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@gen9_exec_parse@valid-registers.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#2527]) +4 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#14123])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@vcs0:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#11527]) +7 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@i915_drm_fdinfo@busy-idle-check-all@vcs0.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#11527]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@i915_drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#14073]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@i915_drm_fdinfo@isolation@rcs0.html

  * igt@i915_drm_fdinfo@most-busy-check-all@vecs0:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#14073]) +15 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@i915_drm_fdinfo@most-busy-check-all@vecs0.html

  * igt@i915_module_load@fault-injection:
    - shard-dg2:          NOTRUN -> [ABORT][112] ([i915#15342] / [i915#15481])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_module_load@fault-injection.html
    - shard-rkl:          NOTRUN -> [ABORT][113] ([i915#15342] / [i915#15481])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-1/igt@i915_module_load@fault-injection.html
    - shard-dg1:          NOTRUN -> [ABORT][114] ([i915#11815]) +1 other test abort
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_module_load@fault-injection.html
    - shard-tglu:         NOTRUN -> [ABORT][115] ([i915#15342] / [i915#15481])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-dg2:          NOTRUN -> [ABORT][116] ([i915#15481])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_module_load@fault-injection@__uc_init.html
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#15479]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-1/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@i915_driver_hw_probe:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][118] ([i915#15481])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_module_load@fault-injection@i915_driver_hw_probe.html
    - shard-rkl:          NOTRUN -> [ABORT][119] ([i915#15481])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-1/igt@i915_module_load@fault-injection@i915_driver_hw_probe.html
    - shard-tglu:         NOTRUN -> [ABORT][120] ([i915#15481])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@fault-injection@i915_driver_hw_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][121] ([i915#15342])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-1/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][122] ([i915#15342])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-dg2:          NOTRUN -> [DMESG-WARN][123] ([i915#15342])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#15479]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          [PASS][125] -> [DMESG-WARN][126] ([i915#14545])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-11/igt@i915_module_load@resize-bar.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#6412])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#8399])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#8399])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#14498])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#11681] / [i915#6621]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#11681] / [i915#6621]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#11681])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#4387])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#4387])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#7984])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@i915_power@sanity.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          NOTRUN -> [DMESG-FAIL][137] ([i915#12061]) +1 other test dmesg-fail
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][138] ([i915#4817] / [i915#7443])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [PASS][139] -> [INCOMPLETE][140] ([i915#4817])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-3/igt@i915_suspend@debugfs-reader.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][141] ([i915#4817])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#7707])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@intel_hwmon@hwmon-read.html
    - shard-tglu-1:       NOTRUN -> [SKIP][143] ([i915#7707])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#4215] / [i915#5190])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#4215])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#4212]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#12454] / [i915#12712])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#12454] / [i915#12712])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#4212]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#3555])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#9531])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#9531])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#9531])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][154] ([i915#1769])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#1769] / [i915#3555])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#1769] / [i915#3555])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#5286]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#5286]) +10 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#5286]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [FAIL][160] ([i915#5138])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#4538] / [i915#5286]) +6 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#3828]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#3828])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#3828])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#3828]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][166] +23 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#3638]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3638]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#4538] / [i915#5190]) +12 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#5190]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][171] +8 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#4538]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][173] +123 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk10/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#12313]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#12313])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#12313])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#12313])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#6095]) +72 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#14544] / [i915#6095]) +3 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#6095]) +159 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][181] ([i915#4423])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#12313]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#6095]) +29 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#10307] / [i915#6095]) +155 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#6095]) +14 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#12805])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#12313]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#6095]) +237 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#14098] / [i915#14544] / [i915#6095]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#6095]) +73 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#14098] / [i915#6095]) +44 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#3742]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#13784])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#3742])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#13781]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#13783]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#11151] / [i915#7828]) +22 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#11151] / [i915#7828]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#11151] / [i915#7828]) +10 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#11151] / [i915#7828]) +11 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#11151] / [i915#7828]) +7 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#11151] / [i915#7828]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_color@deep-color:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#12655] / [i915#3555])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_color@deep-color.html
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#3555] / [i915#9979])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][206] ([i915#15522]) +4 other tests fail
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@kms_color_pipeline@plane-ctm3x4@pipe-c-edp-1.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#14544] / [i915#6944])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#15330] / [i915#3116] / [i915#3299]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#15330] / [i915#3116] / [i915#3299])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#15330] / [i915#3299])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#15330] / [i915#3116])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#15330] / [i915#3299])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#15330])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#15330])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#15330])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#15330])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@legacy@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][217] ([i915#7173]) +1 other test fail
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_content_protection@legacy@pipe-a-dp-3.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#6944] / [i915#9424]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#6944] / [i915#7116] / [i915#7118])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#6944]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#6944] / [i915#7118] / [i915#9424]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#6944] / [i915#7116] / [i915#9424])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#8814])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [PASS][224] -> [FAIL][225] ([i915#13566]) +1 other test fail
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#13049]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#13049]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#13049])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][229] ([i915#13566]) +4 other tests fail
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [FAIL][230] ([i915#13566]) +3 other tests fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#3555]) +4 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][232] +20 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#4103] / [i915#4213]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#4103]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#13046] / [i915#5354]) +5 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#9809])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#4103] / [i915#4213])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#4103])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#9723])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#13691])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#1257])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#13749])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#13749])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#13749])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@kms_dp_link_training@uhbr-mst.html
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#13748]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_dp_link_training@uhbr-mst.html
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#13748])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_dp_link_training@uhbr-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#13748])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_dp_link_training@uhbr-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#13748])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#13707])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#13707])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#8812])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#3555] / [i915#8812])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#8812])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#3840])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#3840]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#3840])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#3555] / [i915#3840])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#3555] / [i915#3840]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][259] ([i915#3555] / [i915#3840])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#3555] / [i915#3840])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#3840] / [i915#9053])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#3840] / [i915#9053])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#3840] / [i915#9053])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][264] ([i915#9878])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-rkl:          [PASS][265] -> [INCOMPLETE][266] ([i915#9878])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#1839]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#658])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#9934]) +8 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#9934])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#8381])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#8381]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][273] ([i915#12745] / [i915#4839])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk10/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][274] ([i915#12745] / [i915#4839])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][275] ([i915#4839])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][276] ([i915#4839])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk10/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#3637] / [i915#9934])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#9934]) +7 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#9934]) +8 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#3637] / [i915#9934]) +16 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][281] ([i915#3637] / [i915#9934]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][282] ([i915#12745] / [i915#4839] / [i915#6113])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][283] ([i915#12745] / [i915#6113])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#2672] / [i915#3555]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#2672] / [i915#3555])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#2672]) +4 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#2587] / [i915#2672])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#15573]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#15573]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#2672] / [i915#3555] / [i915#8813])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#2672] / [i915#8813])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#2672] / [i915#3555]) +9 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#2672] / [i915#3555]) +6 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#2672] / [i915#3555]) +5 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#2672]) +6 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#2587] / [i915#2672]) +7 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#2587] / [i915#2672]) +11 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          [PASS][301] -> [FAIL][302] ([i915#15389])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#15104]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#15104])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#1825]) +37 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#5354]) +37 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#15574]) +6 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#15574]) +15 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][309] ([i915#15574]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#8708]) +22 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-dg2:          [PASS][311] -> [FAIL][312] ([i915#15389] / [i915#6880]) +2 other tests fail
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#5439])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#5439]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#15102]) +4 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#15102] / [i915#3023]) +17 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#15102] / [i915#3458]) +19 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#15102]) +7 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#1825]) +7 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#14544] / [i915#1825])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] +23 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#15574]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][323] ([i915#15574]) +3 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#14544] / [i915#15102] / [i915#3023])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#5439])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#9766])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#15102]) +6 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#15102]) +6 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#15104]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#15102]) +46 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#15102] / [i915#3458]) +15 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][332] +80 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#14544] / [i915#15574])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#15574]) +5 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#8708]) +22 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#8708])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#3555] / [i915#8228]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#12713])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#12713])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#3555] / [i915#8228])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#3555] / [i915#8228]) +3 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#3555] / [i915#8228]) +2 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#3555] / [i915#8228]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#14544] / [i915#15459])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#15458])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#13688])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@kms_joiner@basic-max-non-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#13688])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#15460])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#15460])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][350] ([i915#15460])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#15460])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [PASS][352] -> [SKIP][353] ([i915#15459])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#15459])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#15458]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#6301])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.html
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#6301])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][358] ([i915#6301])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-dg1:          NOTRUN -> [SKIP][359] +61 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [PASS][360] -> [INCOMPLETE][361] ([i915#12756] / [i915#13476])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][362] -> [INCOMPLETE][363] ([i915#12756] / [i915#13409] / [i915#13476])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][364] -> [INCOMPLETE][365] ([i915#13476])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#14712]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][367] ([i915#13026]) +1 other test incomplete
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#3555] / [i915#8821])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#13958])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#13958]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#14259])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#14259]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#14259]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_plane_multiple@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][374] ([i915#14259])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#14259])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [PASS][376] -> [SKIP][377] ([i915#6953])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-tglu-1:       NOTRUN -> [SKIP][378] ([i915#6953])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][379] ([i915#15329]) +8 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][380] ([i915#15329] / [i915#3555])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#15329]) +3 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][382] ([i915#15329]) +9 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#5354]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][384] ([i915#9812])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#12343])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][386] ([i915#12343])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][387] ([i915#5354]) +2 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][388] ([i915#9812]) +2 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#4281])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu-1:       NOTRUN -> [SKIP][390] ([i915#8430])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][391] -> [SKIP][392] ([i915#15073])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          [PASS][393] -> [SKIP][394] ([i915#15073]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#15073])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#15073])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#15073]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][398] -> [SKIP][399] ([i915#15073]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][400] ([i915#15073]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-tglu:         NOTRUN -> [SKIP][401] ([i915#15403])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@kms_pm_rpm@package-g7.html
    - shard-dg1:          NOTRUN -> [SKIP][402] ([i915#15403])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][403] ([i915#11520]) +21 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][404] ([i915#11520]) +7 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - shard-dg2:          NOTRUN -> [SKIP][405] ([i915#11520]) +10 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][406] ([i915#11520]) +8 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-glk10:        NOTRUN -> [SKIP][407] ([i915#11520]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][408] ([i915#11520]) +3 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][409] ([i915#11520]) +12 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][410] ([i915#9808])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][411] ([i915#12316]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][412] ([i915#11520] / [i915#14544])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][413] ([i915#11520]) +3 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][414] ([i915#9683])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][415] ([i915#9683])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][416] ([i915#9683])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-rkl:          NOTRUN -> [SKIP][417] ([i915#1072] / [i915#14544] / [i915#9732])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][418] ([i915#9732]) +50 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][419] ([i915#9688]) +3 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][420] ([i915#1072] / [i915#9732]) +31 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][421] ([i915#1072] / [i915#9732]) +31 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#1072] / [i915#9732]) +26 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][423] ([i915#9732]) +10 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][424] ([i915#9685]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][425] ([i915#9685])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][426] ([i915#9685])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][427] ([i915#9685]) +2 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][428] ([i915#4235])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][429] ([i915#4884])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][430] ([i915#5289])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][431] ([i915#5289]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][432] ([i915#5289]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][433] ([i915#12755])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][434] ([i915#3555]) +4 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-rkl:          NOTRUN -> [SKIP][435] ([i915#3555]) +2 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][436] ([i915#3555]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][437] ([i915#8623]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][438] ([i915#8623]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][439] ([i915#12276]) +1 other test incomplete
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][440] ([i915#3555]) +7 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-tglu:         NOTRUN -> [SKIP][441] ([i915#11920])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          NOTRUN -> [SKIP][442] ([i915#9906]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@kms_vrr@max-min.html
    - shard-dg1:          NOTRUN -> [SKIP][443] ([i915#9906])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][444] ([i915#9906])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_vrr@max-min.html
    - shard-mtlp:         NOTRUN -> [SKIP][445] ([i915#8808] / [i915#9906])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][446] ([i915#3555] / [i915#9906])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@kms_vrr@negative-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][447] ([i915#3555] / [i915#9906])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][448] ([i915#9906])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][449] ([i915#7387])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@perf@global-sseu-config.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][450] ([i915#2433])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@perf@unprivileged-single-ctx-counters.html
    - shard-dg1:          NOTRUN -> [SKIP][451] ([i915#2433])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-rkl:          NOTRUN -> [SKIP][452] ([i915#14544]) +2 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][453] ([i915#13356] / [i915#14242])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-glk5/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][454] ([i915#8516])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-rkl:          NOTRUN -> [SKIP][455] ([i915#8516])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][456] ([i915#3708])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@prime_vgem@fence-read-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][457] ([i915#3708])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][458] +143 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][459] ([i915#9917])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][460] ([i915#4818])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][461] ([i915#4818])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][462] ([i915#4818])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          [SKIP][463] ([i915#4270]) -> [PASS][464]
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@i915_module_load@load:
    - shard-tglu-1:       ([PASS][465], [SKIP][466]) ([i915#14785]) -> ([PASS][467], [PASS][468], [PASS][469])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-1/igt@i915_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-1/igt@i915_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@i915_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@i915_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@i915_module_load@load.html
    - shard-dg1:          ([PASS][470], [PASS][471], [PASS][472], [PASS][473], [SKIP][474], [SKIP][475], [PASS][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480], [PASS][481], [PASS][482], [SKIP][483], [PASS][484]) ([i915#14785]) -> ([PASS][485], [PASS][486], [PASS][487], [PASS][488], [PASS][489], [PASS][490], [PASS][491], [PASS][492], [PASS][493], [PASS][494], [PASS][495], [PASS][496], [PASS][497], [PASS][498], [PASS][499], [PASS][500], [PASS][501], [PASS][502], [PASS][503], [PASS][504], [PASS][505], [PASS][506], [PASS][507], [PASS][508])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-13/igt@i915_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-18/igt@i915_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-13/igt@i915_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-16/igt@i915_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-18/igt@i915_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-19/igt@i915_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-14/igt@i915_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-16/igt@i915_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-13/igt@i915_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-16/igt@i915_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-12/igt@i915_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-19/igt@i915_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-17/igt@i915_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-14/igt@i915_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-17/igt@i915_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@i915_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@i915_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@i915_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@i915_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_module_load@load.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@i915_module_load@load.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@i915_module_load@load.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@i915_module_load@load.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_module_load@load.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@i915_module_load@load.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@i915_module_load@load.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@i915_module_load@load.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@i915_module_load@load.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@i915_module_load@load.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@i915_module_load@load.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_module_load@load.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@i915_module_load@load.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@i915_module_load@load.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_module_load@load.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@i915_module_load@load.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@i915_module_load@load.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@i915_module_load@load.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_module_load@load.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@i915_module_load@load.html
    - shard-tglu:         ([PASS][509], [SKIP][510], [PASS][511], [PASS][512], [PASS][513], [SKIP][514], [PASS][515], [PASS][516], [PASS][517], [SKIP][518], [SKIP][519], [PASS][520]) ([i915#14785]) -> ([PASS][521], [PASS][522], [PASS][523], [PASS][524], [PASS][525], [PASS][526], [PASS][527], [PASS][528], [PASS][529], [PASS][530], [PASS][531], [PASS][532], [PASS][533], [PASS][534], [PASS][535], [PASS][536], [PASS][537], [PASS][538], [PASS][539], [PASS][540], [PASS][541], [PASS][542])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-9/igt@i915_module_load@load.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-4/igt@i915_module_load@load.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-2/igt@i915_module_load@load.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-5/igt@i915_module_load@load.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-5/igt@i915_module_load@load.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-7/igt@i915_module_load@load.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-10/igt@i915_module_load@load.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-2/igt@i915_module_load@load.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-3/igt@i915_module_load@load.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-9/igt@i915_module_load@load.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-6/igt@i915_module_load@load.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-4/igt@i915_module_load@load.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@i915_module_load@load.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@load.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@load.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@i915_module_load@load.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@i915_module_load@load.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@i915_module_load@load.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@i915_module_load@load.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@i915_module_load@load.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@i915_module_load@load.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@load.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@i915_module_load@load.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@i915_module_load@load.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@i915_module_load@load.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@i915_module_load@load.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@i915_module_load@load.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@i915_module_load@load.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@i915_module_load@load.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@i915_module_load@load.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@i915_module_load@load.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@i915_module_load@load.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@i915_module_load@load.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@i915_module_load@load.html
    - shard-mtlp:         ([PASS][543], [SKIP][544], [PASS][545], [PASS][546], [SKIP][547], [SKIP][548], [PASS][549], [SKIP][550], [PASS][551], [PASS][552], [SKIP][553], [SKIP][554], [PASS][555], [PASS][556], [PASS][557], [PASS][558], [SKIP][559], [PASS][560]) ([i915#14785]) -> ([PASS][561], [PASS][562], [PASS][563], [PASS][564], [PASS][565], [PASS][566], [PASS][567], [PASS][568], [PASS][569], [PASS][570], [PASS][571], [PASS][572], [PASS][573], [PASS][574], [PASS][575], [PASS][576], [PASS][577], [PASS][578], [PASS][579], [PASS][580], [PASS][581], [PASS][582], [PASS][583], [PASS][584], [PASS][585])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-8/igt@i915_module_load@load.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-5/igt@i915_module_load@load.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-2/igt@i915_module_load@load.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-6/igt@i915_module_load@load.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-4/igt@i915_module_load@load.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-3/igt@i915_module_load@load.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-4/igt@i915_module_load@load.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-6/igt@i915_module_load@load.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-7/igt@i915_module_load@load.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-4/igt@i915_module_load@load.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-8/igt@i915_module_load@load.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-2/igt@i915_module_load@load.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-7/igt@i915_module_load@load.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-5/igt@i915_module_load@load.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-3/igt@i915_module_load@load.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-5/igt@i915_module_load@load.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-7/igt@i915_module_load@load.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-6/igt@i915_module_load@load.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@i915_module_load@load.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@i915_module_load@load.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@i915_module_load@load.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@i915_module_load@load.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@i915_module_load@load.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@i915_module_load@load.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@i915_module_load@load.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@i915_module_load@load.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@i915_module_load@load.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@i915_module_load@load.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@i915_module_load@load.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@i915_module_load@load.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@i915_module_load@load.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@i915_module_load@load.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@i915_module_load@load.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@i915_module_load@load.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@i915_module_load@load.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@i915_module_load@load.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@i915_module_load@load.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@i915_module_load@load.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@i915_module_load@load.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@i915_module_load@load.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@i915_module_load@load.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@i915_module_load@load.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@i915_module_load@load.html
    - shard-dg2:          ([PASS][586], [PASS][587], [PASS][588], [PASS][589], [PASS][590], [PASS][591], [PASS][592], [SKIP][593], [PASS][594], [PASS][595], [SKIP][596], [PASS][597], [SKIP][598], [PASS][599], [SKIP][600]) ([i915#14785]) -> ([PASS][601], [PASS][602], [PASS][603], [PASS][604], [PASS][605], [PASS][606], [PASS][607], [PASS][608], [PASS][609], [PASS][610], [PASS][611], [PASS][612], [PASS][613], [PASS][614], [PASS][615], [PASS][616], [PASS][617], [PASS][618], [PASS][619], [PASS][620], [PASS][621], [PASS][622], [PASS][623], [PASS][624], [PASS][625])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-7/igt@i915_module_load@load.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-6/igt@i915_module_load@load.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-5/igt@i915_module_load@load.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-5/igt@i915_module_load@load.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-5/igt@i915_module_load@load.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-1/igt@i915_module_load@load.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-11/igt@i915_module_load@load.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-7/igt@i915_module_load@load.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-8/igt@i915_module_load@load.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-3/igt@i915_module_load@load.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-3/igt@i915_module_load@load.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-6/igt@i915_module_load@load.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-4/igt@i915_module_load@load.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-4/igt@i915_module_load@load.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-11/igt@i915_module_load@load.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@i915_module_load@load.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@i915_module_load@load.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_module_load@load.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@i915_module_load@load.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@i915_module_load@load.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@i915_module_load@load.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_module_load@load.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@i915_module_load@load.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_module_load@load.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@i915_module_load@load.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@i915_module_load@load.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@i915_module_load@load.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@i915_module_load@load.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@i915_module_load@load.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@i915_module_load@load.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@i915_module_load@load.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@i915_module_load@load.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@i915_module_load@load.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@i915_module_load@load.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@i915_module_load@load.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@i915_module_load@load.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@i915_module_load@load.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@i915_module_load@load.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@i915_module_load@load.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@i915_module_load@load.html
    - shard-rkl:          ([PASS][626], [PASS][627], [PASS][628], [SKIP][629], [PASS][630], [SKIP][631], [PASS][632], [SKIP][633], [PASS][634], [PASS][635], [PASS][636], [PASS][637], [PASS][638], [PASS][639], [PASS][640], [PASS][641], [SKIP][642], [SKIP][643]) ([i915#14544] / [i915#14785]) -> ([PASS][644], [PASS][645], [PASS][646], [PASS][647], [PASS][648], [PASS][649], [PASS][650], [PASS][651], [PASS][652], [PASS][653], [PASS][654], [PASS][655], [PASS][656], [PASS][657], [PASS][658], [PASS][659], [PASS][660], [PASS][661], [PASS][662], [PASS][663], [PASS][664], [PASS][665], [PASS][666])
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@i915_module_load@load.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-8/igt@i915_module_load@load.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-2/igt@i915_module_load@load.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-1/igt@i915_module_load@load.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-2/igt@i915_module_load@load.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@i915_module_load@load.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-8/igt@i915_module_load@load.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-7/igt@i915_module_load@load.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-3/igt@i915_module_load@load.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-8/igt@i915_module_load@load.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-2/igt@i915_module_load@load.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@i915_module_load@load.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-7/igt@i915_module_load@load.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-5/igt@i915_module_load@load.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-4/igt@i915_module_load@load.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-4/igt@i915_module_load@load.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-3/igt@i915_module_load@load.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-5/igt@i915_module_load@load.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@i915_module_load@load.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@i915_module_load@load.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@i915_module_load@load.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@i915_module_load@load.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@i915_module_load@load.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@i915_module_load@load.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@i915_module_load@load.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-1/igt@i915_module_load@load.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@i915_module_load@load.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@i915_module_load@load.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@i915_module_load@load.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@i915_module_load@load.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@i915_module_load@load.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@i915_module_load@load.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@i915_module_load@load.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@i915_module_load@load.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@i915_module_load@load.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@i915_module_load@load.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@i915_module_load@load.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@i915_module_load@load.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@i915_module_load@load.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@i915_module_load@load.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [DMESG-WARN][667] ([i915#13029] / [i915#14545]) -> [PASS][668]
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-5/igt@i915_module_load@reload-no-display.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          [DMESG-WARN][669] ([i915#13029] / [i915#14545]) -> [PASS][670]
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-17/igt@i915_module_load@reload-no-display.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@i915_module_load@reload-no-display.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [DMESG-FAIL][671] ([i915#12061]) -> [PASS][672] +1 other test pass
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-6/igt@i915_selftest@live@workarounds.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@i915_selftest@live@workarounds.html

  * igt@kms_async_flips@async-flip-hang@pipe-a-edp-1:
    - shard-mtlp:         [DMESG-WARN][673] ([i915#12935]) -> [PASS][674] +1 other test pass
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-8/igt@kms_async_flips@async-flip-hang@pipe-a-edp-1.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@kms_async_flips@async-flip-hang@pipe-a-edp-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][675] ([i915#12761]) -> [PASS][676]
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][677] ([i915#5138]) -> [PASS][678]
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg1:          [DMESG-WARN][679] ([i915#4423]) -> [PASS][680]
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-16/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [FAIL][681] ([i915#13566]) -> [PASS][682] +3 other tests pass
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          [FAIL][683] ([i915#13566]) -> [PASS][684] +3 other tests pass
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          [TIMEOUT][685] ([i915#14033]) -> [PASS][686] +1 other test pass
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-snb1/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [FAIL][687] ([i915#15389] / [i915#6880]) -> [PASS][688]
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          [SKIP][689] ([i915#3555] / [i915#8228]) -> [PASS][690]
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-1/igt@kms_hdr@static-toggle-dpms.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [INCOMPLETE][691] ([i915#14412]) -> [PASS][692] +1 other test pass
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [SKIP][693] ([i915#6953] / [i915#9423]) -> [PASS][694]
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][695] ([i915#15073]) -> [PASS][696]
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_prime@basic-crc-vgem@second-to-first:
    - shard-mtlp:         [DMESG-WARN][697] -> [PASS][698] +1 other test pass
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-8/igt@kms_prime@basic-crc-vgem@second-to-first.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_prime@basic-crc-vgem@second-to-first.html

  * igt@perf_pmu@render-node-busy-idle:
    - shard-mtlp:         [FAIL][699] ([i915#4349]) -> [PASS][700] +3 other tests pass
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-8/igt@perf_pmu@render-node-busy-idle.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [SKIP][701] ([i915#14544] / [i915#3281]) -> [SKIP][702] ([i915#3281]) +3 other tests skip
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-rkl:          [SKIP][703] ([i915#3281]) -> [SKIP][704] ([i915#14544] / [i915#3281])
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-noreloc.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          [SKIP][705] ([i915#14544] / [i915#4613]) -> [SKIP][706] ([i915#4613]) +1 other test skip
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-rkl:          [SKIP][707] ([i915#14544] / [i915#284]) -> [SKIP][708] ([i915#284])
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@gem_media_vme.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@gem_media_vme.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-rkl:          [SKIP][709] ([i915#14544] / [i915#3282]) -> [SKIP][710] ([i915#3282]) +1 other test skip
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          [SKIP][711] ([i915#14544] / [i915#3297]) -> [SKIP][712] ([i915#3297])
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-rkl:          [SKIP][713] ([i915#3297]) -> [SKIP][714] ([i915#14544] / [i915#3297])
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          [SKIP][715] ([i915#14544] / [i915#2527]) -> [SKIP][716] ([i915#2527])
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][717] ([i915#8399]) -> [SKIP][718] ([i915#14544] / [i915#8399])
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-3/igt@i915_pm_freq_api@freq-suspend.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][719] ([i915#14544] / [i915#5286]) -> [SKIP][720] ([i915#5286])
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          [SKIP][721] ([i915#14544] / [i915#3638]) -> [SKIP][722] ([i915#3638]) +1 other test skip
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][723] ([i915#14544]) -> [SKIP][724] +4 other tests skip
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][725] ([i915#14098] / [i915#6095]) -> [SKIP][726] ([i915#14098] / [i915#14544] / [i915#6095])
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-rkl:          [SKIP][727] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][728] ([i915#14098] / [i915#6095]) +7 other tests skip
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][729] ([i915#14544] / [i915#6095]) -> [SKIP][730] ([i915#6095]) +3 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][731] ([i915#12313] / [i915#14544]) -> [SKIP][732] ([i915#12313]) +1 other test skip
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-rkl:          [SKIP][733] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][734] ([i915#11151] / [i915#7828]) +2 other tests skip
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_chamelium_edid@dp-mode-timings.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-edp-1:
    - shard-mtlp:         [DMESG-FAIL][735] ([i915#12935]) -> [FAIL][736] ([i915#15522]) +1 other test fail
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-7/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-edp-1.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-edp-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          [SKIP][737] ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][738] ([i915#15330] / [i915#3116])
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-rkl:          [SKIP][739] ([i915#14544] / [i915#15330]) -> [SKIP][740] ([i915#15330])
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [SKIP][741] ([i915#6944] / [i915#7118] / [i915#9424]) -> [FAIL][742] ([i915#7173])
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-6/igt@kms_content_protection@legacy.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@suspend-resume:
    - shard-dg2:          [SKIP][743] ([i915#6944]) -> [FAIL][744] ([i915#7173])
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-1/igt@kms_content_protection@suspend-resume.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          [FAIL][745] ([i915#1339] / [i915#7173]) -> [SKIP][746] ([i915#6944] / [i915#7118] / [i915#9424])
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-11/igt@kms_content_protection@uevent.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][747] ([i915#14544] / [i915#3555]) -> [SKIP][748] ([i915#3555]) +1 other test skip
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][749] -> [SKIP][750] ([i915#14544]) +3 other tests skip
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          [SKIP][751] ([i915#13707] / [i915#14544]) -> [SKIP][752] ([i915#13707])
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          [SKIP][753] ([i915#14544] / [i915#3555] / [i915#3840]) -> [SKIP][754] ([i915#3555] / [i915#3840])
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          [SKIP][755] ([i915#658]) -> [SKIP][756] ([i915#14544] / [i915#658])
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-7/igt@kms_feature_discovery@psr2.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-rkl:          [SKIP][757] ([i915#9934]) -> [SKIP][758] ([i915#14544] / [i915#9934])
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-4/igt@kms_flip@2x-flip-vs-fences-interruptible.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-rkl:          [SKIP][759] ([i915#14544] / [i915#9934]) -> [SKIP][760] ([i915#9934]) +3 other tests skip
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          [SKIP][761] ([i915#14544] / [i915#2672] / [i915#3555]) -> [SKIP][762] ([i915#2672] / [i915#3555])
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][763] ([i915#14544] / [i915#2672]) -> [SKIP][764] ([i915#2672])
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-rkl:          [SKIP][765] ([i915#14544] / [i915#1825]) -> [SKIP][766] ([i915#1825]) +8 other tests skip
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt:
    - shard-rkl:          [SKIP][767] ([i915#15574]) -> [SKIP][768] ([i915#14544] / [i915#15574])
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-rkl:          [SKIP][769] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][770] ([i915#15102] / [i915#3023]) +1 other test skip
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          [SKIP][771] ([i915#9766]) -> [SKIP][772] ([i915#14544] / [i915#9766])
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][773] ([i915#15102] / [i915#3458]) -> [SKIP][774] ([i915#10433] / [i915#15102] / [i915#3458]) +3 other tests skip
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][775] ([i915#15102] / [i915#3023]) -> [SKIP][776] ([i915#14544] / [i915#15102] / [i915#3023]) +2 other tests skip
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][777] ([i915#1825]) -> [SKIP][778] ([i915#14544] / [i915#1825]) +3 other tests skip
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-rkl:          [SKIP][779] ([i915#14544] / [i915#15574]) -> [SKIP][780] ([i915#15574]) +1 other test skip
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][781] ([i915#13331]) -> [SKIP][782] ([i915#12713])
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          [SKIP][783] ([i915#14544] / [i915#15458]) -> [SKIP][784] ([i915#15458])
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          [SKIP][785] ([i915#14544] / [i915#5354]) -> [SKIP][786] ([i915#5354])
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][787] ([i915#11520] / [i915#14544]) -> [SKIP][788] ([i915#11520]) +2 other tests skip
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][789] ([i915#11520]) -> [SKIP][790] ([i915#11520] / [i915#14544]) +1 other test skip
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          [SKIP][791] ([i915#1072] / [i915#9732]) -> [SKIP][792] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-8/igt@kms_psr@pr-cursor-plane-onoff.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          [SKIP][793] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][794] ([i915#1072] / [i915#9732]) +5 other tests skip
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          [SKIP][795] ([i915#14544] / [i915#5289]) -> [SKIP][796] ([i915#5289])
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          [SKIP][797] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][798] ([i915#15243] / [i915#3555])
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/igt@kms_vrr@flip-basic.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_vrr@flip-basic.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11815
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12935]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12935
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#1339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15389]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15522
  [i915#15573]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573
  [i915#15574]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
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
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8712 -> IGTPW_14395

  CI-20190529: 20190529
  CI_DRM_17868: 40800011414446888105f6beae6dd3fac56516aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14395: 14395
  IGT_8712: 8712

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/index.html

--===============1845622334328536617==
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
<tr><td><b>Series:</b></td><td>Close any open drm device after engine initi=
alization in GPUTOP (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/158161/">https://patchwork.freedesktop.org/series/158161/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14395/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14395/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8712_full -&gt; IGTPW_14395_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14395_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_14395_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/index=
.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1439=
5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_spin_batch@resubmit-new-all@vecs0:<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg1-14/igt@gem_spin_batch@resubmit-new-all@vecs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/=
shard-dg1-14/igt@gem_spin_batch@resubmit-new-all@vecs0.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8712_full and IGTPW_14395_ful=
l:</p>
<h3>New IGT tests (51)</h3>
<ul>
<li>
<p>igt@gem_spin_batch@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@bad-pitch-128:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@basic-auth:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@blob-multiple:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@blocking:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@cursor-onscreen-128x42:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@cursor-rapid-movement-64x21:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@cursora-vs-flipb-varying-size:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@dsc-with-formats:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@etime-multi-wait-all-for-submit-unsubmitted-submitted=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@export-wait-after-attach:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@fbc-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@invalid-pad:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@invalid-param-get:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@invalid-single-wait-all-unsubmitted:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@linear-16bpp-rotate-270:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@media-freq:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@memory-info-resident:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@multi-wait-all-for-submit-signaled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@pixel-format-source-clamping:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@plane-immutable-zpos:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@preempt-other:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@psr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@psr-abgr161616f-draw-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@reject-modify-context-protection-off-3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@reset-stress:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@shrink:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@single-wait-all-for-submit-signaled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@standalone:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@sync_merge:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@system-suspend-idle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@test_userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@waits:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14395_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@api_intel_bb@blit-reloc-keep-cach=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8411">i915#8411</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cach=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8411">i915#8411</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@api_intel_bb@blit-reloc-keep-cac=
he.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@api_intel_bb@blit-reloc-purge-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@drm_buddy@drm_buddy@drm_test_budd=
y_fragmentation_performance.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15095">i915#15095</a>) +1 other t=
est dmesg-warn</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@drm_buddy@drm_buddy@drm_test_bud=
dy_fragmentation_performance.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15095">i915#15095</a>) +1 other =
test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@gem_busy@semaphore.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936"=
>i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@gem_ccs@block-copy-compressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@gem_ccs@suspend-resume.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13356">i915#13356</a>) +1 other test incomplete</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@gem_ccs@suspend-resume.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/93=
23">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@gem_ccs@suspend-resume.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@gem_ccs@suspend-resume.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@gem_ccs@suspend-resume.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@gem_close_race@multigpu-basic-p=
rocess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/95=
61">i915#9561</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk1/igt@gem_ctx_isolation@preservation-s3@=
bcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-ma=
ny.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-snb1/igt@gem_ctx_persistence@legacy-engines=
-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280=
">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280=
">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk6/igt@gem_eio@in-flight-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@gem_exec_balancer@noheartbeat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@gem_exec_balancer@parallel.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4525">i915#4525</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gem_exec_balancer@parallel-conte=
xts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@gem_exec_balancer@parallel-keep=
-in-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gem_exec_big@single.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/117=
13">i915#11713</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@gem_exec_capture@capture-recover=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@gem_exec_fence@submit3.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/48=
12">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@gem_exec_flush@basic-batch-kernel=
-default-cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@gem_exec_flush@basic-batch-kerne=
l-default-wb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@gem_exec_reloc@basic-range.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read-act=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-a=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@gem_exec_reloc@basic-write-wc-act=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@gem_exec_schedule@preempt-queue.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4812">i915#4812</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@gem_exec_suspend@basic-s0.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/i=
gt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify=
-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fe=
nces.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@gem_fenced_exec_thrash@no-spare-=
fences-busy-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gem_huc_copy@huc-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/21=
90">i915#2190</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk6/igt@gem_huc_copy@huc-copy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190=
">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@gem_lmem_swapping@parallel-random=
-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@gem_lmem_swapping@parallel-rando=
m-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4613">i915#4613</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk5/igt@gem_lmem_swapping@random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gem_lmem_swapping@verify.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@gem_media_fill@media-fill.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@gem_mmap@bad-object.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083=
">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@gem_mmap_gtt@fault-concurrent-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@gem_mmap_gtt@fault-concurrent-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@gem_mmap_gtt@flink-race.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4077">i915#4077</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@gem_mmap_wc@close.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@gem_mmap_wc@close.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">=
i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-display.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-=
after-reads-display.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3282">i915#3282</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk6/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gem_pread@exhaustion.html">WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/265=
8">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-snb6/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2658">i915#2658</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.htm=
l">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2658">i915#2658</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@gem_pwrite@basic-exhaustion.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@gem_pxp@verify-pxp-execution-afte=
r-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4270">i915#4270</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@gem_pxp@verify-pxp-execution-aft=
er-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk5/igt@gem_render_copy@y-tiled-ccs-to-y-t=
iled-mc-ccs.html">SKIP</a> +249 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-y-=
tiled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-y=
f-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
79">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@gem_softpin@evict-snoop.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new-all:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg1-14/igt@gem_spin_batch@resubmit-new-all.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-=
dg1-14/igt@gem_spin_batch@resubmit-new-all.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@gem_tiled_pread_pwrite.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
79">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk1/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3323">i915#3323</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@gem_userptr_blits@map-fixed-inval=
idate-overlap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@gem_userptr_blits@map-fixed-inva=
lidate-overlap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@gen9_exec_parse@basic-rejected.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@gen9_exec_parse@basic-rejected.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@gen9_exec_parse@valid-registers.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2856">i915#2856</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@gen9_exec_parse@valid-registers.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2527">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@i915_drm_fdinfo@all-busy-check-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@i915_drm_fdinfo@busy-idle-check-=
all@vcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@i915_drm_fdinfo@busy-idle-check-=
all@vcs1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@i915_drm_fdinfo@isolation@rcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vecs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@i915_drm_fdinfo@most-busy-check-a=
ll@vecs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14073">i915#14073</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_module_load@fault-injection.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15342">i915#15342</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-1/igt@i915_module_load@fault-injection.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15342">i915#15342</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_module_load@fault-injection=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11815">i915#11815</a>) +1 other test abort</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@fault-injection=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15342">i915#15342</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_module_load@fault-injection@=
__uc_init.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15481">i915#15481</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-1/igt@i915_module_load@fault-injection@=
__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_hw_probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_module_load@fault-injection@=
i915_driver_hw_probe.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-1/igt@i915_module_load@fault-injection@=
i915_driver_hw_probe.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@fault-injection=
@i915_driver_hw_probe.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-1/igt@i915_module_load@fault-injection@=
intel_connector_register.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@fault-injection=
@intel_connector_register.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_module_load@fault-injection@=
intel_connector_register.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@fault-injection=
@uc_fw_rsa_data_create.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-11/igt@i915_module_load@resize-bar.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-=
3/igt@i915_module_load@resize-bar.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@i915_pm_freq_api@freq-basic-api.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multi=
ple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-idle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@i915_pm_rps@min-max-config-loade=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@i915_pm_rps@thresholds-park.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@i915_pm_sseu@full-enable.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4387">i915#4387</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@i915_pm_sseu@full-enable.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@i915_power@sanity.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i=
915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_selftest@live@workarounds.ht=
ml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@i915_suspend@basic-s3-without-i9=
15.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-3/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6=
/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@i915_suspend@forcewake.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@intel_hwmon@hwmon-read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/77=
07">i915#7707</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_addfb_basic@basic-y-tiled-leg=
acy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4215">i915#4215</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@kms_addfb_basic@framebuffer-vs-se=
t-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4212">i915#4212</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-misma=
tch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk6/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_atomic_transition@plane-all-=
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
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_atomic_transition@plane-all=
-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +10 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_big_fb@linear-max-hw-stride-3=
2bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_big_fb@linear-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_big_fb@x-tiled-32bpp-rotate-2=
70.html">SKIP</a> +23 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_big_fb@x-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5190">i915#5190</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-ove=
rflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-0-async-flip.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4538">i915#4538</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk10/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> +123 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@kms_ccs@bad-rotation-90-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-d=
g2-mc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +72 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +159 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-rc-ccs-cc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled=
-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_ccs@crc-primary-basic-y-tile=
d-gen12-rc-ccs@pipe-a-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +15=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_ccs@crc-primary-basic-y-tile=
d-gen12-rc-ccs@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-y=
-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#104=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) +237 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +73 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_ccs@random-ccs-data-y-tiled-g=
en12-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@kms_cdclk@mode-transition-all-out=
puts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13784">i915#13784</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-=
hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-c-hd=
mi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13783">i915#13783</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_chamelium_audio@dp-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7828">i915#7828</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-fast=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-fast=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-mul=
tiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +11 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-mul=
tiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm=
-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_color@deep-color.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1265=
5">i915#12655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@kms_color_pipeline@plane-ctm3x4@=
pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15522">i915#15522</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_content_protection@atomic-dpm=
s-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@kms_content_protection@dp-mst-typ=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_content_protection@dp-mst-typ=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@kms_content_protection@dp-mst-ty=
pe-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_content_protection@dp-mst-typ=
e-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_content_protection@dp-mst-typ=
e-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_content_protection@legacy@pi=
pe-a-dp-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7173">i915#7173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@kms_content_protection@suspend-r=
esume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6944">i915#6944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_content_protection@type1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/s=
hard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13=
566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128=
x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>) +4 other tests fail</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-12=
8x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-curs=
or-legacy.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 =
other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flip=
b-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>=
)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_dp_aux_dev.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i91=
5#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-s=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13749">i915#13749</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_dp_link_training@uhbr-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_dp_link_training@uhbr-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8812">i915#8812</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_draw_crc@draw-method-mmap-gtt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3840">i915#3840</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp-with-b=
pc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9878">i915#9878</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/i=
gt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@kms_flip@2x-blocking-wf_vblank.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@kms_flip@2x-flip-vs-fences.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8381">i915#8381</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@kms_flip@2x-flip-vs-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk10/igt@kms_flip@2x-flip-vs-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk10/igt@kms_flip@2x-flip-vs-suspend@ab-hd=
mi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@kms_flip@2x-flip-vs-wf_vblank.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk1/igt@kms_flip@flip-vs-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4839">i915#4839</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-4t=
ile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-4t=
ile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2=
672</a>) +4 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#=
2587</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-=
linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15573">i915#15573</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-32bpp-linear-reflect-x@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573">i915#155=
73</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">=
i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#267=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190"=
>i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +=
6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>) +7 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-ind=
fb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-of=
fscreen-pri-indfb-draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15389">i915#15389</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +2 other t=
ests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +37 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +37 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-abg=
r161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15574">i915#15574</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-ab=
gr161616f-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15574">i915#15574</a>) +15 other tests skip=
</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-abg=
r161616f-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15574">i915#15574</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-rgb=
565-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8708">i915#8708</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-stridechange.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_143=
95/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-stridechange.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389=
">i915#15389</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6880">i915#6880</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5439">i915#5439</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +17 =
other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +19=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15102">i915#15102</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-a=
bgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15574">i915#15574</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
argb161616f-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15574">i915#15574</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#30=
23</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +46 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-r=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3458">i915#3458</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +80 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-abgr=
161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15574">i915#15574</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-argb=
161616f-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15574">i915#15574</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb1=
01010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8708">i915#8708</a>) +22 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-rgb=
101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_hdr@bpc-switch.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12713">i915#12713</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13688">i915#13688</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_joiner@basic-max-non-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15460">i915#15460</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_joiner@invalid-modeset-big-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15460">i915#15460</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15460">i915#15460</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14395/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5459">i915#15459</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_pipe_b_c_ivb@enable-pipe-c-w=
hile-b-has-3-lanes.html">SKIP</a> +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/sha=
rd-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#=
12756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14395/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-=
a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a=
-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14395/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdm=
i-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14712">i915#14712</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk5/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_plane_multiple@tiling-4.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/sh=
ard-rkl-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-f=
actor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_pm_backlight@basic-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12343">i915#12343</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5354">i915#5354</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9812">i915#9812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">=
i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@km=
s_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@=
kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/=
shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#=
15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@kms_pm_rpm@package-g7.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
403">i915#15403</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_pm_rpm@package-g7.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk1/igt@kms_psr2_sf@fbc-pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane=
-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</l=
i>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move=
-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_psr2_su@page_flip-nv12.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_psr@fbc-psr-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9732">i915#9732</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@kms_psr@fbc-psr2-primary-mmap-cp=
u.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9688">i915#9688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_psr@psr-cursor-render.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_psr@psr-sprite-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_psr@psr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_psr@psr2-cursor-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4235">i915#4235</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-10/igt@kms_rotation_crc@primary-yf-til=
ed-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-=
90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@kms_setmode@basic-clone-single-cr=
tc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_setmode@basic-clone-single-cr=
tc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8623">i915#8623</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk6/igt@kms_vblank@ts-continuation-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@kms_vrr@max-min.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i91=
5#9906</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i9=
15#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i9=
15#9906</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i9=
15#8808</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@kms_vrr@negative-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-drrs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@perf@global-sseu-config.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@perf@unprivileged-single-ctx-coun=
ters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2433">i915#2433</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@perf@unprivileged-single-ctx-cou=
nters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@perf_pmu@event-wait@rcs0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-glk5/igt@perf_pmu@rc6-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14242">i915#14242</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@prime_vgem@fence-read-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@prime_vgem@fence-read-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@prime_vgem@fence-write-hang.html=
">SKIP</a> +143 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4818">i915#4818</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@tools_test@sysfs_l3_parity.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4818">i915#4818</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@tools_test@sysfs_l3_parity.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/42=
70">i915#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14395/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-tglu-1:       (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8712/shard-tglu-1/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-1/igt@i915=
_module_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14785">i915#14785</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14395/shard-tglu-1/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-1/igt=
@i915_module_load@load.html">PASS</a>)</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8712/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-18/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8712/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-16/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8712/shard-dg1-18/igt@i915_module_load@load.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-d=
g1-19/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-14/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/=
shard-dg1-16/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-13/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_8712/shard-dg1-16/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-12/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8712/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-17/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8712/shard-dg1-14/igt@i915_module_load@load.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg1-17/=
igt@i915_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14785">i915#14785</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14395/shard-dg1-18/igt@i915_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg=
1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-18/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4395/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14395/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-19/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/=
shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-17/igt@i915_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14395/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-12/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg1-19/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard=
-dg1-16/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14395/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-14/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-=
12/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_143=
95/shard-dg1-16/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-13/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14395/shard-dg1-16/igt@i915_module_load@load.html">PASS</a>)</li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8712/shard-tglu-9/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-4/igt@i915=
_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8712/shard-tglu-2/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-5/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8712/shard-tglu-5/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-t=
glu-7/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-10/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712=
/shard-tglu-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-3/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_8712/shard-tglu-9/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-tglu-6/igt@i915_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_8712/shard-tglu-4/igt@i915_module_load@load.html">PASS</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785">i915#=
14785</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14395/shard-tglu-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-=
5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@i915_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1439=
5/shard-tglu-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-8/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14395/shard-tglu-10/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-10/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14395/shard-tglu-2/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/s=
hard-tglu-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@i915_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14395/shard-tglu-3/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-7/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-tglu-9/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard=
-tglu-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-5/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14395/shard-tglu-9/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-4/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14395/shard-tglu-3/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-tglu=
-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14395/shard-tglu-3/igt@i915_module_load@load.ht=
ml">PASS</a>)</li>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8712/shard-mtlp-8/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-5/igt@i915=
_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8712/shard-mtlp-2/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-6/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8712/shard-mtlp-4/igt@i915_module_load@load.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-m=
tlp-3/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-4/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/=
shard-mtlp-6/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-7/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_8712/shard-mtlp-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-8/igt@i915_modul=
e_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8712/shard-mtlp-2/igt@i915_module_load@load.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-7/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8712/shard-mtlp-5/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-3/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGT_8712/shard-mtlp-5/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-=
mtlp-7/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGT_8712/shard-mtlp-6/igt@i915_module_load@load.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14785">i915#14785</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shar=
d-mtlp-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-7/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14395/shard-mtlp-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14395/shard-mtlp-7/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtl=
p-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
395/shard-mtlp-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-5/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14395/shard-mtlp-3/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-7/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/s=
hard-mtlp-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14395/shard-mtlp-2/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-6/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-mtlp-8/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard=
-mtlp-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14395/shard-mtlp-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14395/shard-mtlp-8/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp=
-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@i915_module_load@load.ht=
ml">PASS</a>)</li>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8712/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-6/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8712/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-5/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8712/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-1/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8712/shard-dg2-11/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg=
2-7/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-8/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/sha=
rd-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-3/igt@i915_module_load@load.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_871=
2/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-4/igt@i915_module_load@=
load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_8712/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-dg2-11/igt@i915_module=
_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14785">i915#14785</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-6/igt@i915_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14395/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-7/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14395/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/sha=
rd-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-5/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14395/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14395/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/s=
hard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14395/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-8/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-d=
g2-11/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4395/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-3/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14395/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14395/shard-dg2-1/igt@i915_module_load@load.html">PASS=
</a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8712/shard-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-8/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8712/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-1/igt@i91=
5_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8712/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-6/ig=
t@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8712/shard-rkl-8/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl=
-7/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_8712/shard-rkl-3/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shar=
d-rkl-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-2/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712=
/shard-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-7/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_8712/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-4/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8712/shard-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8712/shard-rkl-3/igt@i915_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8712/shard-rkl-5/igt@i915_module_load@load.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14785">i915#14785</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14395/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl=
-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@i915_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1439=
5/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@i915_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14395/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14395/shard-rkl-1/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-r=
kl-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
395/shard-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14395/shard-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-=
rkl-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4395/shard-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14395/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard=
-rkl-5/igt@i915_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-5/igt@i915_module_load@reload-no-display.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13029">i915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14545">i915#14545</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@i915_module_load@reload-n=
o-display.html">PASS</a></li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg1-17/igt@i915_module_load@reload-no-display.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg1-16/igt@i915_module_load@reload=
-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/120=
61">i915#12061</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14395/shard-mtlp-8/igt@i915_selftest@live@workarounds.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-mtlp-8/igt@kms_async_flips@async-flip-hang@pipe-a-edp-1.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12935">i915#12935</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14395/shard-mtlp-3/igt@kms_async_flips@async-flip-ha=
ng@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12761">i915#12761</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_async_flips@async-flip-suspend=
-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-=
stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg1-16/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14395/shard-dg1-19/igt@kms_big_fb@linear-64bpp-rotate-180.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14395/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html=
">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1356=
6">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14395/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14033">i915#14033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14395/shard-snb1/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-h=
dmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-ind=
fb-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15389">i915#15389</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@k=
ms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-1/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14395/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe=
-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14412">i915#14412</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_plane@plane-panning-=
bottom-right-suspend@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953=
">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-=
size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14395/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem@second-to-first:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-mtlp-8/igt@kms_prime@basic-crc-vgem@second-to-first.html">D=
MESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14395/shard-mtlp-4/igt@kms_prime@basic-crc-vgem@second-to-first.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-mtlp-8/igt@perf_pmu@render-node-busy-idle.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i91=
5#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14395/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle.html">PASS</a> +3 ot=
her tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14395/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
81">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-noreloc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i9=
15#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14395/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-noreloc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14395/shard-rkl-5/igt@gem_lmem_swapping@verify-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/46=
13">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@gem_media_vme.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#2=
84</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_143=
95/shard-rkl-2/igt@gem_media_vme.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@gem_partial_pwrite_pread@write-=
snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@gem_userptr_blits@coherency-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14395/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-u=
nsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14395/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">=
i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-3/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#=
8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4395/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14395/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SK=
IP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@=
kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#140=
98</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-c=
cs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@=
kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_ccs@crc-sprite=
-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"=
>i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_chamelium_edi=
d@dp-mode-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-mtlp-7/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-=
a-edp-1.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12935">i915#12935</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-mtlp-2/igt@kms_color_pipeline=
@plane-lut1d-post-ctm3x4@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15522">i915#15522</a>) +1 oth=
er test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_content_pro=
tection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-resu=
me.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_content_pr=
otection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#=
6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-11/igt@kms_content_protection@le=
gacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-1/igt@kms_content_protection@suspend-resume.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/694=
4">i915#6944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14395/shard-dg2-11/igt@kms_content_protection@suspend-resume.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-11/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339">i915=
#1339</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7173">i915#7173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14395/shard-dg2-3/igt@kms_content_protection@uevent.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-3/igt@kms_cursor_crc@cursor-rap=
id-movement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">S=
KIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_143=
95/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/137=
07">i915#13707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_dp_linktrain_fallback@dp=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3840">i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_dsc@dsc-with-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-7/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/=
shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i91=
5#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-4/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14395/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_flip@2x-modeset=
-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4ti=
ledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1439=
5/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcc=
cs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4ti=
ledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915=
#2672</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14395/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg=
2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indf=
b-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-=
mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15574">i915#15574</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking=
@fbcpsr-abgr161616f-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574">i915#155=
74</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_frontbuf=
fer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/976=
6">i915#9766</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrf=
b-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-dg2-4/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#104=
33</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3458">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indf=
b-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3023">i915#3023</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15574">i915#15574</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_frontbuffer_=
tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15574">i915#15574</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331">i915#=
13331</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14395/shard-dg2-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#127=
13</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14395/shard-rkl-8/igt@kms_joiner@basic-ultra-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-ar=
ea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-5/igt@kms_psr2_sf@fb=
c-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-6/igt@kms_psr2_sf@pr-overla=
y-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-8/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#=
1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14395/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
72">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-2/igt@kms_psr@psr2-cursor-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14395/shard-rkl-4/igt@kms_rotation_crc@prim=
ary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8712/shard-rkl-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14395/shard-rkl-7/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8712 -&gt; IGTPW_14395</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17868: 40800011414446888105f6beae6dd3fac56516aa @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_14395: 14395<br />
  IGT_8712: 8712</p>

</body>
</html>

--===============1845622334328536617==--
