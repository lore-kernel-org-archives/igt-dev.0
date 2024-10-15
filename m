Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF32D1F9C6
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 19:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C83910E0CD;
	Tue, 15 Oct 2024 19:52:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA3710E0CD;
 Tue, 15 Oct 2024 19:52:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8359020250247242210=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgeGVfZmluZF9lbmdpbmVfYnlfY2xh?=
 =?utf-8?b?c3MgaGVscGVy?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 15 Oct 2024 19:52:13 -0000
Message-ID: <172902193375.1270479.7751924076555138129@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241015141826.4186247-1-pravalika.gurram@intel.com>
In-Reply-To: <20241015141826.4186247-1-pravalika.gurram@intel.com>
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

--===============8359020250247242210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_find_engine_by_class helper
URL   : https://patchwork.freedesktop.org/series/140001/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8074_full -> IGTPW_11911_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11911_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11911_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11911_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - shard-mtlp:         [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-2/igt@kms_atomic_transition@modeset-transition-fencing.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-8/igt@kms_atomic_transition@modeset-transition-fencing.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a3:
    - shard-dg1:          NOTRUN -> [FAIL][4] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a3.html

  
New tests
---------

  New tests have been introduced between IGT_8074_full and IGTPW_11911_full:

### New IGT tests (2) ###

  * igt@kms_vblank@query-forked-hang@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.22] s

  * igt@kms_vblank@query-forked-hang@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_11911_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-7/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#11078])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy@bcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#8414]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-8/igt@drm_fdinfo@busy@bcs0.html

  * igt@drm_fdinfo@busy@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8414]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@drm_fdinfo@busy@rcs0.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8414]) +11 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@drm_fdinfo@isolation@vecs0.html

  * igt@fbdev@pan:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#2582])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@fbdev@pan.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#7697])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#7697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#6335])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-2/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#8555])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][19] ([i915#11980])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][20] ([i915#11980])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@gem_ctx_persistence@hostile.html
    - shard-mtlp:         NOTRUN -> [FAIL][21] ([i915#11980])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][22] ([i915#1099])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         NOTRUN -> [ABORT][24] ([i915#10030] / [i915#7975] / [i915#8213])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-10/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg1:          [PASS][25] -> [FAIL][26] ([i915#5784])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-17/igt@gem_eio@kms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@hog:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4812])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#4525]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [PASS][29] -> [ABORT][30] ([i915#11713])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-9/igt@gem_exec_big@single.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-4/igt@gem_exec_big@single.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][31] ([i915#2842]) +5 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#3539])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@gem_exec_flush@basic-uc-set-default.html
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#3539])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#3539] / [i915#4852]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][36] +8 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3281]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@gem_exec_reloc@basic-active.html
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#3281]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#3281]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#3281]) +8 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [PASS][41] -> [INCOMPLETE][42] ([i915#11441]) +1 other test incomplete
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@gem_exec_suspend@basic-s0@lmem0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-10/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4860]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4860]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4860])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#2190])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#12193])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4565])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#4613])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-10/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#4613]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#8289])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#8289])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-3/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4083]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap@short-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4083]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-7/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4077]) +5 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@gem_mmap_gtt@basic-small-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4077]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4077]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4083]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@gem_mmap_wc@bad-size.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3282]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#3282])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#3282]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3282]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4270]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4270])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4270]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4270]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#5190] / [i915#8428]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#8428]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4079])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4079])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#3297])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-3/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3297]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3297])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@gem_userptr_blits@set-cache-level.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#2527]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@gen9_exec_parse@batch-invalid-length.html
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#2527] / [i915#2856])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-2/igt@gen9_exec_parse@batch-invalid-length.html
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#2856]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-3/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#2527]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#2856]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][79] -> [ABORT][80] ([i915#9820])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [PASS][81] -> [ABORT][82] ([i915#9820])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#6412])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#8399])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][85] ([i915#2681]) +1 other test warn
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [PASS][86] -> [FAIL][87] ([i915#3591])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#11681] / [i915#6621])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#11681] / [i915#6621])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#11681] / [i915#6621])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#11681])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#6245])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#6245])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@i915_query@hwconfig_table.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4212])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4215])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4215] / [i915#5190])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#8709]) +11 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#8709]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#5286]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#5286]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#4538] / [i915#5286]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][102] +5 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#3638]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-16/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3638]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4538] / [i915#5190])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#5190] / [i915#9197]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#6187])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#4538]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#12313]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#12313]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#10307] / [i915#6095]) +173 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#9197]) +8 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#12313])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#6095]) +24 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#6095]) +29 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#6095]) +116 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#12313])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#6095]) +90 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#11616] / [i915#7213]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#7828]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#7828]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#7828]) +11 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#7828]) +8 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#7828]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [PASS][126] -> [SKIP][127] ([i915#3555]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_color@deep-color.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#3116])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#9424])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#7118] / [i915#9424])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#7116] / [i915#9424])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#3555] / [i915#6944] / [i915#9424])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#8814])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#3555]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#11453])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#11453]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#4103])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4103] / [i915#4213])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#4213])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#4103] / [i915#4213])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#9723])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#3840])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#3840])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#3555] / [i915#3840])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#3955])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#1839])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#9337])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#4881])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#3637]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][151] +20 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#3637]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#9934]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-dg2:          [PASS][154] -> [SKIP][155] ([i915#5354]) +11 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][156] -> [FAIL][157] ([i915#2122])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
    - shard-dg1:          [PASS][158] -> [FAIL][159] ([i915#2122])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][160] ([i915#2122]) +2 other tests fail
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:
    - shard-snb:          [PASS][161] -> [FAIL][162] ([i915#2122]) +7 other tests fail
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-mtlp:         [PASS][163] -> [FAIL][164] ([i915#2122]) +2 other tests fail
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-mtlp:         [PASS][165] -> [FAIL][166] ([i915#12138])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg1:          [PASS][167] -> [INCOMPLETE][168] ([i915#4839] / [i915#6113])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-15/igt@kms_flip@flip-vs-suspend.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-snb:          [PASS][169] -> [INCOMPLETE][170] ([i915#4839]) +1 other test incomplete
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb7/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][171] ([i915#6113])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-tglu:         [PASS][172] -> [FAIL][173] ([i915#2122]) +3 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-rkl:          [PASS][174] -> [FAIL][175] ([i915#11989] / [i915#2122])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][176] ([i915#11961])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#2672] / [i915#3555])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#2587] / [i915#2672])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#3555] / [i915#8813]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#2672] / [i915#3555]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#2672] / [i915#3555])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#8810])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#2587] / [i915#2672])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#2672] / [i915#3555])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#2672]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#2672] / [i915#3555] / [i915#5190])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#2672]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#3555] / [i915#8810])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg2:          [PASS][190] -> [FAIL][191] ([i915#6880])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#1825]) +43 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][193] +27 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-snb:          [PASS][194] -> [SKIP][195] +13 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#8708]) +12 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][197] +30 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#1825]) +8 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#5354]) +25 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#3023]) +25 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#3458]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#3458]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#8708]) +10 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#8708]) +7 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#8228])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@kms_hdr@static-swap.html
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#3555] / [i915#8228])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-7/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [PASS][207] -> [SKIP][208] ([i915#3555] / [i915#8228])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_hdr@static-toggle.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#12388])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#12388])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#12388])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#10656])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#12394])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#12394])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#12339])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#4816])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format:
    - shard-dg2:          [PASS][217] -> [SKIP][218] ([i915#8825]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_plane@pixel-format.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane@pixel-format.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-dg2:          [PASS][219] -> [SKIP][220] ([i915#7294])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-11/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#3555]) +7 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [PASS][222] -> [FAIL][223] ([i915#8292])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][224] ([i915#8292])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-dg2:          [PASS][225] -> [SKIP][226] ([i915#12247] / [i915#8152] / [i915#9423]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - shard-dg2:          [PASS][227] -> [SKIP][228] ([i915#12247] / [i915#8152]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-dg2:          [PASS][229] -> [SKIP][230] ([i915#8152] / [i915#9423]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:
    - shard-dg2:          [PASS][231] -> [SKIP][232] ([i915#8152])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-snb:          NOTRUN -> [SKIP][233] +19 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#12247]) +5 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-dg2:          [PASS][235] -> [SKIP][236] ([i915#6953] / [i915#8152] / [i915#9423])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:
    - shard-dg2:          [PASS][237] -> [SKIP][238] ([i915#12247]) +11 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#12247] / [i915#6953])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#12247]) +8 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#12247] / [i915#3555] / [i915#6953])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#12247]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#5354])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#5354])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#9685])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [PASS][246] -> [FAIL][247] ([i915#9295])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#3361])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#9340])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#9519])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#9519]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][252] -> [SKIP][253] ([i915#9519]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [PASS][254] -> [SKIP][255] ([i915#9519])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2:          [PASS][256] -> [SKIP][257] ([i915#3547])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_pm_rpm@system-suspend-modeset.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#11520]) +8 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#11520]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#9808]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#11520]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-17/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#11520]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#9732]) +10 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-2/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#1072] / [i915#9732]) +10 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-10/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@pr-primary-render:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#9688]) +11 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-6/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#1072] / [i915#9732]) +24 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#1072] / [i915#9732]) +8 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@kms_psr@psr2-primary-mmap-cpu.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#5289]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#5289]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#5289]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#5289])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#5190]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#11131] / [i915#5190])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][274] ([i915#12231]) +1 other test abort
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][275] ([i915#12231]) +1 other test abort
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#3555]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][277] ([i915#5465]) +3 other tests fail
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#3555] / [i915#8809] / [i915#8823])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][279] -> [FAIL][280] ([IGT#2])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_sysfs_edid_timing.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#8623])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@query-forked-hang:
    - shard-dg2:          [PASS][282] -> [SKIP][283] ([i915#9197]) +32 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-8/igt@kms_vblank@query-forked-hang.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#3555]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [PASS][285] -> [SKIP][286] ([i915#3555] / [i915#9906])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_vrr@negative-basic.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_vrr@negative-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#3555] / [i915#9906])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#9906])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#2437])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_writeback@writeback-check-output.html
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#2437])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_writeback@writeback-check-output.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#8850])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          [PASS][292] -> [SKIP][293]
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-6/igt@prime_mmap_kms@buffer-sharing.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@prime_mmap_kms@buffer-sharing.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#3291] / [i915#3708]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#3708])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#9917]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#9917])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-dg2:          [SKIP][298] ([i915#2582]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@fbdev@unaligned-write.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@fbdev@unaligned-write.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-rkl:          [FAIL][300] ([i915#12027] / [i915#12031]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html
    - shard-mtlp:         [FAIL][302] ([i915#12027] / [i915#12031]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-6/igt@gem_ctx_engines@invalid-engines.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         [FAIL][304] ([i915#11980]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-4/igt@gem_ctx_persistence@hostile.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][306] ([i915#7975] / [i915#8213]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-14/igt@gem_eio@hibernate.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-16/igt@gem_eio@hibernate.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-dg1:          [DMESG-WARN][308] ([i915#4423]) -> [PASS][309] +1 other test pass
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-15/igt@gem_exec_suspend@basic-s3-devices.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [FAIL][310] -> [PASS][311] +1 other test pass
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-9/igt@gem_exec_suspend@basic-s4-devices.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][312] -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [FAIL][314] ([i915#3591]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg1:          [FAIL][316] ([i915#5956]) -> [PASS][317] +1 other test pass
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_cursor_crc@cursor-alpha-opaque:
    - shard-dg2:          [SKIP][318] ([i915#9197]) -> [PASS][319] +30 other tests pass
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_cursor_crc@cursor-alpha-opaque.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_cursor_crc@cursor-alpha-opaque.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-mtlp:         [INCOMPLETE][320] ([i915#12358]) -> [PASS][321] +1 other test pass
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-8/igt@kms_cursor_crc@cursor-suspend.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-mtlp:         [FAIL][322] ([i915#2346]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          [SKIP][324] ([i915#1849]) -> [PASS][325] +1 other test pass
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-dg2:          [SKIP][326] ([i915#5354]) -> [PASS][327] +12 other tests pass
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_flip@basic-flip-vs-dpms.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-mtlp:         [FAIL][328] ([i915#2122]) -> [PASS][329] +5 other tests pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
    - shard-rkl:          [FAIL][330] ([i915#2122]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
    - shard-dg1:          [FAIL][332] ([i915#2122]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-17/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:
    - shard-rkl:          [FAIL][334] ([i915#11961]) -> [PASS][335] +1 other test pass
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [FAIL][336] ([i915#2122]) -> [PASS][337] +8 other tests pass
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb6/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb7/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1:
    - shard-tglu:         [FAIL][338] ([i915#2122]) -> [PASS][339] +3 other tests pass
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          [FAIL][340] ([i915#6880]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-snb:          [SKIP][342] -> [PASS][343] +2 other tests pass
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-dg2:          [SKIP][344] ([i915#3555]) -> [PASS][345] +3 other tests pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_invalid_mode@bad-hsync-end.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-dg2:          [SKIP][346] ([i915#7294]) -> [PASS][347] +2 other tests pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-128:
    - shard-dg1:          [INCOMPLETE][348] -> [PASS][349] +2 other tests pass
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-15/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-128.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-128.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-dg2:          [SKIP][350] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@invalid-num-scalers.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg2:          [SKIP][352] ([i915#3555] / [i915#8152] / [i915#9423]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:
    - shard-dg2:          [SKIP][354] ([i915#12247] / [i915#8152]) -> [PASS][355] +4 other tests pass
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2:          [SKIP][356] ([i915#12247] / [i915#8152] / [i915#9423]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-dg2:          [SKIP][358] ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-dg2:          [SKIP][360] ([i915#12247]) -> [PASS][361] +14 other tests pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          [SKIP][362] ([i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-dg2:          [SKIP][364] ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [SKIP][366] ([i915#9340]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-7/igt@kms_pm_lpsp@kms-lpsp.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [FAIL][368] -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_pm_rpm@basic-pci-d3-state.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][370] ([i915#9519]) -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-dg2:          [SKIP][372] ([i915#11521]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_properties@plane-properties-atomic.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][374] ([i915#5465]) -> [PASS][375] +2 other tests pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-4/igt@kms_setmode@basic.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-2/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-2:
    - shard-rkl:          [FAIL][376] ([i915#5465]) -> [PASS][377] +2 other tests pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-5/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg1:          [INCOMPLETE][378] ([i915#12276]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-19/igt@kms_vblank@ts-continuation-suspend.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-16/igt@kms_vblank@ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_engines@invalid-engines:
    - shard-tglu:         [FAIL][380] ([i915#12027] / [i915#12031]) -> [FAIL][381] ([i915#12031])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-3/igt@gem_ctx_engines@invalid-engines.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglu:         [FAIL][382] ([i915#2842]) -> [FAIL][383] ([i915#2876])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-2/igt@gem_exec_fair@basic-pace@rcs0.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2:          [SKIP][384] ([i915#9197]) -> [SKIP][385] +3 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2:          [SKIP][386] -> [SKIP][387] ([i915#9197]) +2 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-6/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          [SKIP][388] ([i915#5190] / [i915#9197]) -> [SKIP][389] ([i915#4538] / [i915#5190]) +4 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          [SKIP][390] ([i915#5190] / [i915#9197]) -> [SKIP][391] ([i915#5190]) +2 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2:          [SKIP][392] ([i915#4538] / [i915#5190]) -> [SKIP][393] ([i915#5190] / [i915#9197]) +8 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          [SKIP][394] ([i915#10307] / [i915#6095]) -> [SKIP][395] ([i915#9197]) +6 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][396] ([i915#12313]) -> [SKIP][397] ([i915#9197]) +2 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][398] ([i915#9197]) -> [SKIP][399] ([i915#10307] / [i915#6095]) +13 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          [SKIP][400] ([i915#11616] / [i915#7213]) -> [SKIP][401] ([i915#9197])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          [SKIP][402] ([i915#7118] / [i915#9424]) -> [SKIP][403] ([i915#9197])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-6/igt@kms_content_protection@atomic-dpms.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2:          [SKIP][404] ([i915#9424]) -> [SKIP][405] ([i915#9197])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-8/igt@kms_content_protection@lic-type-1.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_content_protection@lic-type-1.html
    - shard-snb:          [INCOMPLETE][406] ([i915#8816]) -> [SKIP][407]
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb4/igt@kms_content_protection@lic-type-1.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2:          [SKIP][408] ([i915#9197]) -> [SKIP][409] ([i915#11453])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          [SKIP][410] ([i915#3555]) -> [SKIP][411] ([i915#9197]) +2 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2:          [SKIP][412] ([i915#9197]) -> [SKIP][413] ([i915#5354]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          [SKIP][414] ([i915#9197]) -> [SKIP][415] ([i915#4103] / [i915#4213])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          [SKIP][416] ([i915#5354]) -> [SKIP][417] ([i915#9197]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          [SKIP][418] ([i915#9197]) -> [SKIP][419] ([i915#3555]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_display_modes@extended-mode-basic.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [SKIP][420] ([i915#12402]) -> [SKIP][421] ([i915#9197])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          [SKIP][422] ([i915#3840] / [i915#9688]) -> [SKIP][423] ([i915#9197])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          [SKIP][424] ([i915#2672] / [i915#3555] / [i915#5190]) -> [SKIP][425] ([i915#3555] / [i915#5190]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][426] ([i915#5354]) -> [SKIP][427] ([i915#8708]) +11 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][428] ([i915#8708]) -> [SKIP][429] ([i915#5354]) +13 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][430] ([i915#3458]) -> [SKIP][431] ([i915#10433] / [i915#3458]) +2 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][432] ([i915#5354]) -> [SKIP][433] ([i915#10433] / [i915#3458])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][434] ([i915#10433] / [i915#3458]) -> [SKIP][435] ([i915#3458]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          [SKIP][436] ([i915#3458]) -> [SKIP][437] ([i915#5354]) +10 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          [SKIP][438] ([i915#5354]) -> [SKIP][439] ([i915#3458]) +8 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          [SKIP][440] ([i915#3555] / [i915#8228]) -> [SKIP][441] ([i915#9197])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_hdr@bpc-switch.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_hdr@bpc-switch.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2:          [SKIP][442] ([i915#12247] / [i915#9423]) -> [SKIP][443] ([i915#12247] / [i915#8152] / [i915#9423])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          [SKIP][444] ([i915#12247]) -> [SKIP][445] ([i915#12247] / [i915#8152]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2:          [SKIP][446] ([i915#12247] / [i915#3555] / [i915#9423]) -> [SKIP][447] ([i915#12247] / [i915#3555] / [i915#8152] / [i915#9423])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          [SKIP][448] ([i915#9197]) -> [SKIP][449] ([i915#11131])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_rotation_crc@primary-rotation-270.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          [SKIP][450] ([i915#5190]) -> [SKIP][451] ([i915#5190] / [i915#9197])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg1:          [SKIP][452] ([i915#4423] / [i915#5289]) -> [SKIP][453] ([i915#5289])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/index.html

--===============8359020250247242210==
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
<tr><td><b>Series:</b></td><td>xe_find_engine_by_class helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140001/">https://patchwork.freedesktop.org/series/140001/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8074_full -&gt; IGTPW_11911_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11911_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11911_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11911_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-2/igt@kms_atomic_transition@modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-8/igt@kms_atomic_transition@modeset-transition-fencing.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8074_full and IGTPW_11911_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11911_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-7/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@bcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-8/igt@drm_fdinfo@busy@bcs0.html">SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@drm_fdinfo@busy@rcs0.html">SKIP</a> ([i915#8414]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@drm_fdinfo@isolation@vecs0.html">SKIP</a> ([i915#8414]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@fbdev@pan.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-2/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> ([i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> ([i915#10030] / [i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-17/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@gem_eio@kms.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@gem_exec_balancer@hog.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-9/igt@gem_exec_big@single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-4/igt@gem_exec_big@single.html">ABORT</a> ([i915#11713])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@gem_exec_flush@basic-wb-rw-before-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@gem_exec_params@secure-non-root.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@gem_exec_reloc@basic-active.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@gem_exec_reloc@basic-active.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-10/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> ([i915#11441]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#12193])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-10/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@gem_lmem_swapping@verify.html">SKIP</a> ([i915#4613]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-3/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@gem_mmap@bad-offset.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@short-mmap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-7/igt@gem_mmap@short-mmap.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@gem_mmap_gtt@basic-small-copy.html">SKIP</a> ([i915#4077]) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@gem_mmap_gtt@basic-small-copy.html">SKIP</a> ([i915#4077]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> ([i915#4077]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@gem_mmap_wc@bad-size.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@gem_pwrite@basic-self.html">SKIP</a> ([i915#3282]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-3/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@gem_userptr_blits@set-cache-level.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-2/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-3/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> ([i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#4538] / [i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-16/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#3638]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([i915#5190] / [i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +173 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> ([i915#9197]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#6095]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-edp-1.html">SKIP</a> ([i915#6095]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#6095]) +116 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html">SKIP</a> ([i915#11616] / [i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> ([i915#7828]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_color@deep-color.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_color@deep-color.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-2/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_content_protection@lic-type-1.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7116] / [i915#9424])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-6/igt@kms_content_protection@type1.html">SKIP</a> ([i915#3555] / [i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4213])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> ([i915#9934]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_flip@absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_flip@absolute-wf_vblank-interruptible.html">SKIP</a> ([i915#5354]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> ([i915#2122])</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#2122]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html">FAIL</a> ([i915#2122]) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">FAIL</a> ([i915#2122]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> ([i915#12138])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-15/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> ([i915#4839] / [i915#6113])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb7/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">INCOMPLETE</a> ([i915#4839]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-13/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">INCOMPLETE</a> ([i915#6113])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-3/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> ([i915#2122]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> ([i915#11989] / [i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html">FAIL</a> ([i915#11961])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> ([i915#3555] / [i915#8813]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#5354]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> ([i915#3023]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#3458]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#3458]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-7/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([i915#10656])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([i915#12394])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([i915#12394])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane@pixel-format.html">SKIP</a> ([i915#8825]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-11/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">SKIP</a> ([i915#7294])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">SKIP</a> ([i915#8152] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html">SKIP</a> ([i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> ([i915#12247]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html">SKIP</a> ([i915#12247]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#5354])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> ([i915#3547])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> ([i915#11520]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-17/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-2/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> ([i915#9732]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-10/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> ([i915#1072] / [i915#9732]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-6/igt@kms_psr@pr-primary-render.html">SKIP</a> ([i915#9688]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@kms_psr@psr2-primary-mmap-cpu.html">SKIP</a> ([i915#1072] / [i915#9732]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#11131] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-19/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1.html">FAIL</a> ([i915#5465]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> ([i915#3555] / [i915#8809] / [i915#8823])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_sysfs_edid_timing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-8/igt@kms_vblank@query-forked-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_vblank@query-forked-hang.html">SKIP</a> ([i915#9197]) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-9/igt@kms_vrr@flip-suspend.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-6/igt@prime_mmap_kms@buffer-sharing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-4/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@fbdev@unaligned-write.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027] / [i915#12031]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-6/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027] / [i915#12031]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-2/igt@gem_ctx_engines@invalid-engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-4/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@gem_ctx_persistence@hostile.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-14/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-16/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-15/igt@gem_exec_suspend@basic-s3-devices.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-14/igt@gem_exec_suspend@basic-s3-devices.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-9/igt@gem_exec_suspend@basic-s4-devices.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> ([i915#5956]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-15/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_cursor_crc@cursor-alpha-opaque.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_cursor_crc@cursor-alpha-opaque.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-8/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> ([i915#12358]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-mtlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +5 other tests pass</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-17/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html">FAIL</a> ([i915#11961]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb6/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb7/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">SKIP</a> ([i915#7294]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-128:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-15/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-128.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-18/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-128.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_plane_scaling@invalid-num-scalers.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> ([i915#3555] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_properties@plane-properties-atomic.html">SKIP</a> ([i915#11521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_properties@plane-properties-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-4/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-2/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-rkl-5/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html">FAIL</a> ([i915#5465]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-rkl-3/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-19/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> ([i915#12276]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg1-16/igt@kms_vblank@ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-3/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027] / [i915#12031]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12031])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-tglu-2/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2876])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-6/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([i915#9197]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#5190] / [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5190] / [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> ([i915#5190] / [i915#9197]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([i915#10307] / [i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([i915#9197]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([i915#9197]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#11616] / [i915#7213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118] / [i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-8/igt@kms_content_protection@lic-type-1.html">SKIP</a> ([i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_content_protection@lic-type-1.html">SKIP</a> ([i915#9197])</li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-snb4/igt@kms_content_protection@lic-type-1.html">INCOMPLETE</a> ([i915#8816]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-snb5/igt@kms_content_protection@lic-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> ([i915#9197]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> ([i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-11/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3840] / [i915#9688]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#3555] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#5354]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#10433] / [i915#3458]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#10433] / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#10433] / [i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> ([i915#5354]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> ([i915#3458]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-1/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> ([i915#12247] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> ([i915#11131])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11911/shard-dg2-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> ([i915#5190] / [i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8074/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect">SKIP</a> ([i915#4423] / [i915#5289]) -&gt; [SKIP][453] ([i915#5289])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8359020250247242210==--
