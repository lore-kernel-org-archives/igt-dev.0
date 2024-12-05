Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77D5E7716D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 12:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6617910E3AE;
	Thu,  5 Dec 2024 12:59:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9F010E3AE;
 Thu,  5 Dec 2024 12:59:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_igt-runner_fact_checking?=
 =?utf-8?q?_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Dec 2024 12:59:11 -0000
Message-ID: <173340355163.2972948.14909574131553509588@b555e5b46a47>
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

Series: igt-runner fact checking (rev10)
URL   : https://patchwork.freedesktop.org/series/140841/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15791_full -> IGTPW_12248_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12248_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_hdr@brightness-with-hdr:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-9/igt@kms_hdr@brightness-with-hdr.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15791_full and IGTPW_12248_full:

### New IGT tests (19) ###

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-4:
    - Statuses : 1 fail(s)
    - Exec time: [2.58] s

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.16, 2.30] s

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_async_flips@crc-atomic@pipe-b-dp-4:
    - Statuses : 1 fail(s)
    - Exec time: [2.31] s

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.15, 2.32] s

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-4:
    - Statuses : 1 fail(s)
    - Exec time: [2.31] s

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@crc-atomic@pipe-d-dp-4:
    - Statuses : 1 fail(s)
    - Exec time: [2.31] s

  * igt@kms_async_flips@crc-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.87] s

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.24] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-2:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.10, 0.27] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.49] s

  * igt@kms_psr@psr2-cursor-mmap-cpu@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  

Known issues
------------

  Here are the changes found in IGTPW_12248_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][2] ([i915#8411])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][3] ([i915#8411])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-4/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8411])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-6/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8414]) +20 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-6/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@busy-idle@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8414]) +17 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@drm_fdinfo@busy-idle@vcs1.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8414]) +23 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-1/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#4873])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-4/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-5/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#3555] / [i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-7/igt@gem_ccs@block-copy-compressed.html
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][12] ([i915#1099]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb7/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8555])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#280])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@gem_ctx_sseu@mmap-args.html
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#280])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu-1:       NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#280])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@gem_ctx_sseu@mmap-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#280])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#4525]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-5/igt@gem_exec_balancer@parallel.html
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#4525]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3539] / [i915#4852])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-18/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#3281]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-range-active:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#3281]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-3/igt@gem_exec_reloc@basic-range-active.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#3281]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#3281]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-18/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-snb:          NOTRUN -> [ABORT][26] ([i915#13242]) +5 other tests abort
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb5/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4860]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#4860]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#4860]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#2190])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][31] ([i915#4613])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#4613]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#4613]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][34] ([i915#4613]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk5/igt@gem_lmem_swapping@random-engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4613]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-4/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#284])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-7/igt@gem_media_vme.html
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#284])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-11/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#284])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#284])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-5/igt@gem_media_vme.html

  * igt@gem_mmap@pf-nonblock:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4083]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-5/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4077]) +10 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-12/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4077]) +8 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-8/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4077]) +12 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-2/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         NOTRUN -> [ABORT][44] ([i915#10729]) +1 other test abort
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_wc@coherency:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4083]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-4/igt@gem_mmap_wc@coherency.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4083]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3282]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3282])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-8/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#3282]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4270]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][51] ([i915#12964])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-1/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4270]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-12/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          NOTRUN -> [TIMEOUT][53] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_readwrite@new-obj:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3282]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#8428]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#5190] / [i915#8428]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-1/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4079]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#8411]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4079]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4079]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-2/igt@gem_tiled_pread_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4879])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@gem_unfence_active_buffers.html
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4879])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-2/igt@gem_unfence_active_buffers.html
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4879])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@access-control:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3297]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-8/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3297]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-3/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3282] / [i915#3297])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3282] / [i915#3297])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@gem_userptr_blits@forbidden-operations.html
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#3282] / [i915#3297])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-8/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282] / [i915#3297])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-1/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3297] / [i915#4880])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3297] / [i915#4880])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3297]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-1/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3297]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#3297]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-4/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#2856]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-3/igt@gen9_exec_parse@allowed-all.html
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#2856]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-8/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][77] ([i915#2527] / [i915#2856])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#2527]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#2527]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-13/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#2527] / [i915#2856]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-9/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          NOTRUN -> [DMESG-FAIL][81] ([i915#13264])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb7/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#11681]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-1/igt@i915_pm_rps@thresholds-park.html
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#11681]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@i915_pm_rps@thresholds-park.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#11681])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-8/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4387])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#6188])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-5/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#5723])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#5723])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#5723])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-7/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][90] ([i915#9311]) +1 other test dmesg-warn
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb7/igt@i915_selftest@mock.html

  * igt@i915_selftest@perf:
    - shard-snb:          NOTRUN -> [ABORT][91] ([i915#12450])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb7/igt@i915_selftest@perf.html

  * igt@i915_selftest@perf@engine_cs:
    - shard-snb:          NOTRUN -> [ABORT][92] ([i915#11703])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb7/igt@i915_selftest@perf@engine_cs.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][93] ([i915#4817])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-4 (NEW):
    - {shard-dg2-9}:      NOTRUN -> [FAIL][94] ([i915#12591]) +3 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-9/igt@kms_async_flips@crc-atomic@pipe-c-dp-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][95] ([i915#1769])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#1769] / [i915#3555])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][97] ([i915#1769])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#1769] / [i915#3555])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#1769] / [i915#3555])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#1769] / [i915#3555])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#5286]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][102] +13 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4538] / [i915#5286]) +6 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#5286]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#5286]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#3638]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#3638]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-12/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#4538] / [i915#5190]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][109] +16 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#4538]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#6095]) +57 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#6095]) +49 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#10307] / [i915#6095]) +61 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-3/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#12313])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#12313])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#6095]) +14 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#6095]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#6095]) +34 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#12313]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#12313]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#12313]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#6095]) +49 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#7828]) +5 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-7/igt@kms_chamelium_audio@dp-audio.html
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#7828]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-8/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][126] +11 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#7828]) +4 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#7828])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#7828]) +5 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-5/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#7828]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#9424])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-5/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#9424])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-1/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#9433])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-12/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#6944] / [i915#9424])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-6/igt@kms_content_protection@mei-interface.html
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#8063] / [i915#9433])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#7118] / [i915#9424])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-8/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#7118] / [i915#9424])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#7116] / [i915#9424])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-5/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#3555] / [i915#6944] / [i915#9424])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#3555] / [i915#8814]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#13049])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#13049]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#13049])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#13049]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#3555]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-max-size.html
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#3555]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#13049])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#8814]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#3555]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-tglu:         NOTRUN -> [ABORT][151] ([i915#10159] / [i915#13218])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-5/igt@kms_cursor_crc@cursor-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][152] ([i915#7882])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk4/igt@kms_cursor_crc@cursor-suspend.html
    - shard-mtlp:         NOTRUN -> [ABORT][153] ([i915#10159] / [i915#13218]) +1 other test abort
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][154] ([i915#12358])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#4103])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#4103] / [i915#4213])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#4103])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#4213])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#4103] / [i915#4213])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#9809])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][161] ([i915#12170])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][162] ([i915#11968])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#3555] / [i915#3840])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4854])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-8/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#4854])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#4854])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#1839])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@kms_feature_discovery@display-3x.html
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#1839])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-1/igt@kms_feature_discovery@display-3x.html
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#1839])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-13/igt@kms_feature_discovery@display-3x.html
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#1839])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-4/igt@kms_feature_discovery@display-3x.html
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#1839])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#9934]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#3637]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#9934]) +7 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#3637]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#9934]) +7 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#3637]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][178] ([i915#11989]) +5 other tests fail
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#8381]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-2/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#8381]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-5/igt@kms_flip@flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#8381]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-12/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-fences@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][182] ([i915#12964]) +12 other tests dmesg-warn
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-5/igt@kms_flip@flip-vs-fences@b-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#2672] / [i915#3555]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#2672] / [i915#3555]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#2672] / [i915#8813]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#2672]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#2672] / [i915#3555])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#2587] / [i915#2672]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#2587] / [i915#2672]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#2672] / [i915#3555] / [i915#8813]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#2672] / [i915#3555]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#2672] / [i915#3555]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#3555] / [i915#8813])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#8810])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#2587] / [i915#2672]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#2672]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][198] +30 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#1825]) +35 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2:          NOTRUN -> [FAIL][200] ([i915#6880])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#5439]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#5439])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#5439]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][204] +46 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3023]) +18 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#8708]) +11 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#5354]) +31 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][208] +16 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#1825]) +21 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3458]) +11 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#8708]) +7 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#9766])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#9766])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#8708]) +10 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#3458]) +11 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][216] +411 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#3555] / [i915#8228])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_hdr@bpc-switch.html
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#3555] / [i915#8228])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-5/igt@kms_hdr@bpc-switch.html
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#3555] / [i915#8228])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-8/igt@kms_hdr@bpc-switch.html
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#3555] / [i915#8228])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#12394])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-12/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#12394])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-6/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#10656])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-4/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#10656])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-5/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#12394])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][226] ([i915#12169])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk8/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][227] ([i915#10647]) +3 other tests fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk8/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][228] ([i915#12177])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#12247]) +6 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#3555]) +3 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#3555])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#12247]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
    - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#12247]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#12247]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#5354])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#5354])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#9812])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#9685]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#9685])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-11/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-mtlp:         NOTRUN -> [FAIL][240] ([i915#12912])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-5/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#9685])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#9685])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-18/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#9519])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#9519])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-3/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#9519])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#9519])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#6524])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_prime@d3hot.html
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#6524])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-13/igt@kms_prime@d3hot.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#6524])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-10/igt@kms_prime@d3hot.html
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#6524])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-6/igt@kms_prime@d3hot.html
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#6524] / [i915#6805])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-7/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#11520]) +5 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#11520]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][254] ([i915#11520]) +12 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#11520]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#11520]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-glk:          NOTRUN -> [SKIP][257] ([i915#11520]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk5/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#12316]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#11520]) +4 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#4348])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-2/igt@kms_psr2_su@page_flip-nv12.html
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#9683])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-5/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#9683])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@kms_psr2_su@page_flip-nv12.html
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#9683])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#9683]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#1072] / [i915#9732]) +20 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#1072] / [i915#9732]) +17 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#9732]) +5 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#9732]) +14 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-4/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@pr-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#9688]) +18 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-5/igt@kms_psr@pr-primary-mmap-cpu.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1 (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#4077] / [i915#9688]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-5/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#1072] / [i915#9732]) +19 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][272] +216 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk1/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#12755]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#5289]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#5190]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#5289])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#5289]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#5289]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#12755])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#11920])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-1/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#11920])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][282] ([i915#11920])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#9906]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-3/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#3555] / [i915#9906])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-7/igt@kms_vrr@negative-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#3555] / [i915#9906])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_vrr@negative-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#3555] / [i915#9906])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-13/igt@kms_vrr@negative-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#3555] / [i915#9906])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-10/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#9906]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#9906])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#8808] / [i915#9906])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-3/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#9906])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#2437] / [i915#9412])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-11/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#2437] / [i915#9412])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@enable-disable@0-rcs0:
    - shard-tglu-1:       NOTRUN -> [ABORT][294] ([i915#13218]) +3 other tests abort
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-1/igt@perf@enable-disable@0-rcs0.html

  * igt@perf_pmu@busy:
    - shard-dg2:          NOTRUN -> [ABORT][295] ([i915#13218]) +23 other tests abort
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-2/igt@perf_pmu@busy.html

  * igt@perf_pmu@busy-accuracy-98@rcs0:
    - shard-tglu:         NOTRUN -> [ABORT][296] ([i915#13218]) +22 other tests abort
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-2/igt@perf_pmu@busy-accuracy-98@rcs0.html

  * igt@perf_pmu@busy-hang@rcs0:
    - shard-glk:          NOTRUN -> [ABORT][297] ([i915#13218]) +26 other tests abort
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk5/igt@perf_pmu@busy-hang@rcs0.html
    - shard-mtlp:         NOTRUN -> [ABORT][298] ([i915#13218]) +22 other tests abort
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-7/igt@perf_pmu@busy-hang@rcs0.html

  * igt@perf_pmu@most-busy-check-all@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][299] ([i915#13218]) +7 other tests abort
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb4/igt@perf_pmu@most-busy-check-all@rcs0.html

  * igt@perf_pmu@rc6:
    - shard-dg1:          NOTRUN -> [ABORT][300] ([i915#13218]) +20 other tests abort
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@perf_pmu@rc6.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#8516])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-10/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#8516])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#8516])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-14/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#8516])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-tglu-3/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@semaphore-wait:
    - shard-rkl:          NOTRUN -> [ABORT][305] ([i915#13218]) +25 other tests abort
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-3/igt@perf_pmu@semaphore-wait.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-rkl:          [PASS][306] -> [DMESG-WARN][307] ([i915#12964]) +4 other tests dmesg-warn
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-rkl-3/igt@prime_busy@hang-wait@bcs0.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-5/igt@prime_busy@hang-wait@bcs0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#3708])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-18/igt@prime_vgem@basic-fence-flip.html
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#3708])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-10/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#3708] / [i915#4077])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-4/igt@prime_vgem@basic-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#3708] / [i915#4077])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-6/igt@prime_vgem@basic-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#3708] / [i915#4077])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg1-17/igt@prime_vgem@basic-gtt.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@many-contexts:
    - shard-rkl:          [DMESG-WARN][313] ([i915#12964]) -> [PASS][314] +1 other test pass
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-rkl-7/igt@gem_ctx_persistence@many-contexts.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-2/igt@gem_ctx_persistence@many-contexts.html

  * igt@i915_module_load@load:
    - shard-glk:          ([PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [DMESG-WARN][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339]) ([i915#118]) -> ([PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk4/igt@i915_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk2/igt@i915_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk9/igt@i915_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk4/igt@i915_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk4/igt@i915_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk5/igt@i915_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk5/igt@i915_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk8/igt@i915_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk8/igt@i915_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk9/igt@i915_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk9/igt@i915_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk5/igt@i915_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk3/igt@i915_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk2/igt@i915_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk2/igt@i915_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk8/igt@i915_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk5/igt@i915_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk9/igt@i915_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk3/igt@i915_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk9/igt@i915_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk5/igt@i915_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk1/igt@i915_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk5/igt@i915_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk1/igt@i915_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-glk2/igt@i915_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk1/igt@i915_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk1/igt@i915_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk2/igt@i915_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk2/igt@i915_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk4/igt@i915_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk5/igt@i915_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk3/igt@i915_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk1/igt@i915_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk5/igt@i915_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk1/igt@i915_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk2/igt@i915_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk5/igt@i915_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk3/igt@i915_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk3/igt@i915_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk5/igt@i915_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk3/igt@i915_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk2/igt@i915_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk3/igt@i915_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk5/igt@i915_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk9/igt@i915_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk8/igt@i915_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk3/igt@i915_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk2/igt@i915_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk2/igt@i915_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk9/igt@i915_module_load@load.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-snb:          [SKIP][365] -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          [SKIP][367] ([i915#3458]) -> [SKIP][368] ([i915#10433] / [i915#3458])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15791/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10159
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10729]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10729
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11703
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11968
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12170]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12170
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12450
  [i915#12591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12591
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12912]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12912
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#13242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13242
  [i915#13264]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13264
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#8063]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8138 -> IGTPW_12248
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15791: 6d42506688c08f85240449e80658ab760d899ae2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12248: 88273617b9af8c2ddd360783a14717e9f34c85dd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8138: 8138
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/index.html
