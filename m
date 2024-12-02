Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A7BD78321
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 14:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3CE10E27E;
	Mon,  2 Dec 2024 14:29:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E50B10E27E;
 Mon,  2 Dec 2024 14:29:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_igt-runner_fact_checking?=
 =?utf-8?q?_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Dec 2024 14:29:03 -0000
Message-ID: <173314974343.1657840.13313179832855258865@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
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

Series: igt-runner fact checking (rev9)
URL   : https://patchwork.freedesktop.org/series/140841/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15761_full -> IGTPW_12219_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_12219_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][1] ([i915#6230])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][2] ([i915#11078])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8414]) +15 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-7/igt@drm_fdinfo@busy-hang@bcs0.html
    - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8414]) +10 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8414]) +6 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-6/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#9323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][7] ([i915#3555] / [i915#9323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-5/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][9] ([i915#12392] / [i915#7297])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-5/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8562])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8555])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hostile.html
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#8555])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8555]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][14] ([i915#1099])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#280]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-10/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [PASS][17] -> [ABORT][18] ([i915#10030] / [i915#7975] / [i915#8213])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-8/igt@gem_eio@hibernate.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-10/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][19] ([i915#13197])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk8/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#4812])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-3/igt@gem_exec_balancer@bonded-semaphore.html
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#4812])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-7/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#4771])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#4525])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-2/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglu:         NOTRUN -> [FAIL][24] ([i915#6117])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [PASS][25] -> [ABORT][26] ([i915#11713])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-2/igt@gem_exec_big@single.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-9/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#6334]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#4812]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#3539]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#3539])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-6/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#3539] / [i915#4852]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-2/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][33] +14 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-2/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#3281]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-3/igt@gem_exec_reloc@basic-cpu-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#3281])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-7/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3281]) +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3281]) +10 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-14/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4537] / [i915#4812])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-5/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][39] ([i915#13196]) +1 other test incomplete
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-11/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4860]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-4/igt@gem_fence_thrash@bo-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4860])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-14/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4860])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_gtt_cpu_tlb:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4077]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-4/igt@gem_gtt_cpu_tlb.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#4613]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-2/igt@gem_lmem_swapping@heavy-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4613])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][46] ([i915#4613])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][47] ([i915#4613]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#4613]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#284])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#284])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-2/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4083]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-3/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4077]) +10 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4077]) +18 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-14/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_offset@clear:
    - shard-mtlp:         [PASS][54] -> [ABORT][55] ([i915#10729]) +1 other test abort
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-mtlp-7/igt@gem_mmap_offset@clear.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-3/igt@gem_mmap_offset@clear.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4083]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-3/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4083]) +9 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3282]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][59] ([i915#2658])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk2/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3282]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-7/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3282]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-3/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][62] ([i915#2658])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglu:         [PASS][63] -> [SKIP][64] ([i915#4270]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-7/igt@gem_pxp@fail-invalid-protected-context.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-4/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][65] ([i915#13033])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4270]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][67] ([i915#12917] / [i915#12964])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-4/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4270]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#3282])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-8/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#8428])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-5/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#5190] / [i915#8428]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4079]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4885])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4885])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-8/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4079]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-2/igt@gem_tiled_pread_basic.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [PASS][76] -> [FAIL][77] ([i915#13137])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-3/igt@gem_tiled_swapping@non-threaded.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-5/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#3297] / [i915#4880])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3297] / [i915#4880]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3281] / [i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][81] ([i915#3297]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3297])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-5/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [PASS][84] -> [DMESG-FAIL][85] ([i915#12964])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-1/igt@gem_workarounds@suspend-resume-fd.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu-1:       NOTRUN -> [SKIP][86] ([i915#2527] / [i915#2856]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#2527]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-2/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#2527]) +6 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@gen9_exec_parse@bb-oversize.html
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#2856])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-8/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#2856]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-3/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#2527] / [i915#2856]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-5/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload:
    - shard-snb:          [PASS][92] -> [ABORT][93] ([i915#12450])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-snb5/igt@i915_module_load@reload.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-snb4/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [PASS][94] -> [ABORT][95] ([i915#10887] / [i915#12817] / [i915#13010] / [i915#9820])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - shard-mtlp:         [PASS][96] -> [DMESG-WARN][97] ([i915#1982])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-7/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#8399])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#8399])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-7/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][100] ([i915#12455]) +1 other test incomplete
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [WARN][101] ([i915#2681]) +4 other tests warn
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-dg1:          NOTRUN -> [FAIL][102] ([i915#12548] / [i915#3591])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          NOTRUN -> [FAIL][103] ([i915#12739] / [i915#3591])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-mtlp:         NOTRUN -> [SKIP][104] +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][105] ([i915#4423])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#11681] / [i915#6621])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#11681])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#7984])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@i915_power@sanity.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#5723])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#5723])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#5723])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][112] ([i915#9311]) +1 other test dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-10/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@perf:
    - shard-tglu:         [PASS][113] -> [ABORT][114] ([i915#13010]) +1 other test abort
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-5/igt@i915_selftest@perf.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-6/igt@i915_selftest@perf.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-tglu-1:       NOTRUN -> [ABORT][115] ([i915#13010])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][116] ([i915#4817])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4212])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#8709]) +7 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#9531])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][120] ([i915#1769]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#5286]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#5286]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4538] / [i915#5286]) +6 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#5286]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3638]) +9 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4538] / [i915#5190]) +8 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4538]) +7 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][128] +74 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#6095]) +29 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#10307] / [i915#6095]) +158 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#6095]) +22 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#6095]) +54 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#6095]) +105 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#6095]) +14 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#6095]) +180 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#12313]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#12313]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#11616] / [i915#7213])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#7213]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#4087]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#7828]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#7828]) +7 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#7828]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#7828]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-8/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#7828]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-10/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#7828]) +13 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3299])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#3299])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#7116] / [i915#9424])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-13/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#9424])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-13/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#7118])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#7118] / [i915#9424])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#7118] / [i915#9424])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#8814])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#3555])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3555])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#3555]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#13049]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#13049]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#13049])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#13049])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][164] ([i915#12917] / [i915#12964])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@kms_cursor_edge_walk@64x64-top-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-snb:          [PASS][165] -> [SKIP][166] +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-snb4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][167] ([i915#2346])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#9067])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#9067])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#4103] / [i915#4213])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#4103] / [i915#4213])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-glk:          [PASS][172] -> [DMESG-WARN][173] ([i915#1982]) +1 other test dmesg-warn
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-glk8/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk8/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#8588])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-7/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#8588])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-14/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#3804])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [PASS][177] -> [SKIP][178] ([i915#1257])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-10/igt@kms_dp_aux_dev.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-1/igt@kms_dp_aux_dev.html
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#1257])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#1257])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#8812])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3555] / [i915#3840]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#3840])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#3840])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#3555] / [i915#3840])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-3/igt@kms_dsc@dsc-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#3555] / [i915#3840])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#3555] / [i915#3840])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-14/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3840] / [i915#9053])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#3469])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#2065] / [i915#4854])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-5/igt@kms_feature_discovery@chamelium.html
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#4854])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-5/igt@kms_feature_discovery@chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#4854])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-3/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#4854])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#9337])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#658])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-13/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#3637]) +6 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#3637]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][198] -> [FAIL][199] ([i915#13027]) +1 other test fail
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#9934]) +3 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-5/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][201] ([i915#12745] / [i915#4839])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][202] ([i915#12745] / [i915#1982] / [i915#4839])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][203] ([i915#1982] / [i915#4839])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#3637]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#9934]) +9 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#9934]) +6 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-tglu:         [PASS][207] -> [FAIL][208] ([i915#11989]) +1 other test fail
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-6/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#8381])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#8381])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-2/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][211] ([i915#4839]) +2 other tests incomplete
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][212] ([i915#12745]) +1 other test incomplete
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2:          NOTRUN -> [FAIL][213] ([i915#11989]) +2 other tests fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
    - shard-snb:          [PASS][214] -> [FAIL][215] ([i915#11989]) +6 other tests fail
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-snb1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-snb4/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#2587] / [i915#2672]) +6 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#2672] / [i915#3555]) +5 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#2587] / [i915#2672] / [i915#3555])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#2672]) +4 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#2587] / [i915#2672]) +5 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#2672] / [i915#3555]) +6 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#2587] / [i915#2672]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#2672] / [i915#3555]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#2672] / [i915#3555]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#2672] / [i915#3555] / [i915#8813])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#2672] / [i915#8813])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#2672]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#5274])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][231] -> [FAIL][232] ([i915#6880])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#5354]) +28 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#1825]) +8 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][235] ([i915#10056])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#5439])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#8708]) +17 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#3023]) +15 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#8708]) +21 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#3458] / [i915#4423])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][241] +70 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#8708]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#1825]) +22 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#3458]) +16 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] +32 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#3458]) +24 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8228])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          [PASS][248] -> [SKIP][249] ([i915#3555] / [i915#8228])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#3555] / [i915#8228])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#3555] / [i915#8228]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#3555] / [i915#8228])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#3555] / [i915#8228])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#12388])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-14/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#12394])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#10656])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-9/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#12339])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-14/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#6301])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-5/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#6301])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-13/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-dg1:          NOTRUN -> [SKIP][260] +61 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][261] ([i915#12178])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][262] ([i915#7862]) +1 other test fail
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][263] ([i915#12964]) +20 other tests dmesg-warn
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-4/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#9809])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#5354] / [i915#9423])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-11/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][266] ([i915#8292])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#12247]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#12247]) +4 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#12247]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#12247] / [i915#6953]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#12247]) +11 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#12247] / [i915#3555] / [i915#9423])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#12247] / [i915#3555])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#12247]) +4 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#12247]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#5354]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-13/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#12343])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#3828])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#3828])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#3361])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@i2c:
    - shard-glk:          NOTRUN -> [FAIL][281] ([i915#8717])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk5/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#9519])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][283] -> [SKIP][284] ([i915#9519]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pm-tiling:
    - shard-rkl:          [PASS][285] -> [SKIP][286] ([i915#12916]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-4/igt@kms_pm_rpm@pm-tiling.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-4/igt@kms_pm_rpm@pm-tiling.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][287] ([i915#11520]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-snb7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#11520]) +11 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#11520]) +6 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-10/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#11520]) +4 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#11520]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#9808])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][293] ([i915#11520]) +9 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#12316]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#11520]) +7 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][296] ([i915#9683])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#9683]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-10/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#4348])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-7/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#9683])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#9732]) +6 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#9732]) +15 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-5/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#1072] / [i915#4423] / [i915#9732])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-13/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][303] ([i915#9688]) +4 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-7/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#1072] / [i915#9732]) +14 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-5/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#1072] / [i915#9732]) +11 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#1072] / [i915#9732]) +33 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@kms_psr@psr2-primary-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][307] +320 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk9/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#9685]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#9685]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#4884])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#12755]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#3555]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][313] -> [FAIL][314] ([IGT#160])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-10/igt@kms_sysfs_edid_timing.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-6/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#8623])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg1:          [PASS][316] -> [DMESG-WARN][317] ([i915#4423])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg1-17/igt@kms_universal_plane@cursor-fb-leak.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][318] ([i915#12276]) +3 other tests incomplete
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#3555])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-10/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#9906]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-7/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#2437] / [i915#9412])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu-1:       NOTRUN -> [SKIP][322] ([i915#2437])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#2437] / [i915#9412]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][324] ([i915#2437])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#2437])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#2437] / [i915#9412])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-rkl:          [PASS][327] -> [DMESG-WARN][328] ([i915#12964]) +50 other tests dmesg-warn
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-7/igt@perf@gen12-oa-tlb-invalidate.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-2/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#8850])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-14/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg1:          NOTRUN -> [FAIL][330] ([i915#12549] / [i915#6806]) +1 other test fail
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [PASS][331] -> [FAIL][332] ([i915#11943] / [i915#12515]) +1 other test fail
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-11/igt@perf_pmu@most-busy-idle-check-all.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-2/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-dg1:          [PASS][333] -> [FAIL][334] ([i915#11943]) +1 other test fail
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg1-14/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-13/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-mtlp:         [PASS][335] -> [FAIL][336] ([i915#11943] / [i915#12515]) +1 other test fail
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#3708]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#3291] / [i915#3708])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#3708])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-5/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][340] ([i915#9917])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#9917])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][342] +12 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-3/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#4818])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-6/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][344] ([i915#12817] / [i915#5507]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-10/igt@device_reset@unbind-reset-rebind.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-8/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][346] ([i915#7297]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         [FAIL][348] ([i915#11980] / [i915#12580]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-9/igt@gem_ctx_persistence@hostile.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-7/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][350] -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-10/igt@gem_eio@kms.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-3/igt@gem_eio@kms.html
    - shard-dg1:          [FAIL][352] ([i915#5784]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg1-17/igt@gem_eio@kms.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-14/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][354] ([i915#12543] / [i915#5784]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg1-12/igt@gem_eio@reset-stress.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][356] ([i915#12714] / [i915#5784]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg1-13/igt@gem_eio@unwedge-stress.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@gem_eio@unwedge-stress.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][358] ([i915#10131] / [i915#10887] / [i915#9820]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][360] ([i915#12942]) -> [PASS][361] +1 other test pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][362] -> [PASS][363] +1 other test pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-7/igt@i915_selftest@live.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [ABORT][364] ([i915#13010]) -> [PASS][365] +2 other tests pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-10/igt@i915_selftest@live@sanitycheck.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-8/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          [INCOMPLETE][366] -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-glk2/igt@i915_suspend@fence-restore-untiled.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk5/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][368] -> [PASS][369] +1 other test pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-5/igt@kms_async_flips@async-flip-suspend-resume.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - shard-glk:          [FAIL][370] ([i915#12238]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-glk8/igt@kms_atomic_transition@modeset-transition-fencing.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk5/igt@kms_atomic_transition@modeset-transition-fencing.html

  * igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:
    - shard-glk:          [FAIL][372] ([i915#11859]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-glk8/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk5/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2:          [FAIL][374] ([i915#5956]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-10/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][376] ([i915#11808]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-10/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [DMESG-FAIL][378] ([i915#11627]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          [DMESG-WARN][380] ([i915#12917] / [i915#12964]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-snb:          [SKIP][382] -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][384] ([i915#2346]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-pwrite:
    - shard-rkl:          [DMESG-WARN][386] ([i915#12964]) -> [PASS][387] +59 other tests pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-1/igt@kms_draw_crc@draw-method-pwrite.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@kms_draw_crc@draw-method-pwrite.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-snb:          [FAIL][388] ([i915#11989]) -> [PASS][389] +1 other test pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-snb4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-snb2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-mtlp:         [FAIL][390] ([i915#11989]) -> [PASS][391] +1 other test pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-mtlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-glk:          [SKIP][392] -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-glk4/igt@kms_hdmi_inject@inject-audio.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [SKIP][394] ([i915#3555] / [i915#8228]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-6/igt@kms_hdr@static-swap.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-10/igt@kms_hdr@static-swap.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][396] ([i915#9519]) -> [PASS][397] +1 other test pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][398] -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [SKIP][400] ([i915#9519]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-mtlp:         [FAIL][402] ([i915#11943]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [FAIL][404] ([i915#4349]) -> [PASS][405] +4 other tests pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html

  
#### Warnings ####

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [SKIP][406] ([i915#4270]) -> [TIMEOUT][407] ([i915#12964])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-2/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          [TIMEOUT][408] ([i915#12964]) -> [SKIP][409] ([i915#4270]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-1/igt@gem_pxp@create-valid-protected-context.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-4/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          [SKIP][410] ([i915#4270]) -> [TIMEOUT][411] ([i915#12917] / [i915#12964]) +1 other test timeout
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-7/igt@gem_pxp@display-protected-crc.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [FAIL][412] ([i915#13109]) -> [TIMEOUT][413] ([i915#12917] / [i915#12964])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          [TIMEOUT][414] ([i915#12917] / [i915#12964]) -> [SKIP][415] ([i915#4270])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg1:          [SKIP][416] ([i915#4423] / [i915#4538]) -> [SKIP][417] ([i915#4538])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg1-12/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-17/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][418] ([i915#9424]) -> [SKIP][419] ([i915#9433])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg1-14/igt@kms_content_protection@mei-interface.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-snb:          [SKIP][420] -> [INCOMPLETE][421] ([i915#8816])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-snb5/igt@kms_content_protection@type1.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-snb1/igt@kms_content_protection@type1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][422] ([i915#10433] / [i915#3458]) -> [SKIP][423] ([i915#3458]) +4 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [SKIP][424] ([i915#6953] / [i915#9423]) -> [FAIL][425] ([i915#8292])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          [FAIL][426] ([i915#9295]) -> [SKIP][427] ([i915#3361])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-dg1:          [SKIP][428] -> [SKIP][429] ([i915#4423])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-dg1-14/igt@kms_pm_rpm@modeset-pc8-residency-stress.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg1-18/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#160]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/160
  [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10729]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10729
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616
  [i915#11627]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11627
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
  [i915#11859]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11859
  [i915#11943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943
  [i915#11980]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12238]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12238
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12450
  [i915#12455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455
  [i915#12515]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12515
  [i915#12543]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12543
  [i915#12548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12548
  [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12580

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/index.html
