Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8B6C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 23:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22F010E98A;
	Thu, 10 Jul 2025 23:35:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E1B10E98A;
 Thu, 10 Jul 2025 23:35:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4821031436378385738=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_=2Echeckpatch=2Econf=3A_?=
 =?utf-8?q?Add_checkpatch=2Epl_defaults_for_IGT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Jul 2025 23:35:43 -0000
Message-ID: <175219054326.152706.936530983485661643@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710181613.62487-1-peter.senna@linux.intel.com>
In-Reply-To: <20250710181613.62487-1-peter.senna@linux.intel.com>
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

--===============4821031436378385738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: .checkpatch.conf: Add checkpatch.pl defaults for IGT
URL   : https://patchwork.freedesktop.org/series/151458/
State : success

== Summary ==

CI Bug Log - changes from IGT_8451_full -> IGTPW_13446_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between IGT_8451_full and IGTPW_13446_full:

### New IGT tests (1) ###

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  

Known issues
------------

  Here are the changes found in IGTPW_13446_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2-9:        NOTRUN -> [SKIP][1] ([i915#8411])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][2] ([i915#6230])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][3] ([i915#6230])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8411])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-3/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - shard-rkl:          [PASS][5] -> [DMESG-WARN][6] ([i915#12964]) +31 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@dmabuf@all-tests@dma_fence_chain.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@fbdev@nullptr:
    - shard-rkl:          [PASS][7] -> [SKIP][8] ([i915#14544] / [i915#2582]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@fbdev@nullptr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@fbdev@nullptr.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#7697])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_basic@multigpu-create-close.html
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#7697])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][11] -> [INCOMPLETE][12] ([i915#12392] / [i915#13356])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-6/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-3/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#7697])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-3/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          NOTRUN -> [ABORT][14] ([i915#13427])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#6335])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-2/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#6335])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu-1:       NOTRUN -> [SKIP][17] ([i915#8562])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#280]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#280])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][21] -> [FAIL][22] ([i915#5784]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg1-18/igt@gem_eio@reset-stress.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg1-13/igt@gem_eio@reset-stress.html

  * igt@gem_exec_await@wide-all:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][23] ([i915#12964]) +4 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_exec_await@wide-all.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#4771])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2-9:        NOTRUN -> [SKIP][25] ([i915#4812])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2-9:        NOTRUN -> [SKIP][26] ([i915#4036])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#8555]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#4525])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-7/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][29] ([i915#4525]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4812]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#6334]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-6/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][33] ([i915#3539])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][34] ([i915#3539] / [i915#4852]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#3281]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@gem_exec_reloc@basic-cpu.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#3281]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-4/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg2-9:        NOTRUN -> [SKIP][37] ([i915#3281]) +8 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4537] / [i915#4812])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2-9:        NOTRUN -> [SKIP][39] ([i915#4537] / [i915#4812])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4860]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2-9:        NOTRUN -> [SKIP][41] ([i915#4860])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#2190])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#4613] / [i915#7582])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#4613] / [i915#7582])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4613]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#4613]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#4613]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][48] ([i915#4613]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk2/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][49] ([i915#4613])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-dg2-9:        NOTRUN -> [SKIP][50] ([i915#284])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@big-bo-tiledy:
    - shard-dg2-9:        NOTRUN -> [SKIP][51] ([i915#4077]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_mmap_gtt@big-bo-tiledy.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4077]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@coherency:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4083]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-1/igt@gem_mmap_wc@coherency.html

  * igt@gem_mmap_wc@pf-nonblock:
    - shard-dg2-9:        NOTRUN -> [SKIP][54] ([i915#4083]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_mmap_wc@pf-nonblock.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#3282]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3282]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3282])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-1/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@bench:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#14544] / [i915#3282])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_pread@bench.html

  * igt@gem_pread@snoop:
    - shard-dg2-9:        NOTRUN -> [SKIP][59] ([i915#3282]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [PASS][60] -> [TIMEOUT][61] ([i915#12964])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#13398])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#13398])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4270]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-rkl:          [PASS][65] -> [SKIP][66] ([i915#14544] / [i915#4270])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-dg2-9:        NOTRUN -> [SKIP][67] ([i915#4270]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-rkl:          [PASS][68] -> [TIMEOUT][69] ([i915#12917] / [i915#12964])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#5190] / [i915#8428]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#8428])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][72] ([i915#5190] / [i915#8428]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][73] ([i915#4079]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#8411])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4079])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-4/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4885])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4079])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@gem_tiled_pread_basic.html

  * igt@gem_tiling_max_stride:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4077]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu-1:       NOTRUN -> [SKIP][79] ([i915#3297]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#3297]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#3297] / [i915#4880])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3297])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#14544] / [i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][86] ([i915#13356] / [i915#14586])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk11/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          NOTRUN -> [ABORT][87] ([i915#5566])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-dg2-9:        NOTRUN -> [SKIP][88] ([i915#2856]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#2856])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-3/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#2527] / [i915#2856]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#2527] / [i915#2856]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#2856]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_drm_fdinfo@busy-hang@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#14073]) +15 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@i915_drm_fdinfo@busy-hang@rcs0.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#14118])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#13786])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_module_load@load:
    - shard-glk:          ([PASS][96], [PASS][97], [PASS][98], [PASS][99]) -> ([PASS][100], [PASS][101], [PASS][102], [DMESG-WARN][103], [PASS][104]) ([i915#118])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-glk1/igt@i915_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-glk1/igt@i915_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-glk8/igt@i915_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-glk5/igt@i915_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk1/igt@i915_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk8/igt@i915_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk5/igt@i915_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk5/igt@i915_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk2/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [PASS][105] -> [DMESG-WARN][106] ([i915#13029] / [i915#14545])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-3/igt@i915_module_load@reload-no-display.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-3/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          [PASS][107] -> [DMESG-WARN][108] ([i915#13029] / [i915#14545])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg1-18/igt@i915_module_load@reload-no-display.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg1-13/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#8399])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#14498])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-rkl:          [PASS][111] -> [SKIP][112] ([i915#13328])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@i915_pm_rpm@gem-evict-pwrite.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-rkl:          [PASS][113] -> [INCOMPLETE][114] ([i915#12797])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-2/igt@i915_pm_rpm@system-suspend-execbuf.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#11681])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#6188])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#5723])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][118] ([i915#4817] / [i915#7443])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#4212])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-9:        NOTRUN -> [SKIP][120] ([i915#5190])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4212]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2:          [PASS][122] -> [FAIL][123] ([i915#5956]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#5286]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#5286]) +6 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#5286]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][127] +9 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#4538] / [i915#5190]) +9 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#5190]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-9:        NOTRUN -> [SKIP][130] ([i915#4538] / [i915#5190]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [PASS][131] -> [SKIP][132] ([i915#14544]) +48 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][133] ([i915#10307] / [i915#6095]) +39 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#6095]) +99 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#14544]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][136] ([i915#12313]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#6095]) +9 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#10307] / [i915#6095]) +136 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-a-dp-3.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#6095]) +69 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#10307] / [i915#10434] / [i915#6095])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#6095]) +34 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#6095]) +41 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][143] ([i915#6095]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#6095]) +16 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][145] +134 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#12313])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#14098] / [i915#6095]) +43 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#13783]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#11151] / [i915#7828]) +5 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-3/igt@kms_chamelium_audio@dp-audio.html
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#11151] / [i915#14544] / [i915#7828])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#11151] / [i915#7828]) +8 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#11151] / [i915#7828]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#11151] / [i915#7828]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg2-9:        NOTRUN -> [SKIP][154] ([i915#11151] / [i915#7828]) +6 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#11151] / [i915#7828]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@ctm-0-25:
    - shard-rkl:          [PASS][156] -> [SKIP][157] ([i915#12655] / [i915#14544])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@kms_color@ctm-0-25.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_color@ctm-0-25.html

  * igt@kms_color@deep-color:
    - shard-dg2-9:        NOTRUN -> [SKIP][158] ([i915#12655] / [i915#3555])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][159] ([i915#7173])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-3.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2-9:        NOTRUN -> [SKIP][160] ([i915#9424])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#3299])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][162] ([i915#3116] / [i915#3299])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#3299])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#6944] / [i915#9424])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#9424])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7118] / [i915#9424])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#3555]) +4 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#13049])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][169] ([i915#3555]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-tglu:         NOTRUN -> [FAIL][170] ([i915#13566]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-7/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-9:        NOTRUN -> [SKIP][171] ([i915#13049])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][172] ([i915#13566]) +1 other test fail
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#8814]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#13049])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-9:        NOTRUN -> [SKIP][175] ([i915#13046] / [i915#5354]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-9:        NOTRUN -> [SKIP][176] ([i915#4103] / [i915#4213]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#11190] / [i915#14544])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#4103])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#4213])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-rkl:          [PASS][180] -> [SKIP][181] ([i915#11190] / [i915#14544]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#13046] / [i915#5354]) +5 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-rkl:          NOTRUN -> [SKIP][183] +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [PASS][184] -> [FAIL][185] ([i915#2346])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#9067])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2-9:        NOTRUN -> [SKIP][187] ([i915#9833])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#9723])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#9723])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#13691])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#3804])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3555]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-9:        NOTRUN -> [SKIP][193] ([i915#1257])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#13749])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#13748])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#13749])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#13707])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#13707])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#13707])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-9:        NOTRUN -> [SKIP][200] ([i915#3555] / [i915#3840])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#3840])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#3840])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#3840] / [i915#9053])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3469]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#4854])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-9:        NOTRUN -> [SKIP][206] ([i915#1839])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#1839])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-9:        NOTRUN -> [SKIP][208] ([i915#658])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#14544] / [i915#9934])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#3637] / [i915#9934]) +3 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#3637] / [i915#9934]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-9/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#9934]) +8 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#3637] / [i915#9934])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#9934]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-9:        NOTRUN -> [SKIP][215] ([i915#9934]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-rkl:          [PASS][216] -> [SKIP][217] ([i915#14544] / [i915#3637]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_flip@bo-too-big-interruptible.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#14544] / [i915#3637])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#8381])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2-9:        NOTRUN -> [SKIP][220] ([i915#8381])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][221] ([i915#12314] / [i915#12745] / [i915#4839])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-rkl:          [PASS][222] -> [INCOMPLETE][223] ([i915#6113])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][224] ([i915#6113])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][225] ([i915#12314] / [i915#4839])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#2672] / [i915#3555]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][228] ([i915#2672] / [i915#3555]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#2672]) +4 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][230] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#2672]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#2587] / [i915#2672]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][233] ([i915#2672]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-rkl:          [PASS][234] -> [SKIP][235] ([i915#14544] / [i915#3555]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#2587] / [i915#2672] / [i915#3555])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#2672] / [i915#3555]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#2587] / [i915#2672]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#2672] / [i915#3555]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#14544] / [i915#3555])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][242] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][244] -> [FAIL][245] ([i915#6880]) +2 other tests fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][246]
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
    - shard-snb:          NOTRUN -> [SKIP][247]
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][248] ([i915#8708]) +9 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-rkl:          [PASS][249] -> [SKIP][250] ([i915#14544] / [i915#1849] / [i915#5354]) +5 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-9:        NOTRUN -> [SKIP][251] ([i915#5354]) +16 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#1825]) +10 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#5354]) +31 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#8708]) +14 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#1825]) +6 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][256] +55 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#10055])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#8708]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][259] ([i915#3458]) +10 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#14544] / [i915#1849] / [i915#5354]) +5 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] +29 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-glk11:        NOTRUN -> [SKIP][262] +85 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#3458]) +17 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#3023]) +5 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#13030])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#3555] / [i915#8228]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@kms_hdr@bpc-switch-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#3555] / [i915#8228])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2-9:        NOTRUN -> [SKIP][268] ([i915#3555] / [i915#8228]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#3555] / [i915#8228])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-rkl:          [PASS][270] -> [SKIP][271] ([i915#14544] / [i915#3555] / [i915#8826])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_invalid_mode@bad-hsync-end.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#10656]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#12388])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][274] ([i915#12394])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#12339])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-dg2-9:        NOTRUN -> [SKIP][276] +9 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][277] ([i915#13476])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#13705])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#13958])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-9:        NOTRUN -> [SKIP][280] ([i915#13958]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#13958])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#14259])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-7/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2-9:        NOTRUN -> [SKIP][283] ([i915#13046] / [i915#5354] / [i915#9423])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [PASS][284] -> [SKIP][285] ([i915#6953] / [i915#9423])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#12247] / [i915#14544])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#12247] / [i915#14544] / [i915#8152]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2-9:        NOTRUN -> [SKIP][288] ([i915#12247]) +11 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-9:        NOTRUN -> [SKIP][289] ([i915#12247] / [i915#9423]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#12247]) +13 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#12247]) +4 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#3555])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-rkl:          [PASS][293] -> [SKIP][294] ([i915#14544] / [i915#8152])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-rkl:          [PASS][295] -> [SKIP][296] ([i915#12247] / [i915#14544]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:
    - shard-rkl:          [PASS][297] -> [SKIP][298] ([i915#12247] / [i915#14544] / [i915#8152]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#12247]) +4 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-9:        NOTRUN -> [SKIP][300] ([i915#12247] / [i915#6953] / [i915#9423])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#12247] / [i915#6953])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-rkl:          [PASS][302] -> [SKIP][303] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#6953] / [i915#8152])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#12247] / [i915#3555] / [i915#6953])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#12247]) +7 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu-1:       NOTRUN -> [SKIP][306] ([i915#9812])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-9:        NOTRUN -> [SKIP][307] ([i915#9685])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#3828])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-5/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg2-9:        NOTRUN -> [SKIP][309] ([i915#3828])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-9:        NOTRUN -> [SKIP][310] ([i915#14104])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#3828])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][312] -> [SKIP][313] ([i915#9519])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-rkl:          [PASS][314] -> [SKIP][315] ([i915#14544] / [i915#1849])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@kms_pm_rpm@fences-dpms.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_pm_rpm@fences-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][316] -> [SKIP][317] ([i915#9519]) +3 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-mtlp:         NOTRUN -> [SKIP][318] +6 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2-9:        NOTRUN -> [SKIP][319] ([i915#6524] / [i915#6805])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#6524])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-rkl:          [PASS][321] -> [SKIP][322] ([i915#11521] / [i915#14544]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-2/igt@kms_properties@plane-properties-atomic.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][323] ([i915#11520]) +4 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#9808])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-glk11:        NOTRUN -> [SKIP][325] ([i915#11520]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#11520]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#11520]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#11520]) +4 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#12316]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#11520]) +9 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-9:        NOTRUN -> [SKIP][331] ([i915#11520]) +5 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#9683])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#9732]) +13 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-6/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#9688]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-3/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-dg2-9:        NOTRUN -> [SKIP][335] ([i915#1072] / [i915#9732]) +12 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#1072] / [i915#9732]) +19 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-1/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#1072] / [i915#9732]) +4 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][338] ([i915#9732]) +7 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#9685]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-mtlp:         NOTRUN -> [SKIP][340] ([i915#12755])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][341] ([i915#5289])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#12755] / [i915#5190])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][343] ([i915#12755] / [i915#5190])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][344] ([i915#12755])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#12755])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-tglu-1:       NOTRUN -> [SKIP][346] ([i915#3555]) +3 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][347] ([i915#13179]) +1 other test abort
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][348] -> [SKIP][349] ([i915#1311])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#9906]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_vrr@flip-basic-fastset.html
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#9906])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#3555] / [i915#9906])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu-1:       NOTRUN -> [SKIP][353] ([i915#2437])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][354] ([i915#2437])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk5/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#2437] / [i915#9412])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-mtlp:         NOTRUN -> [SKIP][356] ([i915#2437] / [i915#9412])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-9:        NOTRUN -> [SKIP][357] ([i915#2437] / [i915#9412])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config:
    - shard-dg2-9:        NOTRUN -> [SKIP][358] ([i915#7387])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@perf@global-sseu-config.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#7387])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@perf@global-sseu-config-invalid.html

  * igt@perf_pmu@module-unload:
    - shard-tglu-1:       NOTRUN -> [FAIL][360] ([i915#14433])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][361] ([i915#8516])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - shard-mtlp:         [PASS][362] -> [FAIL][363] ([i915#4349]) +1 other test fail
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle@vcs1.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-1/igt@perf_pmu@render-node-busy-idle@vcs1.html
    - shard-dg2:          NOTRUN -> [FAIL][364] ([i915#4349]) +2 other tests fail
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@perf_pmu@render-node-busy-idle@vcs1.html
    - shard-dg1:          [PASS][365] -> [FAIL][366] ([i915#4349]) +1 other test fail
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg1-16/igt@perf_pmu@render-node-busy-idle@vcs1.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg1-19/igt@perf_pmu@render-node-busy-idle@vcs1.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][367] ([i915#3708] / [i915#4077]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#9917]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sysfs_heartbeat_interval@precise@vcs0:
    - shard-rkl:          [PASS][369] -> [FAIL][370] ([i915#14018]) +1 other test fail
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@sysfs_heartbeat_interval@precise@vcs0.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@sysfs_heartbeat_interval@precise@vcs0.html

  
#### Possible fixes ####

  * igt@drm_read@empty-block:
    - shard-rkl:          [SKIP][371] ([i915#14544]) -> [PASS][372] +30 other tests pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@drm_read@empty-block.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@drm_read@empty-block.html

  * igt@fbdev@write:
    - shard-rkl:          [SKIP][373] ([i915#14544] / [i915#2582]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@fbdev@write.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@fbdev@write.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][375] ([i915#5784]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg1-19/igt@gem_eio@unwedge-stress.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-rkl:          [TIMEOUT][377] ([i915#3778]) -> [PASS][378] +1 other test pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-2/igt@gem_exec_endless@dispatch@rcs0.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-rkl:          [SKIP][379] ([i915#14544] / [i915#1850]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          [TIMEOUT][381] ([i915#12917] / [i915#12964]) -> [PASS][382] +1 other test pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [INCOMPLETE][383] ([i915#13356]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@gem_workarounds@suspend-resume-fd.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-rkl:          [SKIP][385] ([i915#13328]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@i915_pm_rpm@gem-pread.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [INCOMPLETE][387] ([i915#4817]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-3/igt@i915_suspend@sysfs-reader.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@i915_suspend@sysfs-reader.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-mtlp:         [FAIL][389] ([i915#10991]) -> [PASS][390] +1 other test pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [FAIL][391] ([i915#11808] / [i915#5956]) -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][393] ([i915#11808]) -> [PASS][394] +1 other test pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-tglu-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [FAIL][395] ([i915#13566]) -> [PASS][396] +3 other tests pass
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          [FAIL][397] ([i915#13566]) -> [PASS][398] +3 other tests pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [SKIP][399] ([i915#13707]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-rkl:          [SKIP][401] ([i915#14544] / [i915#3637]) -> [PASS][402] +2 other tests pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-rkl:          [SKIP][403] ([i915#14544] / [i915#3555]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][405] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][406] +6 other tests pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_invalid_mode@overflow-vrefresh:
    - shard-rkl:          [SKIP][407] ([i915#14544] / [i915#8826]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_invalid_mode@overflow-vrefresh.html

  * igt@kms_invalid_mode@zero-vdisplay:
    - shard-rkl:          [SKIP][409] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_invalid_mode@zero-vdisplay.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_invalid_mode@zero-vdisplay.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [SKIP][411] ([i915#12388]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-5/igt@kms_joiner@basic-force-big-joiner.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane@pixel-format:
    - shard-rkl:          [SKIP][413] ([i915#14544] / [i915#8825]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_plane@pixel-format.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_plane@pixel-format.html

  * igt@kms_plane_cursor@viewport:
    - shard-rkl:          [DMESG-WARN][415] ([i915#12917] / [i915#12964]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@kms_plane_cursor@viewport.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-rkl:          [SKIP][417] ([i915#14544] / [i915#8152]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@invalid-parameters.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-rkl:          [SKIP][419] ([i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-rkl:          [SKIP][421] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][422] +1 other test pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-rkl:          [SKIP][423] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - shard-rkl:          [SKIP][425] ([i915#12247] / [i915#14544]) -> [PASS][426] +1 other test pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [SKIP][427] ([i915#9519]) -> [PASS][428]
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@kms_pm_rpm@dpms-non-lpsp.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][429] ([i915#9519]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-rkl:          [SKIP][431] ([i915#11521] / [i915#14544]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_setmode@basic:
    - shard-snb:          [FAIL][433] ([i915#5465]) -> [PASS][434] +2 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-snb6/igt@kms_setmode@basic.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-snb5/igt@kms_setmode@basic.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [DMESG-WARN][435] ([i915#12964]) -> [PASS][436] +30 other tests pass
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@perf@polling@0-rcs0.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][437] ([i915#4349]) -> [PASS][438] +1 other test pass
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          [SKIP][439] ([i915#14544] / [i915#8411]) -> [SKIP][440] ([i915#8411])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          [SKIP][441] ([i915#7697]) -> [SKIP][442] ([i915#14544] / [i915#7697])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@gem_close_race@multigpu-basic-process.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          [SKIP][443] ([i915#6335]) -> [SKIP][444] ([i915#14544] / [i915#6335])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@gem_create@create-ext-cpu-access-big.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          [SKIP][445] ([i915#14544] / [i915#280]) -> [SKIP][446] ([i915#280])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          [SKIP][447] ([i915#4525]) -> [SKIP][448] ([i915#14544] / [i915#4525]) +2 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@gem_exec_balancer@parallel-bb-first.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          [SKIP][449] ([i915#14544] / [i915#4525]) -> [SKIP][450] ([i915#4525])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][451] ([i915#14544] / [i915#3281]) -> [SKIP][452] ([i915#3281]) +5 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          [SKIP][453] ([i915#3281]) -> [SKIP][454] ([i915#14544] / [i915#3281]) +4 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@gem_exec_reloc@basic-scanout.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-rkl:          [SKIP][455] ([i915#4613]) -> [SKIP][456] ([i915#14544] / [i915#4613]) +3 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-multi.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-rkl:          [SKIP][457] ([i915#14544] / [i915#4613]) -> [SKIP][458] ([i915#4613]) +2 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_pread@snoop:
    - shard-rkl:          [SKIP][459] ([i915#3282]) -> [SKIP][460] ([i915#14544] / [i915#3282]) +4 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@gem_pread@snoop.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_pread@snoop.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [TIMEOUT][461] ([i915#12917] / [i915#12964]) -> [SKIP][462] ([i915#13717])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-rkl:          [SKIP][463] ([i915#14544] / [i915#3282]) -> [SKIP][464] ([i915#3282]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@gem_readwrite@read-bad-handle.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][465] ([i915#8411]) -> [SKIP][466] ([i915#14544] / [i915#8411])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-rkl:          [SKIP][467] ([i915#3297]) -> [SKIP][468] ([i915#14544] / [i915#3297])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          [SKIP][469] ([i915#2527]) -> [SKIP][470] ([i915#14544] / [i915#2527]) +2 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          [SKIP][471] ([i915#14544] / [i915#2527]) -> [SKIP][472] ([i915#2527])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          [SKIP][473] ([i915#6412]) -> [SKIP][474] ([i915#14544] / [i915#6412])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@i915_module_load@resize-bar.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@i915_module_load@resize-bar.html

  * igt@i915_power@sanity:
    - shard-rkl:          [SKIP][475] ([i915#7984]) -> [SKIP][476] ([i915#14544] / [i915#7984])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-3/igt@i915_power@sanity.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@i915_power@sanity.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-rkl:          [DMESG-WARN][477] ([i915#12964]) -> [SKIP][478] ([i915#14544])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-rkl:          [SKIP][479] ([i915#5286]) -> [SKIP][480] ([i915#14544]) +5 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          [SKIP][481] ([i915#14544]) -> [SKIP][482] ([i915#5286]) +3 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          [SKIP][483] ([i915#14544]) -> [SKIP][484] ([i915#3638]) +1 other test skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          [SKIP][485] ([i915#3638]) -> [SKIP][486] ([i915#14544]) +4 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg1:          [SKIP][487] ([i915#3638]) -> [SKIP][488] ([i915#3638] / [i915#4423])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg1-18/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg1-12/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          [SKIP][489] ([i915#14544]) -> [SKIP][490] +8 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][491] ([i915#6095]) -> [SKIP][492] ([i915#14098] / [i915#6095]) +1 other test skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-rkl:          [SKIP][493] ([i915#14098] / [i915#6095]) -> [SKIP][494] ([i915#14544]) +11 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-rkl:          [SKIP][495] ([i915#14544]) -> [SKIP][496] ([i915#14098] / [i915#6095]) +4 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][497] ([i915#14544]) -> [SKIP][498] ([i915#12313])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][499] ([i915#14098] / [i915#6095]) -> [SKIP][500] ([i915#6095]) +4 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          [SKIP][501] ([i915#6095]) -> [SKIP][502] ([i915#4423] / [i915#6095]) +1 other test skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg1-18/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-4.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg1-18/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          [SKIP][503] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][504] ([i915#11151] / [i915#7828]) +7 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          [SKIP][505] ([i915#11151] / [i915#7828]) -> [SKIP][506] ([i915#11151] / [i915#14544] / [i915#7828]) +8 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          [SKIP][507] ([i915#7118] / [i915#9424]) -> [FAIL][508] ([i915#7173])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-8/igt@kms_content_protection@atomic.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][509] ([i915#9424]) -> [SKIP][510] ([i915#14544])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@kms_content_protection@mei-interface.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          [SKIP][511] ([i915#9433]) -> [SKIP][512] ([i915#9424])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg1-13/igt@kms_content_protection@mei-interface.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg1-15/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          [SKIP][513] ([i915#7118] / [i915#9424]) -> [SKIP][514] ([i915#14544])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@kms_content_protection@uevent.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-rkl:          [SKIP][515] ([i915#14544]) -> [SKIP][516] ([i915#13049])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][517] ([i915#13049]) -> [SKIP][518] ([i915#14544])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][519] ([i915#3555]) -> [SKIP][520] ([i915#14544]) +5 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][521] -> [SKIP][522] ([i915#14544]) +13 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][523] ([i915#4103]) -> [SKIP][524] ([i915#11190] / [i915#14544])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          [SKIP][525] ([i915#14544]) -> [SKIP][526] ([i915#9067])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          [SKIP][527] ([i915#4103]) -> [SKIP][528] ([i915#14544])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][529] ([i915#9723]) -> [SKIP][530] ([i915#14544])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          [SKIP][531] ([i915#14544]) -> [SKIP][532] ([i915#13749])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][533] ([i915#11190] / [i915#14544]) -> [SKIP][534] ([i915#3555] / [i915#3840])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_dsc@dsc-basic.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          [SKIP][535] ([i915#3840]) -> [SKIP][536] ([i915#14544])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          [SKIP][537] ([i915#14544]) -> [SKIP][538] ([i915#3840] / [i915#9053])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-snb:          [TIMEOUT][539] ([i915#14033] / [i915#14350]) -> [ABORT][540] ([i915#12817])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-snb6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [TIMEOUT][541] ([i915#14033]) -> [ABORT][542] ([i915#12817])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-snb6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          [SKIP][543] ([i915#9934]) -> [SKIP][544] ([i915#14544] / [i915#9934]) +2 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-2/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          [SKIP][545] ([i915#14544] / [i915#9934]) -> [SKIP][546] ([i915#9934]) +2 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          [DMESG-WARN][547] ([i915#12964]) -> [SKIP][548] ([i915#14544] / [i915#3637])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][549] ([i915#14544] / [i915#3555]) -> [SKIP][550] ([i915#2672] / [i915#3555]) +2 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][551] ([i915#2672] / [i915#3555]) -> [SKIP][552] ([i915#14544] / [i915#3555]) +2 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          [SKIP][553] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][554] ([i915#1825]) +23 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][555] ([i915#10433] / [i915#3458]) -> [SKIP][556] ([i915#3458]) +1 other test skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][557] -> [SKIP][558] ([i915#14544] / [i915#1849] / [i915#5354])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][559] ([i915#3023]) -> [SKIP][560] ([i915#14544] / [i915#1849] / [i915#5354]) +20 other tests skip
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          [SKIP][561] ([i915#3458]) -> [SKIP][562] ([i915#10433] / [i915#3458]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          [SKIP][563] ([i915#1825]) -> [SKIP][564] ([i915#14544] / [i915#1849] / [i915#5354]) +28 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          [SKIP][565] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][566] ([i915#3023]) +10 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          [SKIP][567] ([i915#3555] / [i915#8228]) -> [SKIP][568] ([i915#14544]) +1 other test skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][569] ([i915#13331]) -> [SKIP][570] ([i915#12713])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          [SKIP][571] ([i915#14544]) -> [SKIP][572] ([i915#12713])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          [SKIP][573] ([i915#1187] / [i915#12713]) -> [SKIP][574] ([i915#12713])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg1-16/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-rkl:          [SKIP][575] ([i915#12394]) -> [SKIP][576] ([i915#12394] / [i915#14544])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-7/igt@kms_joiner@basic-force-ultra-joiner.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          [SKIP][577] ([i915#12339]) -> [SKIP][578] ([i915#12339] / [i915#14544])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_joiner@basic-ultra-joiner.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][579] ([i915#14544] / [i915#4070] / [i915#4816]) -> [SKIP][580] ([i915#4070] / [i915#4816])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [SKIP][581] ([i915#14544]) -> [INCOMPLETE][582] ([i915#13476])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-rkl:          [INCOMPLETE][583] ([i915#14412]) -> [SKIP][584] ([i915#14544] / [i915#8825])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-rkl:          [SKIP][585] ([i915#14544]) -> [SKIP][586] ([i915#13958])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-rkl:          [SKIP][587] ([i915#12247]) -> [SKIP][588] ([i915#12247] / [i915#14544] / [i915#8152]) +4 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          [SKIP][589] ([i915#12247]) -> [SKIP][590] ([i915#12247] / [i915#14544]) +2 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][591] ([i915#12247] / [i915#14544]) -> [SKIP][592] ([i915#12247]) +1 other test skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][593] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][594] ([i915#12247]) +3 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-rkl:          [SKIP][595] ([i915#12247] / [i915#6953]) -> [SKIP][596] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          [SKIP][597] ([i915#5354]) -> [SKIP][598] ([i915#14544] / [i915#5354])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@kms_pm_backlight@basic-brightness.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          [SKIP][599] ([i915#12343]) -> [SKIP][600] ([i915#12343] / [i915#14544])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          [SKIP][601] ([i915#9685]) -> [SKIP][602] ([i915#14544] / [i915#9685])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][603] ([i915#14544] / [i915#4281]) -> [SKIP][604] ([i915#4281])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [DMESG-WARN][605] ([i915#12964]) -> [SKIP][606] ([i915#9519])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][607] ([i915#11520] / [i915#14544]) -> [SKIP][608] ([i915#11520]) +3 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-rkl:          [SKIP][609] ([i915#11520]) -> [SKIP][610] ([i915#11520] / [i915#14544]) +3 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          [SKIP][611] ([i915#9683]) -> [SKIP][612] ([i915#14544] / [i915#9683])
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-3/igt@kms_psr2_su@page_flip-xrgb8888.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@pr-sprite-render:
    - shard-rkl:          [SKIP][613] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][614] ([i915#1072] / [i915#9732]) +10 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_psr@pr-sprite-render.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          [SKIP][615] ([i915#1072] / [i915#9732]) -> [SKIP][616] ([i915#1072] / [i915#14544] / [i915#9732]) +18 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-8/igt@kms_psr@psr-sprite-plane-move.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          [SKIP][617] ([i915#14544]) -> [SKIP][618] ([i915#5289]) +1 other test skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          [SKIP][619] ([i915#14544]) -> [SKIP][620] ([i915#3555])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-rkl:          [SKIP][621] ([i915#3555]) -> [SKIP][622] ([i915#14544] / [i915#3555])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][623] ([i915#14544]) -> [SKIP][624] ([i915#8623])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          [SKIP][625] ([i915#14544]) -> [SKIP][626] ([i915#9906])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          [SKIP][627] ([i915#9906]) -> [SKIP][628] ([i915#14544])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@kms_vrr@max-min.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-rkl:          [SKIP][629] ([i915#2437] / [i915#9412]) -> [SKIP][630] ([i915#14544] / [i915#2437] / [i915#9412])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][631] ([i915#3291] / [i915#3708]) -> [SKIP][632] ([i915#14544] / [i915#3291] / [i915#3708])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-2/igt@prime_vgem@basic-write.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          [SKIP][633] ([i915#3708]) -> [SKIP][634] ([i915#14544] / [i915#3708])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-rkl-5/igt@prime_vgem@fence-read-hang.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@prime_vgem@fence-read-hang.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12797]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12797
  [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#1311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1311
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328
  [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14018]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14018
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1850
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
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
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
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
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8451 -> IGTPW_13446

  CI-20190529: 20190529
  CI_DRM_16842: ad02e528d11b8cdc56daaa647aed319ba1d1ff03 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13446: 13446
  IGT_8451: 8451

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/index.html

--===============4821031436378385738==
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
<tr><td><b>Series:</b></td><td>.checkpatch.conf: Add checkpatch.pl defaults=
 for IGT</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151458/">https://patchwork.freedesktop.org/series/151458/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13446/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13446/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8451_full -&gt; IGTPW_13446_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/index=
.html</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8451_full and IGTPW_13446_ful=
l:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-=
hdmi-a2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13446_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@api_intel_bb@blit-reloc-purge-cac=
he.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@api_intel_bb@crc32.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">=
i915#6230</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@api_intel_bb@crc32.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230=
">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-3/igt@api_intel_bb@object-reloc-keep-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-=
rkl-5/igt@dmabuf@all-tests@dma_fence_chain.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964<=
/a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@fbdev@nul=
lptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7697">i915#7697</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@gem_basic@multigpu-create-close=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-6/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0=
-smem-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13446/shard-dg2-3/igt@gem_ccs@suspend-resume@xmajor-compres=
sed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>=
)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-3/igt@gem_close_race@multigpu-basic-pr=
ocess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-1/igt@gem_create@create-ext-cpu-access-=
big.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13427">i915#13427</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-2/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@gem_create@create-ext-cpu-access-=
sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-2/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg1-18/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg1-13/igt@=
gem_eio@reset-stress.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5784">i915#5784</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_await@wide-all:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_exec_await@wide-all.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12964">i915#12964</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_balancer@bonded-true-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_balancer@invalid-bonds.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@gem_exec_balancer@noheartbeat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-7/igt@gem_exec_balancer@parallel.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-=
submit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@gem_exec_balancer@sliced.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-6/igt@gem_exec_capture@capture-invisib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@gem_exec_flush@basic-uc-prw-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_flush@basic-uc-set-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_flush@basic-wb-pro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@gem_exec_reloc@basic-cpu.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-4/igt@gem_exec_reloc@basic-cpu-wc-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_reloc@basic-write-read-n=
oreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-c=
ontexts-chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4860">i915#4860</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-f=
ences-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@gem_huc_copy@huc-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/21=
90">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@gem_lmem_evict@dontneed-evict-r=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@gem_lmem_swapping@basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-=
multi-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@gem_lmem_swapping@parallel-random=
-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-glk2/igt@gem_lmem_swapping@random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_media_vme.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#2=
84</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-bo-tiledy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_mmap_gtt@big-bo-tiledy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@gem_mmap_gtt@fault-concurrent-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@coherency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-1/igt@gem_mmap_wc@coherency.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/408=
3">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@pf-nonblock:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_mmap_wc@pf-nonblock.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@gem_partial_pwrite_pread@reads.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-un=
cached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-1/igt@gem_partial_pwrite_pread@writes-=
after-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_pread@bench.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_pread@snoop.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i91=
5#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-r=
kl-2/igt@gem_pxp@create-protected-buffer.html">TIMEOUT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@gem_pxp@verify-pxp-execution-afte=
r-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13446/shard-rkl-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resum=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_pxp@verify-pxp-stale-buf-opto=
ut-execution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/=
shard-rkl-5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i9=
15#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-=
y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@gem_render_copy@yf-tiled-ccs-to-=
yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_render_copy@yf-tiled-mc-ccs-t=
o-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4079">i915#4079</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-4/igt@gem_set_tiling_vs_pwrite.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@gem_softpin@evict-snoop.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@gem_tiled_pread_basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/407=
9">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiling_max_stride:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@gem_tiling_max_stride.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
77">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gem_userptr_blits@coherency-sync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@gem_userptr_blits@dmabuf-sync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@gem_userptr_blits@invalid-mmap-o=
ffset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@gem_userptr_blits@map-fixed-inval=
idate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@gem_userptr_blits@readonly-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@gem_userptr_blits@unsync-overlap.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-af=
ter-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-glk11/igt@gem_workarounds@suspend-resume-fd=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-glk1/igt@gen9_exec_parse@allowed-all.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@gen9_exec_parse@basic-rejected-ct=
x-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-3/igt@gen9_exec_parse@bb-chained.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@gen9_exec_parse@bb-large.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-6/igt@gen9_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@gen9_exec_parse@secure-batches.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@i915_drm_fdinfo@busy-hang@rcs0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14073">i915#14073</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@i915_drm_fdinfo@virtual-busy-idle=
-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@i915_fb_tiling@basic-x-tiling.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8451/shard-glk1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-glk1/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8451/shard-glk8/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8451/shard-glk5/igt@i915_m=
odule_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13446/shard-glk1/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard=
-glk8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk5/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
446/shard-glk5/igt@i915_module_load@load.html">DMESG-WARN</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-glk2/igt@i915_mod=
ule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-3/igt@i915_module_load@reload-no-display.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shar=
d-dg2-3/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13=
029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14545">i915#14545</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg1-18/igt@i915_module_load@reload-no-display.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/sha=
rd-dg1-13/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#=
13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-mult=
iple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@i915_pm_rpm@gem-evict-pwrite.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-=
3/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13328">i915#13328</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-2/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shar=
d-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12797">i915#12=
797</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@i915_pm_rps@thresholds-idle.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@i915_query@query-topology-cohere=
nt-slice-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@i915_suspend@basic-s3-without-i9=
15.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-s=
mall-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@kms_addfb_basic@clobberred-modifi=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4212">i915#4212</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-2/igt@kms_atomic_transition@plane-toggle-modeset-transi=
tion.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13446/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-t=
ransition.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_big_fb@x-tiled-32bpp-rotate-2=
70.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-ove=
rflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>=
) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@kms_busy@extended-modeset-hang-newfb-with-reset.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13446/shard-rkl-6/igt@kms_busy@extended-modeset-hang-newfb-with-reset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-=
dg2-mc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +99 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_ccs@crc-primary-basic-4-tiled=
-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-1/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_ccs@crc-primary-basic-yf-til=
ed-ccs@pipe-a-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +136 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@kms_ccs@crc-primary-basic-yf-til=
ed-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +41 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +16 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-glk2/igt@kms_ccs@missing-ccs-buffer-y-tiled=
-gen12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> +134 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_ccs@random-ccs-data-y-tiled-c=
cs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +43 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hd=
mi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13783">i915#13783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-3/igt@kms_chamelium_audio@dp-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_chamelium_audio@dp-audio.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_chamelium_audio@hdmi-audio.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_chamelium_hpd@common-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd-after-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@kms_color@ctm-0-25.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@km=
s_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_color@deep-color.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1265=
5">i915#12655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_content_protection@atomic@pi=
pe-a-dp-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_content_protection@content-ty=
pe-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-2/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@kms_content_protection@lic-type=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@kms_content_protection@lic-type-1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@kms_content_protection@uevent.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_cursor_crc@cursor-onscreen-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-7/igt@kms_cursor_crc@cursor-random-64x=
21.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128=
x42@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_cursor_legacy@2x-cursor-vs-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other t=
est skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-6/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13446/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flip=
b-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flip=
b-atomic-transitions.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446=
/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915=
#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9723">i915#9723</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-7/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_dp_aux_dev.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915=
#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-2/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@kms_dp_linktrain_fallback@dsc-f=
allback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_dsc@dsc-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i=
915#3469</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_feature_discovery@chamelium.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_feature_discovery@display-2x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_feature_discovery@display-3x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_feature_discovery@psr1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-m=
odeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-9/igt@kms_flip@2x-flip-vs-panning.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@kms_flip@2x-flip-vs-wf_vblank.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-5/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_flip@2x-plain-flip-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs=
-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_flip@bo-too-big-interruptible.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard=
-rkl-6/igt@kms_flip@bo-too-big-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">=
i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip@dpms-vs-vblank-race.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_flip@flip-vs-fences.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_flip@flip-vs-fences-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-glk8/igt@kms_flip@flip-vs-suspend-interrupt=
ible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/=
shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">=
i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interrup=
tible@a-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-glk8/igt@kms_flip@flip-vs-suspend-interrupt=
ible@a-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8810">i915#8810</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) +5 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915=
#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-yti=
le-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672"=
>i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i9=
15#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i9=
15#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indf=
b-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-pri-indfb-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-shrfb-draw-render.html">SKIP</a></li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-shrfb-draw-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-s=
hrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13446/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +16 other tes=
ts skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +10 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +31 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +14 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-1p-=
offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +10 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">=
i915#5354</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-cur-indfb-onoff.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-indfb-msflip-blt.html">SKIP</a> +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indf=
b-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3458">i915#3458</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb5=
65-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3023">i915#3023</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_hdmi_inject@inject-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13030">i915#13030</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_hdr@bpc-switch-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_hdr@static-toggle.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rk=
l-6/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8826">i915#8826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-7/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12394">i915#12394</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_joiner@invalid-modeset-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_pipe_b_c_ivb@disable-pipe-b-e=
nable-pipe-c.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_pipe_crc_basic@suspend-read-c=
rc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-6/igt@kms_pipe_stress@stress-xrgb8888-y=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-2/igt@kms_plane_multiple@2x-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-7/igt@kms_plane_multiple@tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_plane_scaling@2x-scaler-multi=
-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/s=
hard-dg2-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-downscale=
-factor-0-25-with-pixel-format@pipe-a.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-downscale=
-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-d:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_plane_scaling@plane-downscale=
-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +11 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_plane_scaling@plane-downscale=
-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-=
format.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with=
-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-=
format@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x=
20-with-pixel-format@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-=
format@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x=
20-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i=
915#8152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</l=
i>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-5/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13446/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12247">i915#12247</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#=
8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/98=
12">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_pm_dc@dc5-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i=
915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-5/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3828">i915#3828</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_pm_dc@dc5-retention-flops.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_pm_dc@dc6-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104"=
>i915#14104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/382=
8">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@km=
s_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@kms_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@=
kms_pm_rpm@fences-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
446/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519=
">i915#9519</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@kms_pm_rpm@modeset-pc8-residency=
-stress.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-4/igt@kms_prime@basic-crc-hybrid.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-2/igt@kms_properties@plane-properties-atomic.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/=
shard-rkl-6/igt@kms_properties@plane-properties-atomic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521">i915#=
11521</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-glk2/igt@kms_psr2_sf@fbc-pr-cursor-plane-mo=
ve-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-8/igt@kms_psr2_sf@pr-cursor-plane-move=
-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-move=
-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-8/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12316">i915#12316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_psr2_sf@psr2-primary-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-6/igt@kms_psr@fbc-psr-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-3/igt@kms_psr@fbc-psr-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9688">i915#9688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_psr@pr-cursor-mmap-cpu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-1/igt@kms_psr@psr2-cursor-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_psr@psr2-primary-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-1/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-=
90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-c=
enter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@kms_selftest@drm_framebuffer@drm_=
test_framebuffer_free.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</=
li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdm=
i-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13446/shard-rkl-4/igt@kms_vblank@ts-continuation-modeset-rpm@pipe=
-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/1311">i915#1311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@kms_vrr@flip-basic-fastset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-5/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@kms_writeback@writeback-check-ou=
tput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2437">i915#2437</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-glk5/igt@kms_writeback@writeback-check-outp=
ut.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@kms_writeback@writeback-check-o=
utput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-mtlp-7/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@kms_writeback@writeback-pixel-for=
mats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@perf@global-sseu-config.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-5/igt@perf@global-sseu-config-invalid.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@perf_pmu@module-unload.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle@vcs1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/sh=
ard-mtlp-1/igt@perf_pmu@render-node-busy-idle@vcs1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349=
</a>) +1 other test fail</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-8/igt@perf_pmu@render-node-busy-idle@vc=
s1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg1-16/igt@perf_pmu@render-node-busy-idle@vcs1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/sh=
ard-dg1-19/igt@perf_pmu@render-node-busy-idle@vcs1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-9/igt@prime_vgem@coherency-gtt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9917">i915#9917</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@sysfs_heartbeat_interval@precise@vcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/s=
hard-rkl-4/igt@sysfs_heartbeat_interval@precise@vcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14018">i915#14=
018</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@empty-block:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@drm_read@empty-block.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/sh=
ard-rkl-5/igt@drm_read@empty-block.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@fbdev@write.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#25=
82</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_134=
46/shard-rkl-8/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg1-19/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446=
/shard-dg1-17/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-2/igt@gem_exec_endless@dispatch@rcs0.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778">i=
915#3778</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13446/shard-rkl-6/igt@gem_exec_endless@dispatch@rcs0.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1850">i915#1850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13446/shard-rkl-8/igt@gem_mmap_wc@set-cache-level.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible=
.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@gem_pxp@prote=
cted-encrypted-src-copy-not-readible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13446/shard-rkl-7/igt@gem_workarounds@suspend-resume-fd.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-pread:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@i915_pm_rpm@gem-pread.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328">i915#13328</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/s=
hard-rkl-8/igt@i915_pm_rpm@gem-pread.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-3/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i91=
5#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13446/shard-rkl-8/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/10991">i915#10991</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13446/shard-mtlp-2/igt@kms_async_flips@alternate-sync-async-f=
lip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-fencing-internal-panels.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11808">i915#11808</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-mt=
lp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-interna=
l-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-tglu-3/igt@kms_atomic_transition@plane-toggle-modeset-trans=
ition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11808">i915#11808</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-tglu-10/igt@kms_atomi=
c_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13446/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html=
">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi=
-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_cursor_crc@cursor-onscre=
en-256x85@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/137=
07">i915#13707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13446/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3637">i915#3637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13446/shard-rkl-8/igt@kms_flip@wf_vblank-ts-check.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yti=
le-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@km=
s_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-=
rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.h=
tml">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8826">i915#8826</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_invalid_mode@overflow-vrefres=
h.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_invalid_mode@zero-vdisplay.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_invalid_mode@zero-v=
display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">=
i915#12388</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13446/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_plane@pixel-format.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/88=
25">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13446/shard-rkl-7/igt@kms_plane@pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@kms_plane_cursor@viewport.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i9=
15#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_plane_cursor@viewport.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@invalid-parameters.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8152">i915#8152</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_plane_scaling@invalid-param=
eters.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-=
factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-=
4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-=
factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446=
/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-=
5@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152=
">i915#8152</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13446/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-do=
wnscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl=
-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446=
/shard-rkl-3/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9519">i915#9519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13446/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wa=
it.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
521">i915#11521</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_properties@plane-proper=
ties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-snb6/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-sn=
b5/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf@polling@0-rcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@perf@polling@0-rcs0.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#129=
64</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_134=
46/shard-rkl-4/igt@perf@polling@0-rcs0.html">PASS</a> +30 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/43=
49">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13446/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-=
cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@gem_close_race@multigpu-basic-process.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/769=
7">i915#7697</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13446/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@gem_create@create-ext-cpu-access-big.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335=
">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13446/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13446/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#=
280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525"=
>i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13446/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@gem_exec_balancer@parallel-conte=
xts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3=
281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
446/shard-rkl-6/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
81">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613=
">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13446/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_lmem_swapping@parallel=
-random-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl=
-6/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html">TIMEOUT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i=
915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13446/shard-rkl-5/igt@gem_readwrite@read-bad-handle.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/84=
11">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13446/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13446/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#252=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1344=
6/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">=
i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13446/shard-rkl-3/igt@gen9_exec_parse@secure-batches.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@i915_module_load@resize-bar.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#64=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_134=
46/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412=
">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-3/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-r=
kl-6/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events-=
linear-atomic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_async_fli=
ps@async-flip-with-page-flip-events-linear-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286"=
>i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13446/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13446/shard-rkl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i9=
15#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13446/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/36=
38">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638"=
>i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13446/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg1-18/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">=
i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13446/shard-dg1-12/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">=
i915#3638</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-32bpp-rotate-180.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-b-=
hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_ccs@bad-aux-stride-4-t=
iled-mtl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_ccs@bad-pixel-form=
at-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl=
-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-cc=
s@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@k=
ms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg1-18/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi=
-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13446/shard-dg1-18/igt@kms_ccs@random-ccs-data-yf-ti=
led-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@k=
ms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#111=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i91=
5#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-8/igt@kms_content_protection@atomic.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#=
7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13446/shard-dg2-11/igt@kms_content_protection@atomic.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@kms_content_protection@mei-interface.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424=
">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13446/shard-rkl-6/igt@kms_content_protection@mei-interface.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg1-13/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/943=
3">i915#9433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13446/shard-dg1-15/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@kms_content_protection@uevent.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#=
7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13446/shard-rkl-6/igt@kms_content_protection@uevent.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13446/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1304=
9">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13446/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13446/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x1=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
446/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-l=
egacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-c=
ursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-t=
oggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915=
#9723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13446/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13446/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749"=
>i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13446/shard-rkl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i9=
15#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840"=
>i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13446/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13446/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14033">i915#14033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14350">i915#14350</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_13446/shard-snb6/igt@kms_flip@2x-flip-vs-sus=
pend-interruptible.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12817">i915#12817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-=
hdmi-a1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14033">i915#14033</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_13446/shard-snb6/igt@kms_flip@2x-flip-vs-sus=
pend-interruptible@ab-vga1-hdmi-a1.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/12817">i915#12817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-2/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">=
i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13446/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_flip@2x-wf_vblank-t=
s-check-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4ti=
le-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-5/igt@kms_fl=
ip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#=
2672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yf=
tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@km=
s_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-ms=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-7/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"=
>i915#1825</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-i=
ndfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-dg2-2/igt@km=
s_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/345=
8">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrac=
k-mmap-gtt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shr=
fb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mm=
ap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#=
5354</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprima=
ry.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13446/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-=
shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-ms=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_frontbuffer_tracking@p=
sr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354"=
>i915#5354</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_front=
buffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13446/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331">i915#=
13331</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13446/shard-dg2-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#127=
13</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3446/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713<=
/a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1=
187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12713">i915#12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13446/shard-dg1-16/igt@kms_hdr@brightness-with-hdr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394=
">i915#12394</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13446/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
394">i915#12394</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915=
#12339</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13446/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12=
339</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-2/igt@kms_mul=
tipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070">i915#4070</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#48=
16</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13446/shard-rkl-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14412">i915#14412</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane@plane-panning-bottom-=
right-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13446/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i91=
5#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-wit=
h-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scaling@pla=
ne-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8152">i915#8152</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-wit=
h-modifiers@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_plane_scal=
ing@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#1=
2247</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-wit=
h-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt=
@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12247">i915#12247</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-wit=
h-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446=
/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotatio=
n@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-=
factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_pla=
ne_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#1=
2247</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i=
915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13446/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/123=
43">i915#12343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13446/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-r=
kl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">=
i915#4281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13446/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wai=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl-8/igt@kms_psr2_sf@pr-ove=
rlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-b=
ig-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_psr2_sf@pr-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-3/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915=
#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13446/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13446/shard-rkl-4/igt@kms_psr@pr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-8/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#=
1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13446/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
72">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13446/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13446/shard-rkl-8/igt@kms_scaling_modes@scaling-mode-none.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13446/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13446/shard-rkl-7/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
446/shard-rkl-8/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13446/shard-rkl=
-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2437">i915#2437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9412">i915#9412</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13446/shard-rkl-6/igt@kms_writeback@writeback-fb-i=
d-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708=
">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13446/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8451/shard-rkl-5/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#370=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1344=
6/shard-rkl-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">=
i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8451 -&gt; IGTPW_13446</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16842: ad02e528d11b8cdc56daaa647aed319ba1d1ff03 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_13446: 13446<br />
  IGT_8451: 8451</p>

</body>
</html>

--===============4821031436378385738==--
