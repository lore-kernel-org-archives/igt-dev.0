Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8518D0E6D8
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 13:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BF810E080;
	Tue, 25 Nov 2025 13:03:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F0710E080;
 Tue, 25 Nov 2025 13:03:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5891037901997215664=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_fix_pipe-crtc_conflict_i?=
 =?utf-8?q?n_crc_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 25 Nov 2025 13:03:43 -0000
Message-ID: <176407582331.25428.16680654712835693459@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251123152412.599801-1-kunal1.joshi@intel.com>
In-Reply-To: <20251123152412.599801-1-kunal1.joshi@intel.com>
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

--===============5891037901997215664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fix pipe-crtc conflict in crc helpers
URL   : https://patchwork.freedesktop.org/series/157943/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8637_full -> IGTPW_14102_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14102_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14102_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14102_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-5/igt@gem_exec_big@single.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_content_protection@dp-mst-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_content_protection@dp-mst-suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_content_protection@dp-mst-suspend-resume.html
    - shard-dg2:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-rkl:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_fbcon_fbt@fbc.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_fbcon_fbt@fbc.html
    - shard-glk:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-glk9/igt@kms_fbcon_fbt@fbc.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk2/igt@kms_fbcon_fbt@fbc.html

  
Known issues
------------

  Here are the changes found in IGTPW_14102_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8411]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8411]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8411]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#14544] / [i915#8411])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#8411])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#11078])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@device_reset@cold-reset-bound.html
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@device_reset@cold-reset-bound.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#3936])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#3936])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_busy@semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#3936])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@gem_busy@semaphore.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#4873]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@gem_caching@writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3555] / [i915#9323]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_ccs@block-copy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#3555] / [i915#9323]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_ccs@block-copy-compressed.html
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#14544] / [i915#3555] / [i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#7697])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#14544] / [i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#7697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@gem_close_race@multigpu-basic-threads.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#7697])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#6335])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@gem_create@create-ext-cpu-access-big.html
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#6335])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-big.html
    - shard-dg2:          NOTRUN -> [ABORT][32] ([i915#13427])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][33] ([i915#1099]) +8 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#8555])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#8555]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#8555]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#280])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#280])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#280])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-mtlp:         NOTRUN -> [ABORT][40] ([i915#15317] / [i915#7975])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][41] ([i915#13390])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk9/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          NOTRUN -> [FAIL][42] ([i915#8898])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4771])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@gem_exec_balancer@bonded-pair.html
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4771])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#4525]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#14544] / [i915#4525])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#4525])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][48] ([i915#11965]) +4 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3711])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3539] / [i915#4852]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3539])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3539])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3539] / [i915#4852]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#3281]) +13 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#3281]) +16 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3281]) +16 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3281]) +17 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@gem_exec_reloc@basic-write-read-active.html
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#14544] / [i915#3281]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4812])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_exec_schedule@preempt-queue.html
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4537] / [i915#4812])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4537] / [i915#4812]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][62] -> [ABORT][63] ([i915#15317]) +1 other test abort
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-7/igt@gem_exec_suspend@basic-s3.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-glk10:        NOTRUN -> [ABORT][64] ([i915#15317]) +3 other tests abort
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk10/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          NOTRUN -> [INCOMPLETE][65] ([i915#13196] / [i915#13356]) +1 other test incomplete
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk6/igt@gem_exec_suspend@basic-s3@smem.html
    - shard-mtlp:         [PASS][66] -> [ABORT][67] ([i915#15317]) +2 other tests abort
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-mtlp-6/igt@gem_exec_suspend@basic-s3@smem.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-dg1:          [PASS][68] -> [ABORT][69] ([i915#15317] / [i915#7975])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg1-15/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4860]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4860]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4860]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#14544] / [i915#2190])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_huc_copy@huc-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#2190])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#4613] / [i915#7582])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4613]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#4613]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#12193])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4565])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-glk:          NOTRUN -> [SKIP][80] ([i915#4613]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk3/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#4613]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#284])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4077]) +15 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4077]) +14 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4083]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4083]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4083]) +7 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#3282]) +8 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#3282]) +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][90] ([i915#2658])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][91] ([i915#2658])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk2/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3282]) +11 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@gem_pread@snoop.html
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#3282]) +6 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][94] ([i915#14702] / [i915#2658])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#13717])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#13398])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#13398])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4270]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4270]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#5190] / [i915#8428]) +9 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#8428]) +9 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4079]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglu-1:       NOTRUN -> [ABORT][103] ([i915#15317]) +2 other tests abort
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4077]) +17 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#4079]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#4079]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#3297])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@gem_userptr_blits@coherency-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3297]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#3297] / [i915#3323])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#3297]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3297] / [i915#3323])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#3282] / [i915#3297])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#3282] / [i915#3297])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@gem_userptr_blits@forbidden-operations.html
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#3282] / [i915#3297])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#3282] / [i915#3297])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#3297] / [i915#4880])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#3297] / [i915#4880])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#3297])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#3297]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#3281] / [i915#3297])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#3281] / [i915#3297])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#3297] / [i915#4958])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@gem_userptr_blits@sd-probe.html
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#3297] / [i915#4958])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#3297]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][125] +16 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#2527] / [i915#2856]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#2856]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@gen9_exec_parse@batch-without-end.html
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#2527])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@gen9_exec_parse@batch-without-end.html
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#2527] / [i915#2856])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#2527]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#2856]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#14123])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#14123]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@i915_drm_fdinfo@all-busy-idle-check-all.html
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#14123]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#11527]) +7 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@i915_drm_fdinfo@busy-idle-check-all@ccs0.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#11527]) +6 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@i915_drm_fdinfo@busy-idle-check-all@rcs0.html

  * igt@i915_drm_fdinfo@busy-idle@vcs0:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#14073]) +23 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@i915_drm_fdinfo@busy-idle@vcs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#14073]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@i915_drm_fdinfo@most-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#14073]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#13786])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][141] ([i915#13029] / [i915#14545])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][142] ([i915#13029] / [i915#14545])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@i915_module_load@reload-no-display.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][143] ([i915#14545])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb7/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          [PASS][144] -> [DMESG-WARN][145] ([i915#14545])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-8/igt@i915_module_load@resize-bar.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@i915_module_load@resize-bar.html
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#14544] / [i915#6412])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#8399]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@i915_pm_freq_api@freq-basic-api.html
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#8399])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#8399])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][150] ([i915#13790] / [i915#2681]) +1 other test warn
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#14498])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#11681] / [i915#6621]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#11681] / [i915#6621]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#11681]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#11681]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@i915_pm_rps@thresholds-park.html
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#11681]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#4387])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@i915_pm_sseu@full-enable.html
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#4387])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#4387])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#4387])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#8437])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#7984])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@i915_power@sanity.html
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#7984])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-7/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#6245])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@i915_query@hwconfig_table.html
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#6245])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-10/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#6245])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@i915_query@hwconfig_table.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          NOTRUN -> [ABORT][167] ([i915#15317]) +12 other tests abort
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@sysfs-reader:
    - shard-dg1:          NOTRUN -> [ABORT][168] ([i915#15317]) +13 other tests abort
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-12/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#12454] / [i915#12712])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#4212])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#4212])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#4212])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1:
    - shard-tglu:         [PASS][173] -> [ABORT][174] ([i915#15317]) +1 other test abort
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-tglu-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-10/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-4-yuyv:
    - shard-mtlp:         NOTRUN -> [FAIL][175] ([i915#15313]) +39 other tests fail
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-4-yuyv.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#10333])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [PASS][177] -> [FAIL][178] ([i915#5956]) +1 other test fail
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-tglu:         [PASS][179] -> [FAIL][180] ([i915#14857]) +1 other test fail
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#1769] / [i915#3555])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#1769] / [i915#3555])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][183] ([i915#1769])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#1769] / [i915#3555])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][185] ([i915#1769])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#5286]) +9 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-9/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#14544] / [i915#5286]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#5286])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#5286])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#5286]) +8 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#4538] / [i915#5286]) +7 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#3638]) +5 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#3638]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#5190]) +4 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][195] +31 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#4538] / [i915#5190]) +18 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#4538]) +6 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#6187]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#6095]) +103 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#12313]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#12313])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#12313]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#12313] / [i915#14544])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#12313]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#14098] / [i915#14544] / [i915#6095]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][207] +254 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [ABORT][208] ([i915#15317]) +11 other tests abort
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#12805])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#12805])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#12805])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#12805])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [ABORT][213] ([i915#15317]) +12 other tests abort
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#6095]) +35 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][215] ([i915#12796] / [i915#14694]) +1 other test incomplete
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#6095]) +27 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#14098] / [i915#6095]) +28 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#6095]) +19 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#10307] / [i915#6095]) +120 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#6095]) +89 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#14544] / [i915#6095]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#6095]) +54 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#12313]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#13781]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#3742]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#3742]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#3742]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#13784])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#13784])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#13781]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#13783]) +4 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#13783]) +4 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#11151] / [i915#7828]) +9 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_chamelium_audio@dp-audio.html
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#11151] / [i915#7828]) +10 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#11151] / [i915#7828]) +12 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#11151] / [i915#7828]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#11151] / [i915#7828]) +8 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#11151] / [i915#7828]) +8 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#15238])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#3299]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#14544]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#3116])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0.html
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#3116] / [i915#3299])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#3299])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_content_protection@dp-mst-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#3299])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#6944] / [i915#9424])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_content_protection@lic-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#9424])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_content_protection@lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#6944] / [i915#9424])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#13049])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][251] ([i915#13566]) +3 other tests fail
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-tglu:         NOTRUN -> [FAIL][252] ([i915#13566]) +1 other test fail
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#3555]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-6/igt@kms_cursor_crc@cursor-random-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8814]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#13049]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#13049]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#13049]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#13049]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#13049] / [i915#14544])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#8814]) +5 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#3555]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_edge_walk@64x64-right-edge:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][262] ([i915#4423])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@kms_cursor_edge_walk@64x64-right-edge.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#9809]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#13046] / [i915#5354]) +6 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#14544] / [i915#9067])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#9067])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#9067])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#4213])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#4103] / [i915#4213])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#4103])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#9833])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#9723])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#9723])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9723])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#9833])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#13749])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#8812])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#3555] / [i915#8812])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#3840] / [i915#9688])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#3840])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#3840])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#3840])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#3555] / [i915#3840])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#3555] / [i915#3840])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#3555] / [i915#3840] / [i915#9053])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#3840] / [i915#9053])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#3840] / [i915#9053])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#3840] / [i915#9053])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#3840] / [i915#9053])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#4881])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_fence_pin_leak.html
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#4881])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_fence_pin_leak.html
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#4881])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#3637] / [i915#9934]) +12 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#3637] / [i915#9934]) +13 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_flip@2x-dpms-vs-vblank-race.html
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#14544] / [i915#9934])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#9934]) +11 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#9934]) +12 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#3637] / [i915#9934]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#9934]) +14 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#3555] / [i915#8810] / [i915#8813]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#8810] / [i915#8813]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#14544] / [i915#2672] / [i915#3555])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][303] ([i915#2672] / [i915#8813]) +4 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#2587] / [i915#2672]) +7 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#14544] / [i915#2672])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#2672] / [i915#3555]) +7 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#2672]) +7 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#2587] / [i915#2672] / [i915#3555])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#2587] / [i915#2672] / [i915#3555])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#2672] / [i915#3555]) +6 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#2672] / [i915#3555])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#2587] / [i915#2672])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#2672] / [i915#3555]) +4 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#2672] / [i915#3555]) +4 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#2672]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#2587] / [i915#2672]) +5 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-glk10:        NOTRUN -> [SKIP][318] +170 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#2672] / [i915#3555] / [i915#8813]) +10 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#8708]) +27 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#5354]) +42 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#14544] / [i915#1825]) +4 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#15102]) +2 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#15102]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#8708]) +21 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#15102] / [i915#3023]) +19 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][327] +45 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#1825]) +34 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][329] +76 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][330] +21 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#14544] / [i915#15102] / [i915#3023]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#5439])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#5439])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#5439])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#15102]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#15104]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#15104]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#15102] / [i915#3458]) +25 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#1825]) +43 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#15102]) +4 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#15102] / [i915#3458]) +16 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#8708]) +8 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#15102]) +32 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         NOTRUN -> [SKIP][344] ([i915#12713])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#12713])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#12713])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#12713])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#1187] / [i915#12713])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#3555] / [i915#8228]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_hdr@static-swap.html
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#3555] / [i915#8228])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_hdr@static-swap.html
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#12713] / [i915#3555] / [i915#8228]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#3555] / [i915#8228]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_hdr@static-toggle-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#3555] / [i915#8228]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][354] ([i915#3555] / [i915#8228]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#12339])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@kms_joiner@basic-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#12339])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-9/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#12339])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#10656])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#10656])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#10656])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#10656])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#14712])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#14712])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-mtlp:         NOTRUN -> [SKIP][364] ([i915#11614] / [i915#3582]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][365] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][366] ([i915#3555] / [i915#8821])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@kms_plane_lowres@tiling-y.html
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#8821])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#3555] / [i915#8821])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_plane_lowres@tiling-yf.html
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#3555]) +3 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#13958]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-tglu-1:       NOTRUN -> [SKIP][371] ([i915#13958])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          NOTRUN -> [SKIP][372] ([i915#13958]) +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#13958]) +2 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-tglu:         NOTRUN -> [SKIP][374] ([i915#13958]) +2 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][375] ([i915#13958]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#14259])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [PASS][377] -> [SKIP][378] ([i915#6953] / [i915#9423])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-tglu-1:       NOTRUN -> [SKIP][379] ([i915#3555]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-tglu-1:       NOTRUN -> [SKIP][380] ([i915#12247]) +3 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#12247]) +3 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][382] ([i915#12247]) +8 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html
    - shard-tglu:         NOTRUN -> [SKIP][383] ([i915#12247]) +4 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#12247] / [i915#6953])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][385] ([i915#12247] / [i915#3555] / [i915#6953]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][386] ([i915#12247]) +11 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][387] ([i915#5354])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#5354])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][389] ([i915#9812])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-mtlp:         NOTRUN -> [SKIP][390] ([i915#9292])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-mtlp:         NOTRUN -> [SKIP][391] ([i915#13441])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu:         NOTRUN -> [SKIP][392] ([i915#9685])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-mtlp:         NOTRUN -> [SKIP][393] ([i915#3828])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#3828])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg1:          NOTRUN -> [SKIP][395] ([i915#3828])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-tglu:         NOTRUN -> [SKIP][396] ([i915#3828])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu-1:       NOTRUN -> [SKIP][397] ([i915#8430])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][398] ([i915#14544] / [i915#15073])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][399] ([i915#15073]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-6/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][400] ([i915#15073]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][401] ([i915#15073]) +2 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][402] ([i915#15073]) +2 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][403] ([i915#15073]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][404] -> [SKIP][405] ([i915#15073])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg2:          [PASS][406] -> [SKIP][407] ([i915#15073])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-tglu:         NOTRUN -> [ABORT][408] ([i915#15317]) +13 other tests abort
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-9/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2:          NOTRUN -> [ABORT][409] ([i915#10553] / [i915#15317])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][410] ([i915#6524] / [i915#6805])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_prime@basic-crc-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][411] ([i915#6524])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu-1:       NOTRUN -> [SKIP][412] ([i915#6524])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][413] ([i915#6524])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][414] ([i915#6524])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][415] ([i915#11520]) +12 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][416] ([i915#11520]) +4 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk5/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][417] ([i915#11520]) +12 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][418] ([i915#11520]) +5 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][419] ([i915#9808]) +2 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][420] ([i915#12316]) +10 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][421] ([i915#11520]) +10 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#11520]) +7 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-rkl:          NOTRUN -> [SKIP][423] ([i915#11520] / [i915#14544]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][424] ([i915#11520]) +3 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][425] ([i915#11520]) +9 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-1:       NOTRUN -> [SKIP][426] ([i915#9683])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][427] ([i915#9732]) +30 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][428] ([i915#9732]) +4 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html

  * igt@kms_psr@pr-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][429] ([i915#9688]) +36 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_psr@pr-primary-mmap-cpu.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][430] ([i915#1072] / [i915#9732]) +25 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][431] ([i915#1072] / [i915#9732]) +41 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-primary-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][432] ([i915#1072] / [i915#9732]) +29 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_psr@psr2-primary-mmap-cpu.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][433] ([i915#4077] / [i915#9688]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][434] ([i915#1072] / [i915#14544] / [i915#9732]) +5 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][435] ([i915#9685])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][436] ([i915#4884])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@kms_rotation_crc@exhaust-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][437] ([i915#4235])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][438] ([i915#4235])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-mtlp:         NOTRUN -> [SKIP][439] ([i915#12755]) +5 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-mtlp:         NOTRUN -> [SKIP][440] ([i915#5289])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][441] ([i915#5289]) +2 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][442] ([i915#5289]) +4 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][443] ([i915#5289]) +4 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][444] ([i915#12755] / [i915#5190]) +2 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][445] ([i915#14544] / [i915#5289])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][446] ([i915#12755]) +2 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][447] ([i915#3555]) +4 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-mtlp:         NOTRUN -> [SKIP][448] ([i915#3555] / [i915#8809])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-dg2:          NOTRUN -> [SKIP][449] ([i915#15232]) +2 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-rkl:          NOTRUN -> [SKIP][450] ([i915#15232])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-dg1:          NOTRUN -> [SKIP][451] ([i915#15232])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_sharpness_filter@invalid-plane-with-filter.html
    - shard-tglu:         NOTRUN -> [SKIP][452] ([i915#15232])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_sharpness_filter@invalid-plane-with-filter.html
    - shard-mtlp:         NOTRUN -> [SKIP][453] ([i915#15232]) +1 other test skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][454] ([i915#8623])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg1:          NOTRUN -> [SKIP][455] ([i915#8623])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@kms_tiled_display@basic-test-pattern.html
    - shard-mtlp:         NOTRUN -> [SKIP][456] ([i915#8623])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][457] ([i915#8623])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][458] ([i915#8623])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-snb:          NOTRUN -> [ABORT][459] ([i915#15317]) +8 other tests abort
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@kms_vblank@ts-continuation-suspend.html
    - shard-glk:          NOTRUN -> [ABORT][460] ([i915#15317]) +2 other tests abort
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][461] ([i915#12276])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2:          NOTRUN -> [SKIP][462] ([i915#15243] / [i915#3555])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_vrr@flip-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][463] ([i915#15243] / [i915#3555])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_vrr@flip-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][464] ([i915#3555] / [i915#8808])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][465] ([i915#11920])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][466] ([i915#11920])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][467] ([i915#11920])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][468] ([i915#11920])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-10/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][469] ([i915#11920])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][470] ([i915#9906]) +1 other test skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-rkl:          NOTRUN -> [SKIP][471] ([i915#9906]) +1 other test skip
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-dg1:          NOTRUN -> [SKIP][472] ([i915#9906]) +1 other test skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu:         NOTRUN -> [SKIP][473] ([i915#9906]) +1 other test skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-mtlp:         NOTRUN -> [SKIP][474] ([i915#8808] / [i915#9906]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][475] ([i915#2437])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_writeback@writeback-check-output.html
    - shard-mtlp:         NOTRUN -> [SKIP][476] ([i915#2437])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][477] ([i915#2437] / [i915#9412])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][478] ([i915#2437] / [i915#9412])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][479] ([i915#2437] / [i915#9412])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][480] ([i915#2437] / [i915#9412])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][481] ([i915#2437] / [i915#9412])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][482] ([i915#7387])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@perf@global-sseu-config-invalid.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][483] ([i915#2434])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@perf@mi-rpc.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][484] ([i915#9100]) +1 other test fail
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@perf@non-zero-reason.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][485] ([i915#2435])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][486] ([i915#2433])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][487] +521 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb5/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][488] ([i915#4349]) +2 other tests fail
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][489] -> [FAIL][490] ([i915#4349]) +2 other tests fail
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu-1:       NOTRUN -> [SKIP][491] ([i915#8516])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html
    - shard-dg1:          NOTRUN -> [SKIP][492] ([i915#8516])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          NOTRUN -> [SKIP][493] ([i915#8516])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][494] ([i915#8516])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][495] ([i915#3291] / [i915#3708]) +1 other test skip
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - shard-mtlp:         NOTRUN -> [SKIP][496] ([i915#3708]) +2 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@prime_vgem@basic-read.html
    - shard-rkl:          NOTRUN -> [SKIP][497] ([i915#3291] / [i915#3708])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@prime_vgem@basic-read.html
    - shard-dg1:          NOTRUN -> [SKIP][498] ([i915#3708])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][499] ([i915#9917]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][500] ([i915#9917]) +1 other test skip
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][501] ([i915#12910]) +9 other tests fail
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html
    - shard-mtlp:         NOTRUN -> [FAIL][502] ([i915#12910]) +9 other tests fail
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          NOTRUN -> [SKIP][503] ([i915#9917])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5:
    - shard-tglu-1:       NOTRUN -> [FAIL][504] ([i915#12910]) +9 other tests fail
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][505] +21 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][506] ([i915#4818])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][507] ([i915#4818])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [ABORT][508] ([i915#15317] / [i915#7975]) -> [PASS][509]
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg1-15/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][510] ([i915#5138]) -> [PASS][511] +1 other test pass
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         [ABORT][512] ([i915#15317]) -> [PASS][513] +2 other tests pass
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [FAIL][514] ([i915#13566]) -> [PASS][515] +1 other test pass
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-snb:          [SKIP][516] -> [PASS][517]
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-snb6/igt@kms_hdmi_inject@inject-audio.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-mtlp:         [ABORT][518] ([i915#15317]) -> [PASS][519]
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-mtlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1:
    - shard-mtlp:         [INCOMPLETE][520] ([i915#12756]) -> [PASS][521]
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-mtlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1.html

  * igt@perf@blocking@0-rcs0:
    - shard-rkl:          [FAIL][522] ([i915#10538]) -> [PASS][523] +1 other test pass
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-7/igt@perf@blocking@0-rcs0.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@perf@blocking@0-rcs0.html

  
#### Warnings ####

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          [SKIP][524] ([i915#14544] / [i915#9323]) -> [SKIP][525] ([i915#9323])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_exec_reloc@basic-cpu-read-active:
    - shard-rkl:          [SKIP][526] ([i915#14544] / [i915#3281]) -> [SKIP][527] ([i915#3281])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-read-active.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-read-active.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][528] ([i915#8411]) -> [SKIP][529] ([i915#14544] / [i915#8411])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-rkl:          [SKIP][530] -> [SKIP][531] ([i915#14544]) +3 other tests skip
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-3/igt@gem_softpin@evict-snoop-interruptible.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          [SKIP][532] ([i915#3281] / [i915#3297]) -> [SKIP][533] ([i915#14544] / [i915#3281] / [i915#3297])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-8/igt@gem_userptr_blits@relocations.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          [SKIP][534] ([i915#14544] / [i915#3297]) -> [SKIP][535] ([i915#3297])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          [SKIP][536] ([i915#3297]) -> [SKIP][537] ([i915#14544] / [i915#3297])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [ABORT][538] ([i915#15317]) -> [INCOMPLETE][539] ([i915#13356] / [i915#14586])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-glk1/igt@gem_workarounds@suspend-resume.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk1/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [ABORT][540] ([i915#15317]) -> [INCOMPLETE][541] ([i915#13356])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-rkl:          [SKIP][542] ([i915#2527]) -> [SKIP][543] ([i915#14544] / [i915#2527])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-3/igt@gen9_exec_parse@allowed-all.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          [SKIP][544] ([i915#14544] / [i915#2527]) -> [SKIP][545] ([i915#2527])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          [SKIP][546] ([i915#14544] / [i915#8399]) -> [SKIP][547] ([i915#8399])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@i915_pm_freq_api@freq-reset.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          [SKIP][548] ([i915#12454] / [i915#12712]) -> [SKIP][549] ([i915#12454] / [i915#12712] / [i915#14544])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][550] ([i915#14544] / [i915#5286]) -> [SKIP][551] ([i915#5286])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][552] ([i915#14544] / [i915#3638]) -> [SKIP][553] ([i915#3638])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
    - shard-rkl:          [SKIP][554] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][555] ([i915#14098] / [i915#6095]) +5 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][556] ([i915#12313] / [i915#14544]) -> [SKIP][557] ([i915#12313])
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][558] ([i915#6095]) -> [SKIP][559] ([i915#14544] / [i915#6095]) +4 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-rkl:          [SKIP][560] ([i915#14098] / [i915#6095]) -> [SKIP][561] ([i915#14098] / [i915#14544] / [i915#6095]) +6 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][562] ([i915#14544] / [i915#6095]) -> [SKIP][563] ([i915#6095]) +3 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-rkl:          [SKIP][564] ([i915#14544]) -> [SKIP][565] +3 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_chamelium_color@ctm-0-25.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          [SKIP][566] ([i915#11151] / [i915#7828]) -> [SKIP][567] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][568] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][569] ([i915#11151] / [i915#7828])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [FAIL][570] ([i915#7173]) -> [SKIP][571] ([i915#7118] / [i915#9424])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-11/igt@kms_content_protection@legacy.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_content_protection@legacy.html
    - shard-rkl:          [SKIP][572] ([i915#14544] / [i915#7118] / [i915#9424]) -> [SKIP][573] ([i915#7118] / [i915#9424])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_content_protection@legacy.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-rkl:          [SKIP][574] ([i915#14544] / [i915#3555]) -> [SKIP][575] ([i915#3555])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-rkl:          [SKIP][576] ([i915#3555]) -> [SKIP][577] ([i915#14544] / [i915#3555])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][578] ([i915#12358] / [i915#14152]) -> [ABORT][579] ([i915#15317]) +1 other test abort
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][580] ([i915#13748] / [i915#14544]) -> [SKIP][581] ([i915#13748])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          [SKIP][582] ([i915#14544] / [i915#1839]) -> [SKIP][583] ([i915#1839])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_feature_discovery@display-4x.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-rkl:          [SKIP][584] ([i915#9934]) -> [SKIP][585] ([i915#14544] / [i915#9934])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-5/igt@kms_flip@2x-flip-vs-suspend.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          [SKIP][586] ([i915#14544] / [i915#2672] / [i915#3555]) -> [SKIP][587] ([i915#2672] / [i915#3555])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][588] ([i915#14544] / [i915#2672]) -> [SKIP][589] ([i915#2672])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-rkl:          [SKIP][590] ([i915#2672] / [i915#3555]) -> [SKIP][591] ([i915#14544] / [i915#2672] / [i915#3555])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][592] ([i915#2672]) -> [SKIP][593] ([i915#14544] / [i915#2672])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][594] ([i915#15102]) -> [SKIP][595] ([i915#14544] / [i915#15102])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          [SKIP][596] ([i915#15102] / [i915#3023]) -> [SKIP][597] ([i915#14544] / [i915#15102] / [i915#3023]) +4 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][598] ([i915#14544] / [i915#1825]) -> [SKIP][599] ([i915#1825]) +7 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][600] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][601] ([i915#15102] / [i915#3023]) +3 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][602] ([i915#1825]) -> [SKIP][603] ([i915#14544] / [i915#1825]) +4 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          [SKIP][604] ([i915#14259] / [i915#14544]) -> [SKIP][605] ([i915#14259])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          [SKIP][606] ([i915#14544] / [i915#5354]) -> [SKIP][607] ([i915#5354])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_pm_backlight@fade.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          [SKIP][608] ([i915#14544] / [i915#9685]) -> [SKIP][609] ([i915#9685])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][610] ([i915#11520]) -> [SKIP][611] ([i915#11520] / [i915#14544])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][612] ([i915#11520] / [i915#14544]) -> [SKIP][613] ([i915#11520])
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-rkl:          [SKIP][614] ([i915#1072] / [i915#9732]) -> [SKIP][615] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_psr@fbc-pr-basic.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-rkl:          [SKIP][616] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][617] ([i915#1072] / [i915#9732]) +3 other tests skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_psr@fbc-psr-basic.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-7/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          [SKIP][618] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][619] ([i915#15243] / [i915#3555])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_vrr@flip-suspend.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_vrr@flip-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10333]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14857]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14857
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15232]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232
  [i915#15238]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15238
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15313
  [i915#15314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15314
  [i915#15317]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
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
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711
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
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
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
  * IGT: IGT_8637 -> IGTPW_14102

  CI-20190529: 20190529
  CI_DRM_17580: c701e79730169fab373fba7e759497d755fac592 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14102: 14102
  IGT_8637: 730ee3dfb26f8d7891fc240b0132a08c5bc7b949 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/index.html

--===============5891037901997215664==
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
<tr><td><b>Series:</b></td><td>fix pipe-crtc conflict in crc helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157943/">https://patchwork.freedesktop.org/series/157943/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8637_full -&gt; IGTPW_14102_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14102_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14102_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14102_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-5/igt@gem_exec_big@single.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a></li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a></li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a></li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_fbcon_fbt@fbc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_fbcon_fbt@fbc.html">FAIL</a></li>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-glk9/igt@kms_fbcon_fbt@fbc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk2/igt@kms_fbcon_fbt@fbc.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14102_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@gem_caching@writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873">i915#4873</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427">i915#13427</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@gem_ctx_persistence@engines-queued.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk9/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898">i915#8898</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711">i915#3711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@gem_exec_reloc@basic-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@gem_exec_reloc@basic-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +17 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-7/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@gem_exec_suspend@basic-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk10/igt@gem_exec_suspend@basic-s3-devices.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk6/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-mtlp-6/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg1-15/igt@gem_exec_suspend@basic-s4-devices@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk3/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@gem_mmap_gtt@cpuset-medium-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-odd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@gem_mmap_gtt@medium-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc-unflushed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@gem_mmap_wc@write-gtt-read-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk2/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +11 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702">i915#14702</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@gem_softpin@noreloc-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958">i915#4958</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@gen7_exec_parse@bitmasks.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@gen9_exec_parse@bb-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@i915_drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@i915_drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@i915_drm_fdinfo@busy-idle-check-all@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@i915_drm_fdinfo@busy-idle-check-all@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@vcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@i915_drm_fdinfo@busy-idle@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@i915_drm_fdinfo@most-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@i915_fb_tiling@basic-x-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb7/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-8/igt@i915_module_load@resize-bar.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@i915_module_load@resize-bar.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@i915_pm_rps@thresholds-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@i915_pm_rps@thresholds-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437">i915#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-7/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-10/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@i915_suspend@debugfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +12 other tests abort</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-12/igt@i915_suspend@sysfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +13 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-tglu-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-10/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-4-yuyv:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-4-yuyv.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15313">i915#15313</a>) +39 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333">i915#10333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14857">i915#14857</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-9/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> +254 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +11 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +12 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +120 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784">i915#13784</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784">i915#13784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15238">i915#15238</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_cursor_crc@cursor-random-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-6/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-right-edge:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@kms_cursor_edge_walk@64x64-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-11/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +13 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-7/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +7 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> +170 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +42 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-9/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_plane_lowres@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226">i915#10226</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +8 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292">i915#9292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441">i915#13441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-6/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-9/igt@kms_pm_rpm@system-suspend-idle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +13 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_pm_rpm@system-suspend-modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10553</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk5/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_psr@pr-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_psr@psr2-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884">i915#4884</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232">i915#15232</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232">i915#15232</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232">i915#15232</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232">i915#15232</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-4/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232">i915#15232</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-15/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +8 other tests abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk3/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-10/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-6/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@perf@non-zero-reason.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100">i915#9100</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-18/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb5/igt@perf_pmu@busy-accuracy-98.html">SKIP</a> +521 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-7/igt@perf_pmu@busy-double-start.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-8/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-19/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-14/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-3/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html">SKIP</a> +21 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-13/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-4/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg1-15/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg1-16/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-snb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-snb1/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-mtlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-mtlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@blocking@0-rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-7/igt@perf@blocking@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@perf@blocking@0-rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-3/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-8/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-glk1/igt@gem_workarounds@suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-glk1/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-3/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-dg2-11/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-dg2-3/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-5/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-8/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-4/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-6/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-7/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8637/shard-rkl-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14102/shard-rkl-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8637 -&gt; IGTPW_14102</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17580: c701e79730169fab373fba7e759497d755fac592 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14102: 14102<br />
  IGT_8637: 730ee3dfb26f8d7891fc240b0132a08c5bc7b949 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5891037901997215664==--
