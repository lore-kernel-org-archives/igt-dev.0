Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61232C79FAD
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 12:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E095710E0DE;
	Wed,  9 Sep 2026 12:27:19 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C738C10E0DE;
 Wed,  9 Sep 2026 12:26:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6475378306440803664=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_Derive_write-through_ava?=
 =?utf-8?q?ilability_from_the_PAT_config_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 09 Sep 2026 12:26:33 -0000
Message-ID: <178895679379.142735.14739883827765737001@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908081728.119942-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20260908081728.119942-1-sujaritha.sundaresan@intel.com>
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

--===============6475378306440803664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Derive write-through availability from the PAT config (rev2)
URL   : https://patchwork.freedesktop.org/series/173366/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19107_full -> IGTPW_15807_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_15807_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][1] ([i915#8411]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][2] ([i915#8411])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#11078])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#7697]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@gem_basic@multigpu-create-close.html
    - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#7697]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#3555] / [i915#9323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@gem_ccs@block-copy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][7] ([i915#3555] / [i915#9323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#13008])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][10] ([i915#13356] / [i915#16348])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu-1:       NOTRUN -> [SKIP][11] ([i915#7697])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#6335])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8555])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][14] ([i915#280])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#4525]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][16] ([i915#4525]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#4525]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [FAIL][18] ([i915#15816])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#6334]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][20] ([i915#16904]) +4 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3539] / [i915#4852]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#3539])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#3539])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#3281]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-1/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#3281]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#3281]) +10 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#3281]) +10 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#4812]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-rkl:          [PASS][29] -> [ABORT][30] ([i915#15131] / [i915#15542])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-4/igt@gem_exec_suspend@basic-s3-devices.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-1/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_exec_suspend@basic-s3-devices@smem:
    - shard-rkl:          [PASS][31] -> [ABORT][32] ([i915#15542])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-4/igt@gem_exec_suspend@basic-s3-devices@smem.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-1/igt@gem_exec_suspend@basic-s3-devices@smem.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#4860]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#4613] / [i915#7582])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4613]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#4613]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@massive:
    - shard-tglu-1:       NOTRUN -> [SKIP][37] ([i915#4613]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][38] ([i915#4613]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk6/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#4613]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_mmap@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4083]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@gem_mmap@bad-size.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4077]) +8 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4083]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@gem_mmap_wc@read.html

  * igt@gem_pread@exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#14544] / [i915#3282])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][44] ([i915#2658])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4270]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@gem_pxp@display-protected-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4270]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#13398])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3282]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@gem_readwrite@beyond-eob.html

  * igt@gem_readwrite@read-write:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3282]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@gem_readwrite@read-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#3282])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@gem_readwrite@read-write.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#8428])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#5190] / [i915#8428]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4079]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4079]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@gem_tiled_pread_pwrite.html
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#3282]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4079]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-7/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiled_wb:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4077]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@gem_tiled_wb.html

  * igt@gem_userptr_blits@access-control:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#3297]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-5/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#3297]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#3297]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][61] ([i915#3297]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3297] / [i915#4880])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3297] / [i915#4880]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3297]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3297]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          NOTRUN -> [INCOMPLETE][66] ([i915#13356] / [i915#14586])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk8/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][67] ([i915#2527] / [i915#2856]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-large:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#2856])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#2527]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#2527]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#2527] / [i915#2856]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#2856]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#14123])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@i915_drm_fdinfo@all-busy-check-all.html
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#14123])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@busy@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#14073]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@i915_drm_fdinfo@busy@rcs0.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#14118])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-tglu-1:       NOTRUN -> [SKIP][77] ([i915#15479]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-tglu-1:       NOTRUN -> [ABORT][78] ([i915#15342]) +1 other test abort
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@load:
    - shard-tglu:         ([PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97]) -> ([PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [SKIP][116]) ([i915#17009])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-4/igt@i915_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-7/igt@i915_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-3/igt@i915_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-4/igt@i915_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-3/igt@i915_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-8/igt@i915_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-3/igt@i915_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-2/igt@i915_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-4/igt@i915_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-2/igt@i915_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-8/igt@i915_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-5/igt@i915_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-2/igt@i915_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-7/igt@i915_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-8/igt@i915_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-5/igt@i915_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-10/igt@i915_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-7/igt@i915_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-10/igt@i915_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@i915_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@i915_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@i915_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@i915_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@i915_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@i915_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@i915_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@i915_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@i915_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@i915_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@i915_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@i915_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@i915_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@i915_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@i915_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@i915_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@i915_module_load@load.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#14544] / [i915#6412])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#8399])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][119] -> [INCOMPLETE][120] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#16080] / [i915#16166])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#14498])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          NOTRUN -> [INCOMPLETE][123] ([i915#13356] / [i915#15172])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#11681])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@i915_pm_rps@thresholds.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#16109])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@i915_query@query-topology-known-pci-ids.html
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#16109])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@i915_query@query-topology-known-pci-ids.html
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#16109])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@i915_query@query-topology-known-pci-ids.html
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#16109])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@i915_query@query-topology-known-pci-ids.html
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#16109])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu-1:       NOTRUN -> [SKIP][130] ([i915#5723])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][131] ([i915#16182] / [i915#4817])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk11/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][132] ([i915#16182] / [i915#4817])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk4/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#7707])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#4212])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4212])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][136] ([i915#14888]) +5 other tests fail
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][137] ([i915#12761]) +1 other test incomplete
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#3555])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#9531])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#9531])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [ABORT][141] ([i915#16866]) +1 other test abort
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk11:        NOTRUN -> [SKIP][142] ([i915#1769])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4538] / [i915#5286]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#5286])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#5286]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#14544] / [i915#5286])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#5286]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#5286]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#3828])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#3828])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#3828])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][152] +8 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#3638]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4538] / [i915#5190]) +6 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#3638]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#14544]) +7 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#5190])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][158] +79 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#4538]) +8 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#6095]) +14 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#12313]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#12313]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#10307] / [i915#6095]) +88 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#6095]) +29 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#6095]) +60 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#6095]) +152 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#12805])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#12805])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#12805])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#12805])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#12805])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#14098] / [i915#14544] / [i915#6095]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][174] ([i915#15582]) +1 other test incomplete
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#6095]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6095]) +79 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#12313]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#14098] / [i915#6095]) +41 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#14544] / [i915#6095]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#12313]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#12313]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#12313])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#13781]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#11151])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-1/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#11151])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#11151])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#11151])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#11151])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#11151] / [i915#7828]) +8 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#11151] / [i915#7828]) +9 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#16471])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#16471])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#16471]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#16471])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#11151] / [i915#14544] / [i915#7828])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#11151] / [i915#7828]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_chamelium_frames@dp-frame-dump.html
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#11151] / [i915#7828])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#11151] / [i915#7828]) +7 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#11151] / [i915#7828]) +6 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#15865])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#15330] / [i915#3116] / [i915#3299]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#15330])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#15330])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#15330])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#15330]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#15865]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#15865]) +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_content_protection@legacy-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#15865]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#15865]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#3555])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#14544] / [i915#3555])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu-1:       NOTRUN -> [FAIL][212] ([i915#13566]) +1 other test fail
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html
    - shard-rkl:          [PASS][213] -> [FAIL][214] ([i915#13566])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][215] ([i915#13566])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#3555]) +7 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#13049])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#13049])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][219] ([i915#3555]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][220] ([i915#13049])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][221] +540 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk1/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#13049])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#3555]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][224] ([i915#12358] / [i915#14152] / [i915#7882])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][225] ([i915#12358] / [i915#14152])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][226] ([i915#12358] / [i915#14152]) +1 other test incomplete
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#4103]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#13046] / [i915#5354]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#9809])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#9067])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#9067])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#9723])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#13749])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#16867])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#8812])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#16361]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#16361]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][238] ([i915#16361])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#16361]) +4 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#16361]) +5 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#16361])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#16680])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#16680])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#16680]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#16084])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#16084])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#16081])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#658])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#658])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_feature_discovery@psr1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#658])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#658])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#658])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_feature_discovery@vrr:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#16600])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_feature_discovery@vrr.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#4881])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#3637] / [i915#9934]) +5 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#9934]) +7 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#3637] / [i915#9934]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#3637] / [i915#9934]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu-1:       NOTRUN -> [SKIP][259] ([i915#9934])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#8381]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#9934]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#9934]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][263] -> [INCOMPLETE][264] ([i915#16276] / [i915#6113]) +1 other test incomplete
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][265] ([i915#12745] / [i915#4839])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][266] ([i915#12745])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#15643] / [i915#5190]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#15643]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#15643]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#15643]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#15643]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#15643]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#15990] / [i915#8708]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#15990] / [i915#8708]) +11 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#1825]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#15991] / [i915#1825]) +9 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-tglu-1:       NOTRUN -> [SKIP][277] +53 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][278] +83 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][279] ([i915#10056] / [i915#16593])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#5439])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#15989]) +6 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [PASS][282] -> [SKIP][283] ([i915#15989]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#15989]) +17 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          [PASS][285] -> [SKIP][286] +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#15991]) +10 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#15990]) +5 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][289] ([i915#16056] / [i915#16593])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#15989]) +21 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#15989]) +11 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#15989]) +12 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#14544] / [i915#15102]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#15104] / [i915#15990]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#15102]) +36 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#15991] / [i915#5354]) +15 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#15102]) +22 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#15102]) +39 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk11:        NOTRUN -> [SKIP][299] +94 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#5439])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#15990]) +25 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#15989]) +9 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#15102]) +16 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][304] +117 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#15990] / [i915#8708]) +17 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#15102]) +53 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#15991]) +21 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-glk10:        NOTRUN -> [SKIP][308] +95 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#16644] / [i915#3555] / [i915#8228])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#3555] / [i915#8228]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#16518] / [i915#3555] / [i915#8228])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#3555] / [i915#8228])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#14544] / [i915#15459])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#15458]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#15458])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_joiner@basic-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#15458])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#15458])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_joiner@basic-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#15458])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_joiner@basic-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#15458])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#15638] / [i915#15722])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#15815])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][322] ([i915#6301])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#6301])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#6301])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [PASS][325] -> [INCOMPLETE][326] ([i915#12756] / [i915#13476])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc.html
    - shard-glk10:        NOTRUN -> [INCOMPLETE][327] ([i915#12756] / [i915#13409] / [i915#13476])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][328] ([i915#13476])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][329] ([i915#13409] / [i915#13476])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk:          NOTRUN -> [DMESG-WARN][330] ([i915#118])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-glk11:        NOTRUN -> [DMESG-WARN][331] ([i915#118])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#14712])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#14712])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][334] ([i915#118])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][335] ([i915#15709]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#15709])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#15709]) +4 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#14544] / [i915#15709])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#16386]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#15709]) +6 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#15709]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#16386]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][343] ([i915#16386]) +3 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#16386]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#15709]) +2 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#16112])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#16112])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [PASS][348] -> [INCOMPLETE][349] ([i915#14412]) +1 other test incomplete
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-glk:          NOTRUN -> [INCOMPLETE][350] ([i915#13026]) +1 other test incomplete
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-5:
    - shard-tglu:         [PASS][351] -> [ABORT][352] ([i915#16866]) +1 other test abort
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-5.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-5.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][353] ([i915#13958])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#13958])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#13958])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#13958])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#13958])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][358] ([i915#14259])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#14259])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#13046] / [i915#5354] / [i915#9423])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][361] ([i915#15329]) +3 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
    - shard-tglu-1:       NOTRUN -> [SKIP][362] ([i915#15329]) +4 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#15329]) +9 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#15329]) +9 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][365] ([i915#15329] / [i915#3555] / [i915#6953])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][366] ([i915#15329]) +3 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#12343] / [i915#5354])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#12343] / [i915#5354])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][369] ([i915#12343] / [i915#9812]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-dg1:          NOTRUN -> [SKIP][370] ([i915#9685])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#15948])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#15948])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#15948])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][374] ([i915#15739])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][375] ([i915#9340])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#8430])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [PASS][377] -> [SKIP][378] ([i915#15073])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          [PASS][379] -> [SKIP][380] ([i915#15073])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#15073])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][382] -> [SKIP][383] ([i915#15073])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#15073])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#6524])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#11520] / [i915#14544])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk10:        NOTRUN -> [SKIP][387] ([i915#11520]) +2 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#11520]) +3 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
    - shard-tglu-1:       NOTRUN -> [SKIP][389] ([i915#11520]) +2 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][390] ([i915#11520]) +12 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][391] ([i915#11520]) +6 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][392] ([i915#11520]) +9 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][393] ([i915#11520]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-snb5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][394] ([i915#12316])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][395] ([i915#11520]) +10 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-glk11:        NOTRUN -> [SKIP][396] ([i915#11520]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][397] ([i915#9683])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][398] ([i915#9683])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][399] ([i915#9732]) +11 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][400] ([i915#9732]) +26 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][401] ([i915#9688]) +6 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-1/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-rkl:          NOTRUN -> [SKIP][402] ([i915#1072] / [i915#14544] / [i915#9732])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-primary-render:
    - shard-dg2:          NOTRUN -> [SKIP][403] ([i915#1072] / [i915#9732]) +12 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][404] ([i915#1072] / [i915#9732]) +26 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#1072] / [i915#9732]) +20 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_psr@psr2-sprite-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][406] ([i915#4077] / [i915#9688]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-1/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][407] ([i915#15949])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#15949])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk:          NOTRUN -> [INCOMPLETE][409] ([i915#15492] / [i915#16184]) +1 other test incomplete
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk1/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][410] ([i915#15500] / [i915#16184])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][411] ([i915#5289])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][412] ([i915#5289]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][413] ([i915#14544] / [i915#5289])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][414] ([i915#5289])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][415] ([i915#13179]) +1 other test abort
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_selftest@drm_framebuffer.html
    - shard-dg1:          NOTRUN -> [ABORT][416] ([i915#13179] / [i915#16508]) +1 other test abort
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][417] ([i915#13179]) +1 other test abort
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][418] ([i915#3555]) +3 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-snb:          NOTRUN -> [SKIP][419] +107 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-snb7/igt@kms_tv_load_detect@load-detect.html
    - shard-mtlp:         NOTRUN -> [SKIP][420] +4 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [PASS][421] -> [INCOMPLETE][422] ([i915#12276]) +1 other test incomplete
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][423] ([i915#12276]) +1 other test incomplete
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][424] ([i915#9906])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][425] ([i915#3555] / [i915#8808])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-5/igt@kms_vrr@flipline.html
    - shard-dg2:          NOTRUN -> [SKIP][426] ([i915#15243] / [i915#3555])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-1/igt@kms_vrr@flipline.html
    - shard-rkl:          NOTRUN -> [SKIP][427] ([i915#15243] / [i915#3555]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][428] ([i915#3555] / [i915#9906])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][429] ([i915#9906])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][430] ([i915#2434])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@perf@mi-rpc.html
    - shard-rkl:          NOTRUN -> [SKIP][431] ([i915#2434])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@perf@mi-rpc.html
    - shard-dg1:          NOTRUN -> [SKIP][432] ([i915#2434])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@perf@mi-rpc.html
    - shard-mtlp:         NOTRUN -> [SKIP][433] ([i915#2434])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][434] ([i915#2435])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][435] ([i915#4349]) +4 other tests fail
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@module-unload:
    - shard-glk:          NOTRUN -> [ABORT][436] ([i915#15778])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk2/igt@perf_pmu@module-unload.html
    - shard-dg1:          NOTRUN -> [ABORT][437] ([i915#13029] / [i915#15778])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@perf_pmu@module-unload.html
    - shard-tglu:         NOTRUN -> [ABORT][438] ([i915#15778])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu-1:       NOTRUN -> [SKIP][439] ([i915#8516])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html
    - shard-dg1:          NOTRUN -> [SKIP][440] ([i915#8516])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [PASS][441] -> [INCOMPLETE][442] ([i915#13520])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-8/igt@perf_pmu@rc6-suspend.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@perf_pmu@rc6-suspend.html

  * igt@prime_udl@share-import:
    - shard-dg2:          NOTRUN -> [SKIP][443] ([i915#16420])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg1:          NOTRUN -> [SKIP][444] ([i915#3708])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][445] ([i915#13356] / [i915#16348]) -> [PASS][446]
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_exec_big@single:
    - shard-mtlp:         [FAIL][447] ([i915#15871]) -> [PASS][448]
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-mtlp-7/igt@gem_exec_big@single.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-5/igt@gem_exec_big@single.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][449] ([i915#13356]) -> [PASS][450] +1 other test pass
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_pm_rps@reset:
    - shard-mtlp:         [FAIL][451] ([i915#15365]) -> [PASS][452]
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-mtlp-6/igt@i915_pm_rps@reset.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-5/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [INCOMPLETE][453] ([i915#16182] / [i915#4817]) -> [PASS][454] +1 other test pass
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-glk9/igt@i915_suspend@debugfs-reader.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk9/igt@i915_suspend@debugfs-reader.html
    - shard-rkl:          [INCOMPLETE][455] ([i915#4817]) -> [PASS][456]
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@i915_suspend@debugfs-reader.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][457] ([i915#12761]) -> [PASS][458]
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][459] ([i915#15733] / [i915#5138]) -> [PASS][460]
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          [DMESG-WARN][461] ([i915#4423]) -> [PASS][462] +4 other tests pass
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg1-16/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         [FAIL][463] ([i915#13566]) -> [PASS][464] +3 other tests pass
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-dg1:          [FAIL][465] ([i915#15999]) -> [PASS][466]
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg1-14/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
    - shard-snb:          [FAIL][467] ([i915#14600]) -> [PASS][468] +1 other test pass
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-snb4/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-snb6/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg1:          [ABORT][469] ([i915#16866] / [i915#16932] / [i915#4423]) -> [PASS][470]
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg1-19/igt@kms_flip_tiling@flip-change-tiling.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-4-y-rc-ccs-to-y-rc-ccs:
    - shard-dg1:          [ABORT][471] ([i915#16866] / [i915#16932]) -> [PASS][472]
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg1-19/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-4-y-rc-ccs-to-y-rc-ccs.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-4-y-rc-ccs-to-y-rc-ccs.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][473] ([i915#15989]) -> [PASS][474] +4 other tests pass
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [SKIP][475] -> [PASS][476] +6 other tests pass
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-tglu:         [DMESG-FAIL][477] ([i915#16772]) -> [PASS][478]
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-3/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-rkl:          [ABORT][479] ([i915#16866]) -> [PASS][480]
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-4/igt@kms_plane_lowres@tiling-x.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][481] ([i915#15073]) -> [PASS][482]
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][483] ([i915#15073]) -> [PASS][484]
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [INCOMPLETE][485] ([i915#13356] / [i915#14242] / [i915#16236]) -> [PASS][486]
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-glk4/igt@perf_pmu@rc6-suspend.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk6/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          [SKIP][487] ([i915#8411]) -> [SKIP][488] ([i915#14544] / [i915#8411])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-3/igt@api_intel_bb@blit-reloc-keep-cache.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][489] ([i915#9323]) -> [SKIP][490] ([i915#14544] / [i915#9323])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_eio@kms:
    - shard-rkl:          [ABORT][491] ([i915#13363] / [i915#16837] / [i915#16931]) -> [ABORT][492] ([i915#16837] / [i915#16931])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-5/igt@gem_eio@kms.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@gem_eio@kms.html
    - shard-dg1:          [ABORT][493] ([i915#16837] / [i915#16866] / [i915#16931]) -> [ABORT][494] ([i915#16931])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg1-15/igt@gem_eio@kms.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@gem_eio@kms.html
    - shard-tglu:         [ABORT][495] ([i915#13363] / [i915#16837] / [i915#16866]) -> [ABORT][496] ([i915#16837])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-2/igt@gem_eio@kms.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          [SKIP][497] ([i915#14544] / [i915#4525]) -> [SKIP][498] ([i915#4525]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          [SKIP][499] ([i915#4525]) -> [SKIP][500] ([i915#14544] / [i915#4525])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          [SKIP][501] ([i915#14544] / [i915#3281]) -> [SKIP][502] ([i915#3281]) +3 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          [SKIP][503] ([i915#14544] / [i915#2190]) -> [SKIP][504] ([i915#2190])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@gem_huc_copy@huc-copy.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          [SKIP][505] ([i915#4613]) -> [SKIP][506] ([i915#14544] / [i915#4613]) +1 other test skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-random.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          [SKIP][507] ([i915#14544] / [i915#3282]) -> [SKIP][508] ([i915#3282]) +1 other test skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-rkl:          [SKIP][509] ([i915#14544] / [i915#15656]) -> [SKIP][510] ([i915#15656])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@gem_tiled_pread_basic@basic.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          [SKIP][511] ([i915#3281] / [i915#3297]) -> [SKIP][512] ([i915#14544] / [i915#3281] / [i915#3297])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-3/igt@gem_userptr_blits@relocations.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@gem_userptr_blits@relocations.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          [SKIP][513] ([i915#14544] / [i915#2527]) -> [SKIP][514] ([i915#2527])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-rkl:          [SKIP][515] ([i915#2527]) -> [SKIP][516] ([i915#14544] / [i915#2527])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-4/igt@gen9_exec_parse@unaligned-access.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          [SKIP][517] ([i915#14544] / [i915#15479]) -> [SKIP][518] ([i915#15479]) +4 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][519] ([i915#14544] / [i915#8399]) -> [SKIP][520] ([i915#8399]) +1 other test skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][521] ([i915#14544] / [i915#4387]) -> [SKIP][522] ([i915#4387])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-unsupported:
    - shard-rkl:          [SKIP][523] ([i915#14544] / [i915#16079]) -> [SKIP][524] ([i915#16079])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@i915_query@query-topology-unsupported.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@i915_query@query-topology-unsupported.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][525] ([i915#5286]) -> [SKIP][526] ([i915#14544] / [i915#5286])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][527] ([i915#14544] / [i915#5286]) -> [SKIP][528] ([i915#5286])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][529] ([i915#3638]) -> [SKIP][530] ([i915#14544] / [i915#3638]) +2 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-rkl:          [SKIP][531] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][532] ([i915#14098] / [i915#6095]) +6 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][533] ([i915#14544] / [i915#6095]) -> [SKIP][534] ([i915#6095]) +3 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][535] ([i915#12313]) -> [SKIP][536] ([i915#12313] / [i915#14544])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][537] ([i915#14098] / [i915#6095]) -> [SKIP][538] ([i915#14098] / [i915#14544] / [i915#6095]) +8 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][539] ([i915#6095]) -> [SKIP][540] ([i915#14544] / [i915#6095]) +6 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-rkl:          [SKIP][541] ([i915#11151] / [i915#14544]) -> [SKIP][542] ([i915#11151])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-after-suspend.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-rkl:          [SKIP][543] ([i915#14544] / [i915#16471]) -> [SKIP][544] ([i915#16471])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-rkl:          [SKIP][545] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][546] ([i915#11151] / [i915#7828]) +4 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-rkl:          [SKIP][547] ([i915#11151] / [i915#7828]) -> [SKIP][548] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][549] ([i915#15865]) -> [SKIP][550] ([i915#9433])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg1-15/igt@kms_content_protection@mei-interface.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          [SKIP][551] ([i915#14544] / [i915#15865]) -> [SKIP][552] ([i915#15865])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_content_protection@uevent.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          [SKIP][553] ([i915#14544] / [i915#3555]) -> [SKIP][554] ([i915#3555])
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          [SKIP][555] ([i915#13049] / [i915#14544]) -> [SKIP][556] ([i915#13049])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          [SKIP][557] ([i915#4103]) -> [SKIP][558] ([i915#14544] / [i915#4103])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          [SKIP][559] ([i915#14544] / [i915#16361]) -> [SKIP][560] ([i915#16361])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-rkl:          [SKIP][561] ([i915#16361]) -> [SKIP][562] ([i915#14544] / [i915#16361])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_feature_discovery@vrr:
    - shard-rkl:          [SKIP][563] ([i915#16600]) -> [SKIP][564] ([i915#14544] / [i915#16600])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-2/igt@kms_feature_discovery@vrr.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-rkl:          [SKIP][565] ([i915#14544] / [i915#9934]) -> [SKIP][566] ([i915#9934]) +2 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][567] ([i915#14544] / [i915#15643]) -> [SKIP][568] ([i915#15643]) +1 other test skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-rkl:          [SKIP][569] ([i915#15643]) -> [SKIP][570] ([i915#14544] / [i915#15643]) +1 other test skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-2/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][571] ([i915#1825]) -> [SKIP][572] ([i915#14544] / [i915#1825]) +2 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          [SKIP][573] ([i915#15989] / [i915#4423]) -> [SKIP][574] ([i915#15989])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][575] ([i915#14544] / [i915#15102]) -> [SKIP][576] ([i915#15102]) +15 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          [SKIP][577] ([i915#15990] / [i915#4423] / [i915#8708]) -> [SKIP][578] ([i915#15990] / [i915#8708])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][579] ([i915#15102]) -> [SKIP][580] ([i915#14544] / [i915#15102]) +16 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][581] ([i915#14544]) -> [SKIP][582] +22 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg1:          [SKIP][583] ([i915#4423]) -> [SKIP][584]
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg1:          [SKIP][585] ([i915#15102] / [i915#4423]) -> [SKIP][586] ([i915#15102])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][587] ([i915#14544] / [i915#1825]) -> [SKIP][588] ([i915#1825]) +5 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][589] -> [SKIP][590] ([i915#14544]) +28 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [ABORT][591] ([i915#15132]) -> [SKIP][592] ([i915#16644] / [i915#3555] / [i915#8228])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][593] ([i915#1187] / [i915#12713] / [i915#16490]) -> [SKIP][594] ([i915#12713] / [i915#16490])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          [SKIP][595] ([i915#15460]) -> [SKIP][596] ([i915#14544] / [i915#15460])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-7/igt@kms_joiner@invalid-modeset-big-joiner.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          [SKIP][597] ([i915#14544] / [i915#15459]) -> [SKIP][598] ([i915#15459])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          [SKIP][599] ([i915#15458]) -> [SKIP][600] ([i915#14544] / [i915#15458])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-rkl:          [SKIP][601] ([i915#14544] / [i915#16451]) -> [SKIP][602] ([i915#16451])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_mst@mst-suspend-read-crc.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          [SKIP][603] ([i915#14712]) -> [SKIP][604] ([i915#14544] / [i915#14712])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-rkl:          [SKIP][605] ([i915#15709]) -> [SKIP][606] ([i915#14544] / [i915#15709])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-rkl:          [SKIP][607] ([i915#13958]) -> [SKIP][608] ([i915#13958] / [i915#14544])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-none.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][609] ([i915#15329]) -> [SKIP][610] ([i915#14544] / [i915#15329]) +3 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          [SKIP][611] ([i915#14544] / [i915#6524]) -> [SKIP][612] ([i915#6524])
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][613] ([i915#11520]) -> [SKIP][614] ([i915#11520] / [i915#14544]) +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][615] ([i915#11520] / [i915#14544]) -> [SKIP][616] ([i915#11520])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr-primary-render:
    - shard-rkl:          [SKIP][617] ([i915#1072] / [i915#9732]) -> [SKIP][618] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-5/igt@kms_psr@psr-primary-render.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-rkl:          [SKIP][619] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][620] ([i915#1072] / [i915#9732]) +4 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_psr@psr2-sprite-render.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          [SKIP][621] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][622] ([i915#15243] / [i915#3555])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@kms_vrr@flip-basic.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][623] ([i915#15243] / [i915#3555]) -> [SKIP][624] ([i915#14544] / [i915#15243] / [i915#3555])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-7/igt@kms_vrr@flip-dpms.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          [SKIP][625] ([i915#9906]) -> [SKIP][626] ([i915#14544] / [i915#9906])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-vrr.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][627] ([i915#14544] / [i915#2436]) -> [SKIP][628] ([i915#2436])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          [ABORT][629] ([i915#15778]) -> [ABORT][630] ([i915#13029] / [i915#15778])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-dg2-5/igt@perf_pmu@module-unload.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          [SKIP][631] ([i915#3708]) -> [SKIP][632] ([i915#14544] / [i915#3708])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-rkl-3/igt@prime_vgem@fence-read-hang.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@prime_vgem@fence-read-hang.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#15999]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15999
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16508
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16772]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16772
  [i915#16837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
  [i915#16866]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16931
  [i915#16932]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16932
  [i915#17009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17009
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9086 -> IGTPW_15807
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_19107: 5cb17454a3e04fcc1133d87451c9c582c297e92d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15807: 15807
  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/index.html

--===============6475378306440803664==
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
<tr><td><b>Series:</b></td><td>Derive write-through availability from the P=
AT config (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/173366/">https://patchwork.freedesktop.org/series/173366/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15807/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15807/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19107_full -&gt; IGTPW_15807_full<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/index=
.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15807_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cac=
he.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@api_intel_bb@object-reloc-keep-c=
ache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7697">i915#7697</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@gem_basic@multigpu-create-close=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@gem_ccs@block-copy-compressed.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@gem_ccs@block-copy-compressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@gem_ccs@large-ctrl-surf-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_ccs@suspend-resume.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/93=
23">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@gem_ccs@suspend-resume@tile64-com=
pressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#163=
48</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gem_close_race@multigpu-basic-pr=
ocess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-hos=
tile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_exec_balancer@parallel.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-=
in-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@gem_exec_balancer@parallel-orde=
ring.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@gem_exec_big@single.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1581=
6">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@gem_exec_capture@capture-invisib=
le@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@gem_exec_capture@capture@vecs0-lm=
em0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16904">i915#16904</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@gem_exec_flush@basic-batch-kerne=
l-default-cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@gem_exec_flush@basic-uc-prw-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@gem_exec_flush@basic-uc-set-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-1/igt@gem_exec_reloc@basic-concurrent0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@gem_exec_reloc@basic-cpu-noreloc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-norel=
oc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@gem_exec_reloc@basic-wc-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@gem_exec_schedule@preempt-queue-=
contexts-chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-4/igt@gem_exec_suspend@basic-s3-devices.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/s=
hard-rkl-1/igt@gem_exec_suspend@basic-s3-devices.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#151=
31</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15542">i915#15542</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices@smem:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-4/igt@gem_exec_suspend@basic-s3-devices@smem.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15=
807/shard-rkl-1/igt@gem_exec_suspend@basic-s3-devices@smem.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542">=
i915#15542</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@gem_fence_thrash@bo-write-verify=
-threaded-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-m=
ulti.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gem_lmem_swapping@massive.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk6/igt@gem_lmem_swapping@massive-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4613">i915#4613</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_lmem_swapping@random-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@gem_mmap@bad-size.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@gem_mmap_gtt@cpuset-big-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4077">i915#4077</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@gem_mmap_wc@read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@gem_pread@exhaustion.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3282">i915#3282</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@gem_pread@exhaustion.html">WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/265=
8">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@gem_pxp@display-protected-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4270">i915#4270</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@gem_pxp@display-protected-crc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@gem_readwrite@beyond-eob.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@gem_readwrite@read-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@gem_readwrite@read-write.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-6/igt@gem_render_copy@yf-tiled-ccs-to-=
y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@gem_render_copy@yf-tiled-to-vebox=
-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@gem_set_tiling_vs_pwrite.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4079">i915#4079</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@gem_tiled_pread_pwrite.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
79">i915#4079</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@gem_tiled_pread_pwrite.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-7/igt@gem_tiled_pread_pwrite.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_wb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@gem_tiled_wb.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4=
077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-5/igt@gem_userptr_blits@access-control=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@gem_userptr_blits@coherency-unsy=
nc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@gem_userptr_blits@dmabuf-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-o=
ffset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@gem_userptr_blits@map-fixed-inval=
idate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@gem_userptr_blits@map-fixed-inva=
lidate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk8/igt@gem_workarounds@suspend-resume-fd.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@gen9_exec_parse@allowed-single.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@gen9_exec_parse@bb-large.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@gen9_exec_parse@bb-oversize.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@gen9_exec_parse@bb-start-param.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@gen9_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@gen9_exec_parse@valid-registers.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@i915_drm_fdinfo@all-busy-check-al=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@i915_drm_fdinfo@all-busy-check-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@i915_drm_fdinfo@busy@rcs0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@i915_drm_fdinfo@virtual-busy-han=
g-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@i915_module_load@fault-injection=
@__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@i915_module_load@fault-injection=
@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abo=
rt</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_19107/shard-tglu-4/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-7/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_19107/shard-tglu-3/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/=
shard-tglu-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-3/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_19107/shard-tglu-8/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-3/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_19107/shard-tglu-2/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/=
shard-tglu-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-2/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_19107/shard-tglu-8/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-5/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_19107/shard-tglu-2/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/=
shard-tglu-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-8/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_19107/shard-tglu-5/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107/shard-tglu-10/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_19107/shard-tglu-7/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19107=
/shard-tglu-10/igt@i915_module_load@load.html">PASS</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_15807/shard-tglu-2/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tgl=
u-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
5807/shard-tglu-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_15807/shard-tglu-3/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-5/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807=
/shard-tglu-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15807/shard-tglu-5/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/sha=
rd-tglu-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_15807/shard-tglu-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_15807/shard-tglu-7/igt@i915_module_load@load.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1700=
9">i915#17009</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@i915_module_load@resize-bar.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/s=
hard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@i915_pm_rc6_residency@media-rc6-=
accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15172">i915#15172</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@i915_pm_rps@thresholds.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@i915_query@query-topology-known-=
pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@i915_query@query-topology-known-=
pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@i915_query@query-topology-known-=
pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@i915_query@query-topology-known-p=
ci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@i915_query@query-topology-known-p=
ci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk11/igt@i915_suspend@basic-s3-without-i91=
5.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk4/igt@i915_suspend@forcewake.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16182">i915#16182</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@intel_hwmon@hwmon-write.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_addfb_basic@addfb25-framebuff=
er-vs-set-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_addfb_basic@clobberred-modif=
ier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk8/igt@kms_async_flips@alternate-sync-asy=
nc-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +5 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_async_flips@async-flip-suspen=
d-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hd=
mi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing@pipe-b-hdmi-a-1.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i915#16866</a>) =
+1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_atomic_transition@plane-all-m=
odeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_big_fb@4-tiled-16bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_big_fb@4-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-off=
set-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_big_fb@linear-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-2=
70.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_big_fb@y-tiled-8bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_big_fb@yf-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4538">i915#4538</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@kms_ccs@bad-aux-stride-yf-tiled-=
ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled=
-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled=
-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +60 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-=
yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +152 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-til=
ed-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-=
1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +79 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +41 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_ccs@random-ccs-data-4-tiled=
-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-=
hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-1/igt@kms_chamelium_audio@hdmi-audio-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_chamelium_audio@hdmi-audio-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-a=
fter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_chamelium_audio@hdmi-audio-a=
fter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-6/igt@kms_chamelium_audio@hdmi-audio-a=
fter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_chamelium_color_pipeline@pla=
ne-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-singl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_chamelium_frames@dp-frame-dum=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@kms_chamelium_frames@dp-frame-du=
mp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-mu=
ltiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-for-eac=
h-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_content_protection@dp-mst-typ=
e-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_content_protection@dp-mst-ty=
pe-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_content_protection@dp-mst-t=
ype-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_content_protection@legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_content_protection@legacy-hdc=
p14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_content_protection@legacy-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-3=
2x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-3=
2x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-2=
56x85.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_158=
07/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i91=
5#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-25=
6x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-3=
2x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk1/igt@kms_cursor_crc@cursor-random-max-s=
ize.html">SKIP</a> +540 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_cursor_crc@cursor-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_cursor_crc@cursor-suspend@pip=
e-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend@pip=
e-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>) +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flip=
b-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test s=
kip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_dsc@dsc-basic-ultrajoiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_dsc@dsc-with-output-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_dsc@dsc-with-output-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-6/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_fbcon_fbt@psr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680=
">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16680">i915#16680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16680">i915#16680</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@kms_feature_discovery@chamelium.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16084">i915#16084</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_feature_discovery@chamelium.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16084">i915#16084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_feature_discovery@display-2x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_feature_discovery@psr1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_feature_discovery@psr1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_feature_discovery@vrr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_fence_pin_leak.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881"=
>i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_flip@2x-flip-vs-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9934">i915#9934</a>) +7 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@kms_flip@2x-flip-vs-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_flip@2x-flip-vs-modeset-vs-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-=
3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#611=
3</a>) +1 other test incomplete</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk4/igt@kms_flip@flip-vs-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190=
</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-1p-=
indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)=
 +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +9=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-spr-indfb-fullscreen.html">SKIP</a> +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10056">i915#10056</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-=
1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-c=
ur-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_frontbuffer_tracking@fb=
chdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_frontbuffer_tracking@fbchdr=
-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +17 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pr=
i-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_15807/shard-glk1/igt@kms_frontbuffer_tracking@fbc=
hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-=
2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-r=
gb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15990">i915#15990</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-su=
spend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16056">i915#16056</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-t=
iling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15989">i915#15989</a>) +21 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-=
tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_frontbuffer_tracking@fbchdr-=
tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15989">i915#15989</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +36 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +22 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +39 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-blt:</=
p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-1p-=
offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +25 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-r=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15102">i915#15102</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-render.html">SKIP</a> +117 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb=
101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +17 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +53 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_hdr@bpc-switch.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644"=
>i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-4/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518=
">i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15458">i915#15458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_joiner@basic-ultra-joiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15458">i915#15458</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_joiner@basic-ultra-joiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15458">i915#15458</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15458">i915#15458</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15458">i915#15458</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_panel_fitting@legacy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807=
/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i=
915#12756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13476">i915#13476</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-c=
rc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-c=
rc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-c=
rc@pipe-b-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-xt=
iled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_pipe_stress@stress-xrgb8888-y=
ftiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/118">i915#118</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-y=
ftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk9/igt@kms_pipe_stress@stress-xrgb8888-yt=
iled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-7/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-ln=
l-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mo=
difier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-mo=
difier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15709">i915#15709</a>) +6 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-12/igt@kms_plane@pixel-format-x-tiled-m=
odifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:=
</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@kms_plane@pixel-format-y-tiled-m=
odifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-2/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right-suspend@=
pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15807/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspe=
nd@pipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14412">i915#14412</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk6/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend@pipe-b.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomp=
lete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-5:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-tglu-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-pl=
ane-5.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_15807/shard-tglu-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-=
plane-5.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16866">i915#16866</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_plane_multiple@2x-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_plane_multiple@2x-tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_plane_multiple@tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-1/igt@kms_plane_scaling@2x-scaler-multi=
-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-un=
ity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other te=
sts skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-u=
nity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other te=
sts skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i91=
5#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-10/igt@kms_pm_backlight@fade-with-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9812">i915#9812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_pm_dc@dc5-pageflip-negative.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">=
i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739=
">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340=
">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807=
/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15=
073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-=
19/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-d=
g2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk10/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_psr2_sf@pr-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-snb5/igt@kms_psr2_sf@pr-primary-plane-updat=
e-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12316">i915#12316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-15/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_psr2_sf@psr2-primary-plane-up=
date-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@kms_psr@fbc-psr2-primary-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) +26 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-1/igt@kms_psr@fbc-psr2-primary-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9688">i915#9688</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-8/igt@kms_psr@pr-primary-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_psr@psr-cursor-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-1/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4077">i915#4077</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-7/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk1/igt@kms_rotation_crc@multiplane-rotati=
on.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15492">i915#15492</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16184">i915#16184</a>) +1 other test incom=
plete</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk11/igt@kms_rotation_crc@multiplane-rotat=
ion-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_selftest@drm_framebuffer.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16508">i915#16508</a>) +1 other test abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk5/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_setmode@basic-clone-single-cr=
tc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-snb7/igt@kms_tv_load_detect@load-detect.htm=
l">SKIP</a> +107 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-7/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
5807/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk3/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_vrr@flip-basic-fastset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-5/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8808">i915#8808</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-1/igt@kms_vrr@flipline.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i=
915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_vrr@flipline.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i=
915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-3/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-3/igt@perf@mi-rpc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#24=
34</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@perf@mi-rpc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#24=
34</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@perf@mi-rpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2=
434</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@perf@mi-rpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2=
434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-glk2/igt@perf_pmu@module-unload.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
778">i915#15778</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@perf_pmu@module-unload.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13029">i915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15778">i915#15778</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-5/igt@perf_pmu@module-unload.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/851=
6">i915#8516</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@perf_pmu@rc6-all-gts.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/851=
6">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-8/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/ig=
t@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg2-6/igt@prime_udl@share-import.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@prime_vgem@basic-fence-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-comp=
fmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg2-7=
/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-mtlp-7/igt@gem_exec_big@single.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871">i915#158=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_158=
07/shard-mtlp-5/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356=
">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_15807/shard-dg2-8/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-mtlp-6/igt@i915_pm_rps@reset.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365">i915#15365<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/=
shard-mtlp-5/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-glk9/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1618=
2">i915#16182</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_15807/shard-glk9/igt@i915_suspend@debugfs-reader.html=
">PASS</a> +1 other test pass</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@i915_suspend@debugfs-reader.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/481=
7">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_15807/shard-rkl-8/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12761">i915#12761</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_async_flips@async-flip-sus=
pend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-2/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg1-16/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip-async-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-14/igt@kms_b=
ig_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a=
> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_15807/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-128x42.=
html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg1-14/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15999">i915#15999</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor=
-crc-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-snb4/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14600">i915#14600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-snb6/igt@kms_flip@flip-vs-absolute-wf_vblan=
k@b-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg1-19/igt@kms_flip_tiling@flip-change-tiling.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16866">i915#16866</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16932">i915#16932</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/igt@kms_flip_t=
iling@flip-change-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-4-y-rc-ccs-to-y-rc-=
ccs:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg1-19/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hd=
mi-a-4-y-rc-ccs-to-y-rc-ccs.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16866">i915#16866</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16932">i915#16932</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shar=
d-dg1-18/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-4-y-rc-ccs-to=
-y-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri=
-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_frontbuf=
fer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">PASS</a> +4 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-s=
hrfb-draw-mmap-gtt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_15807/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p=
-scndscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-tglu-3/igt@kms_pipe_stress@stress-xrgb8888-untiled.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16772">i915#16772</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_15807/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb888=
8-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-4/igt@kms_plane_lowres@tiling-x.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i91=
5#16866</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_15807/shard-rkl-5/igt@kms_plane_lowres@tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073=
">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_15807/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_15807/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-=
no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-glk4/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915=
#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14242">i915#14242</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16236">i915#16236</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-glk6/igt@perf_pmu@rc6-suspend.=
html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-3/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/84=
11">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_15807/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/93=
23">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_15807/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-5/igt@gem_eio@kms.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i=
915#16837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16931">i915#16931</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@gem_eio@kms.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#=
16837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16931">i915#16931</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg1-15/igt@gem_eio@kms.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">=
i915#16866</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16931">i915#16931</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15807/shard-dg1-16/igt@gem_eio@kms.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16931">i91=
5#16931</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-tglu-2/igt@gem_eio@kms.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">=
i915#16837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16866">i915#16866</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15807/shard-tglu-4/igt@gem_eio@kms.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i91=
5#16837</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_exec_balancer@parallel-c=
ontexts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_15807/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-sub=
mit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_exec_reloc@basic-wri=
te-read-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2190">i915#2190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15807/shard-rkl-2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2=
190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-random.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15807/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-d=
isplay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@gem_partial_=
pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15656">i915#15656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@gem_tiled_pread_basic@basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-3/igt@gem_userptr_blits@relocations.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i=
915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_15807/shard-rkl-6/igt@gem_userptr_blits@relocations.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@gen9_exec_parse@batch-without-=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-4/igt@gen9_exec_parse@unaligned-access.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527=
">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_15807/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15479">i915#15479</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@i915_module_load@fa=
ult-injection@__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4387">i915#4387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_15807/shard-rkl-4/igt@i915_pm_sseu@full-enable.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">=
i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@i915_query@query-topology-unsupported.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16079">i915#16079</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@i915_query@query-topolog=
y-unsupported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/528=
6">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_15807/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5=
286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/36=
38">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_15807/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@km=
s_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i9=
15#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-r=
c-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-1/i=
gt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_ccs@missing-cc=
s-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i=
915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_ccs@random-ccs-=
data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-after-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@kms_chamelium_audio=
@dp-audio-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut=
1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@kms_chamelium_=
color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_chamelium=
_frames@hdmi-crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg1-15/igt@kms_content_protection@mei-interface.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_15807/shard-dg1-12/igt@kms_content_protection@mei-interface.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_content_protection@uevent.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_cursor_crc@cursor-on=
screen-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@kms_cursor_crc@cu=
rsor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_15807/shard-rkl-1/igt@kms_dsc@dsc-with-formats.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1636=
1">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_15807/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-2/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915=
#16600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_15807/shard-rkl-6/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_flip@2x-flip-vs-modeset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@=
kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643=
">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-2/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4=
tile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p01=
0-4tile-to-p016-4tile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-=
indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_frontbuffer=
_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-=
pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-18/=
igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl=
-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15102">i915#15102</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#87=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_158=
07/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-d=
raw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscr=
n-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_fro=
ntbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15102">i915#15102</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscr=
n-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_fro=
ntbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP<=
/a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt:</=
p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndsc=
rn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_frontbuf=
fer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shr=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-dg1-17/igt@kms_=
frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#1=
5102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-2/igt@=
kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/182=
5">i915#1825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-c=
ur-indfb-move.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-=
scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +28 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i9=
15#15132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_15807/shard-rkl-5/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#166=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i9=
15#1187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16490">i915#16490</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-mtlp-4/igt@kms_hdr@brightness=
-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-7/igt@kms_joiner@invalid-modeset-big-joiner.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15460">i915#15460</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_15807/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15459">i915#15459</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-8/igt@kms_joiner@invalid=
-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16451">i915#16451</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_mst@mst-suspend-read-crc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14712">i915#14712</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_plane@pixel-format-4=
-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-none.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/139=
58">i915#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15807/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
958">i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75=
-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_plane_s=
caling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6524">i915#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/65=
24">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continu=
ous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay=
-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-3/igt@k=
ms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">=
i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-5/igt@kms_psr@psr-primary-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915=
#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_15807/shard-rkl-6/igt@kms_psr@psr-primary-render.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072=
">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_psr@psr2-sprite-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915=
#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-7/igt@kms_psr@psr2-sprite-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_15807/shard-rkl-5/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_15807/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1524=
3">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">=
i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_15807/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2436">i915#2436</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_15807/shard-rkl-4/igt@perf@gen8-unprivilege=
d-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-dg2-5/igt@perf_pmu@module-unload.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#1=
5778</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
5807/shard-dg2-8/igt@perf_pmu@module-unload.html">ABORT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778"=
>i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19107/shard-rkl-3/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915=
#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
15807/shard-rkl-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/37=
08">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9086 -&gt; IGTPW_15807</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19107: 5cb17454a3e04fcc1133d87451c9c582c297e92d @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_15807: 15807<br />
  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6475378306440803664==--
