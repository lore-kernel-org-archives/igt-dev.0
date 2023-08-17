Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0155473112239454647=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Date: Thu, 17 Aug 2023 22:39:49 -0000
Message-ID: <169231198917.12432.15414849820864985695@emeril.freedesktop.org>
References: <20230816182659.47460-1-robdclark@gmail.com>
In-Reply-To: <20230816182659.47460-1-robdclark@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?msm=3A_Add_submitoverhead_benchmark_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0155473112239454647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/msm: Add submitoverhead benchmark (rev3)
URL   : https://patchwork.freedesktop.org/series/121909/
State : success

== Summary ==

CI Bug Log - changes from IGT_7441_full -> IGTPW_9603_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_9603_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][1] ([i915#8411])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][2] ([i915#8414])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#8414]) +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8414]) +39 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#3281]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-8/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#4098] / [i915#5325])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#5325])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#5325])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#5325])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          NOTRUN -> [FAIL][10] ([i915#6268])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-mtlp:         [PASS][11] -> [FAIL][12] ([i915#2410]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_ctx_persistence@file:
    - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb1/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8555])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#5882]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#280])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#280])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-snb:          NOTRUN -> [DMESG-WARN][19] ([i915#8841]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][20] ([i915#5784])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][21] -> [FAIL][22] ([i915#5784])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-1/igt@gem_eio@reset-stress.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#4771])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#6334]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#6334]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglu:         [PASS][26] -> [FAIL][27] ([i915#2842]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-tglu-5/igt@gem_exec_fair@basic-flow@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][28] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-rkl:          [PASS][29] -> [FAIL][30] ([i915#2842])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-rkl-4/igt@gem_exec_fair@basic-none-share@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#3539] / [i915#4852]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][32] ([i915#2842])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#4812])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-mtlp:         [PASS][34] -> [DMESG-FAIL][35] ([i915#9121])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3539]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([fdo#112283]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3281]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#3281]) +10 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@preempt-engines@ccs0:
    - shard-mtlp:         [PASS][40] -> [FAIL][41] ([i915#9119]) +4 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-6/igt@gem_exec_schedule@preempt-engines@ccs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html

  * igt@gem_exec_schedule@preempt-engines@rcs0:
    - shard-mtlp:         [PASS][42] -> [DMESG-FAIL][43] ([i915#8962] / [i915#9121])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-6/igt@gem_exec_schedule@preempt-engines@rcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@rcs0.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4537] / [i915#4812])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4860])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4860])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4860])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#4613])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_lmem_swapping@random-engines.html
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#4613])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@gem_lmem_swapping@random-engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4613]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-8/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4565]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_mmap@big-bo:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4083]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@basic:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4077]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_mmap_gtt@basic.html

  * igt@gem_mmap_gtt@basic-wc:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4077]) +10 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@gem_mmap_gtt@basic-wc.html

  * igt@gem_mmap_gtt@big-bo-tiledy:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4077]) +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_mmap_gtt@big-bo-tiledy.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4083]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4083]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][58] ([i915#2658])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4270]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4270]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#4270])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-2.html
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#4270])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-5/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3282]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#8428])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4079]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3282])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4879])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@access-control:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3297])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#3323])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3297] / [i915#4880])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3297])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#3297])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          NOTRUN -> [FAIL][73] ([i915#3318])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_userptr_blits@vma-merge.html
    - shard-snb:          NOTRUN -> [FAIL][74] ([i915#2724])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb2/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_linear_blits:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([fdo#109289]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gen3_render_linear_blits.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([fdo#109289])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-6/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#2527] / [i915#2856])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@gen9_exec_parse@basic-rejected.html
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#2527])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#2856]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#2856]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#2527]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_hangman@detector@vcs0:
    - shard-mtlp:         [PASS][82] -> [FAIL][83] ([i915#8456]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-6/igt@i915_hangman@detector@vcs0.html

  * igt@i915_hangman@gt-engine-hang@vcs0:
    - shard-mtlp:         [PASS][84] -> [FAIL][85] ([i915#7069]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@i915_hangman@gt-engine-hang@vcs0.html

  * igt@i915_hwmon@hwmon-read:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#7707])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@i915_hwmon@hwmon-read.html

  * igt@i915_module_load@load:
    - shard-snb:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#6227])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb4/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [PASS][88] -> [DMESG-WARN][89] ([i915#7061] / [i915#8617])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [PASS][90] -> [ABORT][91] ([i915#8489] / [i915#8668])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#6412])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - shard-mtlp:         [PASS][93] -> [FAIL][94] ([i915#8691])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-3/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pm_backlight@bad-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#5354] / [i915#7561])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#7561])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#658]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#5978])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#1937])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-dg1:          [PASS][100] -> [SKIP][101] ([i915#1937])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#1397])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-tglu:         NOTRUN -> [SKIP][103] ([fdo#111644] / [i915#1397]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-9/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          [PASS][104] -> [SKIP][105] ([i915#1397])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg1-17/igt@i915_pm_rpm@dpms-non-lpsp.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][106] -> [SKIP][107] ([i915#1397])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@i915_pm_rpm@modeset-lpsp-stress.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#1397])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#1397])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#1397])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#6621])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#6621])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#8925])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#8925])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([fdo#109303])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-9/igt@i915_query@query-topology-known-pci-ids.html
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([fdo#109303])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@i915_query@query-topology-known-pci-ids.html
    - shard-rkl:          NOTRUN -> [SKIP][117] ([fdo#109303])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#6645])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4212]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2:
    - shard-glk:          [PASS][120] -> [FAIL][121] ([i915#2521])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#8709]) +11 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#8502]) +7 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [FAIL][124] ([i915#8247]) +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html
    - shard-rkl:          NOTRUN -> [FAIL][125] ([i915#8247]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][126] ([i915#8247]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb1/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#404])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][128] ([fdo#109271] / [i915#1769])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#5286])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
    - shard-tglu:         NOTRUN -> [SKIP][130] ([fdo#111615] / [i915#5286])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([fdo#111614])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#5286])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][133] -> [FAIL][134] ([i915#5138])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4538] / [i915#5286]) +3 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([fdo#111614]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#3638])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([fdo#111614] / [i915#3638])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-tglu:         NOTRUN -> [SKIP][139] ([fdo#111614])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-mtlp:         [PASS][140] -> [FAIL][141] ([i915#3743])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#6187])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#5190]) +6 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#4538] / [i915#5190]) +4 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([fdo#110723])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
    - shard-tglu:         NOTRUN -> [SKIP][146] ([fdo#111615])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([fdo#111615])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#4538]) +3 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3689] / [i915#5354]) +13 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#3734] / [i915#5354] / [i915#6095]) +1 similar issue
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][151] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-5/igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#5354] / [i915#6095]) +2 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-2/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#6095]) +11 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3886] / [i915#5354] / [i915#6095])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][157] ([fdo#109271] / [i915#3886]) +1 similar issue
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk9/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#5354]) +7 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-2/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#3886] / [i915#6095]) +1 similar issue
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3689] / [i915#3886] / [i915#5354]) +4 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#5354] / [i915#6095]) +5 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-10/igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#5354] / [i915#6095]) +15 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#3689] / [i915#5354] / [i915#6095]) +2 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#3689] / [i915#5354] / [i915#6095]) +10 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#3742])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7213]) +3 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#4087]) +3 similar issues
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-1/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#4087]) +3 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#7828]) +2 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-9/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([fdo#111827])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([fdo#111827])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#7828]) +5 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#7828]) +3 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#7828])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#7828]) +6 similar issues
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-dg2:          NOTRUN -> [TIMEOUT][176] ([i915#7173])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#3116])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#3116] / [i915#3299])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#7116])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#7118])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2:          NOTRUN -> [FAIL][181] ([i915#1339])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3359]) +1 similar issue
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3359])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#3546])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([fdo#109274] / [i915#5354])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([fdo#111825]) +21 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([fdo#111825]) +2 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [PASS][188] -> [FAIL][189] ([i915#2346])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          [PASS][190] -> [FAIL][191] ([i915#2346])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#4213])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#4103] / [i915#4213])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3555]) +3 similar issues
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#8812])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#8812])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#3555] / [i915#3840])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([fdo#109274]) +1 similar issue
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#3637]) +1 similar issue
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([fdo#109274] / [i915#3637])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2:
    - shard-glk:          [PASS][201] -> [FAIL][202] ([i915#2122])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#8810])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#2672]) +7 similar issues
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#2672])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#2587] / [i915#2672])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#2587] / [i915#2672]) +1 similar issue
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#2672])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#2672] / [i915#3555])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([fdo#109285])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][211] -> [FAIL][212] ([i915#6880]) +2 similar issues
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#8708]) +10 similar issues
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#5354]) +26 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3023]) +5 similar issues
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([fdo#110189]) +6 similar issues
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#3458]) +12 similar issues
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][218] ([fdo#109271]) +7 similar issues
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#8708]) +3 similar issues
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#1825]) +10 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([fdo#111825] / [i915#1825]) +16 similar issues
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
    - shard-tglu:         NOTRUN -> [SKIP][222] ([fdo#109280]) +14 similar issues
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#3458]) +10 similar issues
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#8708]) +14 similar issues
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#3555] / [i915#8228]) +1 similar issue
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_hdr@static-swap.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#6301])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#6301])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([fdo#109289]) +1 similar issue
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane@pixel-format@pipe-b-planes:
    - shard-mtlp:         [PASS][229] -> [FAIL][230] ([i915#1623])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@kms_plane@pixel-format@pipe-b-planes.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@kms_plane@pixel-format@pipe-b-planes.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#3555] / [i915#8821])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#3555]) +2 similar issues
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([fdo#109274]) +1 similar issue
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#6953])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#5176]) +7 similar issues
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#5176]) +7 similar issues
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#5176]) +7 similar issues
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#5235]) +7 similar issues
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#5235]) +23 similar issues
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#5235]) +3 similar issues
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][241] ([fdo#109271]) +248 similar issues
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#5235]) +7 similar issues
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#5235]) +7 similar issues
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#6524] / [i915#6805])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#6524])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][246] ([fdo#109271] / [i915#658])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk9/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([fdo#111068] / [i915#658])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-tglu:         NOTRUN -> [SKIP][248] ([fdo#111068] / [i915#658])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([fdo#111068] / [i915#658]) +1 similar issue
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#1072]) +2 similar issues
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_psr@psr2_cursor_mmap_cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#1072]) +1 similar issue
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#1072]) +4 similar issues
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([fdo#111615] / [i915#5289])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#4235] / [i915#5190])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#4235])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#4235])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_selftest@drm_plane:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#8661]) +1 similar issue
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_selftest@drm_plane.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#8809])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#4070] / [i915#6768])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_vblank@pipe-c-ts-continuation-modeset.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#4070] / [i915#533] / [i915#6768])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#3555])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#2437])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#2437])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@enable-disable@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][264] ([i915#8724])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#8850])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][266] ([i915#6806])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-mtlp:         [PASS][267] -> [FAIL][268] ([i915#5234])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-mtlp:         [PASS][269] -> [FAIL][270] ([i915#4349]) +3 similar issues
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-8/igt@perf_pmu@semaphore-busy@vcs1.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][271] ([i915#5493])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#3708] / [i915#4077])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@coherency-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][273] ([i915#8445])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@prime_vgem@coherency-blt.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#3708] / [i915#4077])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@prime_vgem@coherency-gtt.html

  * igt@syncobj_wait@wait-all-for-submit-delayed-submit:
    - shard-mtlp:         [PASS][275] -> [DMESG-WARN][276] ([i915#1982])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@syncobj_wait@wait-all-for-submit-delayed-submit.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@syncobj_wait@wait-all-for-submit-delayed-submit.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-mtlp:         [PASS][277] -> [ABORT][278] ([i915#8521] / [i915#8865])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([fdo#109307])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#4818])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_get_bo_offset@create-get-offsets:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#2575]) +7 similar issues
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@v3d/v3d_get_bo_offset@create-get-offsets.html

  * igt@v3d/v3d_job_submission@array-job-submission:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([fdo#109315]) +3 similar issues
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@v3d/v3d_job_submission@array-job-submission.html
    - shard-tglu:         NOTRUN -> [SKIP][283] ([fdo#109315] / [i915#2575]) +3 similar issues
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-9/igt@v3d/v3d_job_submission@array-job-submission.html

  * igt@v3d/v3d_submit_cl@bad-bo:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#2575]) +4 similar issues
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@v3d/v3d_submit_cl@bad-bo.html

  * igt@v3d/v3d_submit_cl@single-out-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#2575]) +1 similar issue
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-6/igt@v3d/v3d_submit_cl@single-out-sync.html

  * igt@v3d/v3d_submit_csd@bad-pad:
    - shard-glk:          NOTRUN -> [SKIP][286] ([fdo#109271]) +45 similar issues
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk5/igt@v3d/v3d_submit_csd@bad-pad.html

  * igt@vc4/vc4_create_bo@create-bo-zeroed:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#7711]) +4 similar issues
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@vc4/vc4_create_bo@create-bo-zeroed.html
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#7711]) +1 similar issue
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@vc4/vc4_create_bo@create-bo-zeroed.html

  * igt@vc4/vc4_perfmon@get-values-invalid-pointer:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#2575]) +1 similar issue
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-8/igt@vc4/vc4_perfmon@get-values-invalid-pointer.html

  * igt@vc4/vc4_purgeable_bo@mark-willneed:
    - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#7711]) +2 similar issues
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@vc4/vc4_purgeable_bo@mark-willneed.html

  * igt@vc4/vc4_tiling@get-bad-handle:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#7711]) +4 similar issues
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@vc4/vc4_tiling@get-bad-handle.html

  
#### Possible fixes ####

  * igt@api_intel_allocator@default-alignment:
    - shard-dg2:          [SKIP][292] ([fdo#109315]) -> [PASS][293] +36 similar issues
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@api_intel_allocator@default-alignment.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@api_intel_allocator@default-alignment.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [SKIP][294] ([i915#9057]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][296] ([i915#7742]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@fbdev@info:
    - shard-dg2:          [SKIP][298] ([i915#1849] / [i915#2582]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@fbdev@info.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - shard-dg2:          [SKIP][300] ([i915#2582]) -> [PASS][301] +1 similar issue
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@fbdev@nullptr.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@fbdev@nullptr.html

  * igt@gem_ctx_persistence@engines-hang@vcs0:
    - shard-mtlp:         [FAIL][302] ([i915#2410]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@gem_ctx_persistence@engines-hang@vcs0.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@gem_ctx_persistence@engines-hang@vcs0.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-mtlp:         [ABORT][304] ([i915#8503]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-7/igt@gem_eio@in-flight-contexts-1us.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_capture@pi@ccs0:
    - shard-mtlp:         [FAIL][306] ([i915#7765]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-4/igt@gem_exec_capture@pi@ccs0.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@gem_exec_capture@pi@ccs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][308] ([i915#2846]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk4/igt@gem_exec_fair@basic-deadline.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-rkl:          [FAIL][310] ([i915#2842]) -> [PASS][311] +2 similar issues
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-rkl-2/igt@gem_exec_fair@basic-pace@bcs0.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-tglu:         [ABORT][312] ([i915#7975] / [i915#8213]) -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_userptr_blits@nohangcheck:
    - shard-mtlp:         [FAIL][314] ([i915#6268]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-6/igt@gem_userptr_blits@nohangcheck.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-1/igt@gem_userptr_blits@nohangcheck.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][316] ([i915#5566]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk8/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][318] ([i915#3989] / [i915#454]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-tglu-6/igt@i915_pm_dc@dc6-dpms.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_freq_api@freq-basic-api@gt0:
    - shard-mtlp:         [FAIL][320] ([i915#8670]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-8/igt@i915_pm_freq_api@freq-basic-api@gt0.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@i915_pm_freq_api@freq-basic-api@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-mtlp:         [SKIP][322] ([i915#8403]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-8/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][324] ([i915#5174]) -> [PASS][325] +6 similar issues
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [SKIP][326] ([i915#1397]) -> [PASS][327] +3 similar issues
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-dg1:          [SKIP][328] ([i915#1397]) -> [PASS][329] +1 similar issue
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg1-17/igt@i915_pm_rpm@modeset-lpsp.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-mtlp:         [DMESG-FAIL][330] ([i915#7059]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@i915_selftest@live@gt_mocs.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@requests:
    - shard-mtlp:         [DMESG-FAIL][332] ([i915#8497]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@i915_selftest@live@requests.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - shard-mtlp:         [DMESG-WARN][334] ([i915#6367]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@i915_selftest@live@slpc.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@i915_selftest@live@slpc.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [DMESG-FAIL][336] ([i915#6763]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@i915_selftest@live@workarounds.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@i915_selftest@live@workarounds.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][338] ([i915#2521]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-glk:          [FAIL][340] ([i915#2521]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][342] ([i915#5138]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         [FAIL][344] ([i915#3743]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][346] ([i915#72]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][348] ([i915#2346]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [SKIP][350] ([i915#2575]) -> [PASS][351] +279 similar issues
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_dp_aux_dev.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_dp_aux_dev.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [FAIL][352] ([i915#79]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:
    - shard-mtlp:         [DMESG-WARN][354] ([i915#1982]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-3/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-1/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html

  * igt@kms_flip_event_leak@basic@pipe-a-edp-1:
    - shard-mtlp:         [DMESG-WARN][356] ([i915#2017]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@kms_flip_event_leak@basic@pipe-a-edp-1.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_flip_event_leak@basic@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
    - shard-apl:          [ABORT][358] ([i915#180]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][360] ([i915#8292]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-tglu-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [SKIP][362] ([i915#5608]) -> [PASS][363] +6 similar issues
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-mtlp:         [FAIL][364] ([i915#8332]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-6/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@sysfs_heartbeat_interval@precise@vecs0.html

  * igt@tools_test@tools_test:
    - shard-dg2:          [FAIL][366] ([i915#9030]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@tools_test@tools_test.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@tools_test@tools_test.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          [SKIP][368] ([i915#2575]) -> [SKIP][369] ([i915#8411]) +2 similar issues
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          [SKIP][370] ([i915#5608]) -> [SKIP][371] ([i915#8414]) +2 similar issues
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@drm_fdinfo@all-busy-idle-check-all.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@drm_fdinfo@all-busy-idle-check-all.html

  * igt@feature_discovery@psr1:
    - shard-dg2:          [SKIP][372] ([i915#2575]) -> [SKIP][373] ([i915#658])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@feature_discovery@psr1.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@feature_discovery@psr1.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          [SKIP][374] ([i915#2575]) -> [SKIP][375] ([i915#8562])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_create@create-ext-set-pat.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg2:          [SKIP][376] ([i915#2575]) -> [SKIP][377] ([fdo#109314])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_ctx_param@set-priority-not-supported.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          [SKIP][378] ([i915#2575]) -> [SKIP][379] ([i915#8555])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          [SKIP][380] ([i915#2575]) -> [SKIP][381] ([i915#4771])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          [SKIP][382] ([i915#2575]) -> [SKIP][383] ([i915#4812]) +2 similar issues
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          [SKIP][384] ([i915#2575]) -> [SKIP][385] ([i915#3539])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_fair@basic-sync.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          [SKIP][386] ([i915#2575]) -> [SKIP][387] ([i915#3539] / [i915#4852]) +8 similar issues
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          [SKIP][388] ([i915#2575]) -> [SKIP][389] ([fdo#112283])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_params@secure-non-root.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          [SKIP][390] ([i915#2575]) -> [SKIP][391] ([i915#3281]) +23 similar issues
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          [SKIP][392] ([i915#2575]) -> [SKIP][393] ([i915#4537] / [i915#4812]) +1 similar issue
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          [SKIP][394] ([i915#2575]) -> [SKIP][395] ([i915#4860])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg2:          [SKIP][396] ([i915#2575]) -> [SKIP][397] ([i915#4077]) +18 similar issues
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          [SKIP][398] ([i915#2575]) -> [SKIP][399] ([i915#4083]) +11 similar issues
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_mmap_wc@copy.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          [SKIP][400] ([i915#2575]) -> [SKIP][401] ([i915#3282]) +10 similar issues
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-uncached.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          [SKIP][402] ([i915#2575]) -> [SKIP][403] ([i915#4270]) +7 similar issues
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_pxp@display-protected-crc.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_pxp@display-protected-crc.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          [SKIP][404] ([i915#2575]) -> [SKIP][405] ([i915#4079])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          [SKIP][406] ([i915#2575]) -> [SKIP][407] ([i915#3297] / [i915#4958])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_userptr_blits@sd-probe.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg2:          [SKIP][408] ([i915#2575]) -> [SKIP][409] ([i915#3297]) +2 similar issues
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap-after-close.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-dg2:          [SKIP][410] ([i915#2575]) -> [SKIP][411] ([fdo#109289]) +5 similar issues
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gen7_exec_parse@batch-without-end.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          [SKIP][412] ([i915#2575]) -> [SKIP][413] ([i915#2856]) +7 similar issues
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-dg2:          [SKIP][414] ([i915#2575]) -> [SKIP][415] ([i915#5354] / [i915#7561]) +1 similar issue
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [SKIP][416] ([i915#5174]) -> [SKIP][417] ([i915#1397])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_rpm@dpms-non-lpsp.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@fences:
    - shard-dg2:          [SKIP][418] ([i915#5174]) -> [SKIP][419] ([i915#4077])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_rpm@fences.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-dg2:          [SKIP][420] ([i915#5174]) -> [SKIP][421] ([fdo#109506]) +1 similar issue
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_rpm@pc8-residency.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          [SKIP][422] ([i915#2575]) -> [SKIP][423] ([i915#6621]) +1 similar issue
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          [SKIP][424] ([i915#2575]) -> [SKIP][425] ([i915#6188])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          [SKIP][426] ([i915#2575]) -> [SKIP][427] ([fdo#109302])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_query@query-topology-unsupported.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          [SKIP][428] ([i915#2575] / [i915#5190]) -> [SKIP][429] ([i915#5190]) +13 similar issues
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          [SKIP][430] ([i915#2575]) -> [SKIP][431] ([i915#4212]) +2 similar issues
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          [SKIP][432] ([i915#2575]) -> [SKIP][433] ([i915#404])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          [SKIP][434] ([i915#2575]) -> [SKIP][435] ([i915#1769] / [i915#3555]) +1 similar issue
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][436] ([fdo#109315]) -> [SKIP][437] ([fdo#111614]) +9 similar issues
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][438] ([fdo#109315] / [i915#5190]) -> [SKIP][439] ([i915#5190]) +12 similar issues
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][440] ([fdo#109315] / [i915#5190]) -> [SKIP][441] ([i915#4538] / [i915#5190]) +7 similar issues
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          [SKIP][442] ([i915#2575]) -> [SKIP][443] ([i915#3689] / [i915#3886] / [i915#5354]) +12 similar issues
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:
    - shard-dg2:          [SKIP][444] ([i915#2575]) -> [SKIP][445] ([i915#5354]) +33 similar issues
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          [SKIP][446] ([i915#2575]) -> [SKIP][447] ([i915#3689] / [i915#5354]) +35 similar issues
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2:          [SKIP][448] ([i915#2575]) -> [SKIP][449] ([fdo#111827]) +2 similar issues
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_chamelium_color@ctm-green-to-red.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          [SKIP][450] ([i915#2575]) -> [SKIP][451] ([i915#7828]) +16 similar issues
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          [SKIP][452] ([i915#2575]) -> [SKIP][453] ([i915#3299]) +1 similar issue
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [SKIP][454] ([i915#2575]) -> [SKIP][455] ([i915#7118])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_content_protection@legacy.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][456] ([i915#7118] / [i915#7162]) -> [SKIP][457] ([i915#7118])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-12/igt@kms_content_protection@type1.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg2:          [SKIP][458] ([i915#2575]) -> [SKIP][459] ([i915#3555]) +2 similar issues
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          [SKIP][460] ([i915#2575]) -> [SKIP][461] ([i915#3359]) +3 similar issues
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2:          [SKIP][462] ([i915#2575]) -> [SKIP][463] ([i915#4103] / [i915#4213])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_cursor_legacy@

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/index.html

--===============0155473112239454647==
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
<tr><td><b>Series:</b></td><td>tests/msm: Add submitoverhead benchmark (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121909/">https://patchwork.freedesktop.org/series/121909/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7441_full -&gt; IGTPW_9603_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9603_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@drm_fdinfo@all-busy-check-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@drm_fdinfo@busy-hang@bcs0.html">SKIP</a> ([i915#8414]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-8/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#4098] / [i915#5325])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#5325])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#5325])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-6/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#5325])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@gem_ctx_persistence@engines-hostile@vcs0.html">FAIL</a> ([i915#2410]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@file:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb1/igt@gem_ctx_persistence@file.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html">SKIP</a> ([i915#5882]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb5/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> ([i915#8841]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@gem_eio@kms.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-1/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> ([i915#6334]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> ([i915#6334]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-tglu-5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-rkl-4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_exec_fence@submit67.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">DMESG-FAIL</a> ([i915#9121])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> ([i915#3539]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@gem_exec_reloc@basic-write-cpu-active.html">SKIP</a> ([i915#3281]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-6/igt@gem_exec_schedule@preempt-engines@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html">FAIL</a> ([i915#9119]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-6/igt@gem_exec_schedule@preempt-engines@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@rcs0.html">DMESG-FAIL</a> ([i915#8962] / [i915#9121])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#4860])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#4860])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-8/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_lmem_swapping@verify-ccs@lmem0.html">SKIP</a> ([i915#4565]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_mmap@big-bo.html">SKIP</a> ([i915#4083]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_mmap_gtt@basic.html">SKIP</a> ([i915#4077]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@gem_mmap_gtt@basic-wc.html">SKIP</a> ([i915#4077]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-bo-tiledy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_mmap_gtt@big-bo-tiledy.html">SKIP</a> ([i915#4077]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read-distinct:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@gem_mmap_wc@write-read-distinct.html">SKIP</a> ([i915#4083]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> ([i915#4083]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb1/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-5/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@gem_readwrite@write-bad-handle.html">SKIP</a> ([i915#3282]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#8428])</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@gem_tiled_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-6/igt@gen3_render_tiledy_blits.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> ([i915#2527] / [i915#2856])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> ([i915#2527])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2527]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@detector@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-6/igt@i915_hangman@detector@vcs0.html">FAIL</a> ([i915#8456]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@i915_hangman@gt-engine-hang@vcs0.html">FAIL</a> ([i915#7069]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hwmon@hwmon-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@i915_hwmon@hwmon-read.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb4/igt@i915_module_load@load.html">SKIP</a> ([fdo#109271] / [i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#7061] / [i915#8617])</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#8489] / [i915#8668])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-3/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">FAIL</a> ([i915#8691])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@i915_pm_backlight@bad-brightness.html">SKIP</a> ([i915#5354] / [i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@i915_pm_dc@dc5-psr.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#1397])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-9/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg1-17/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#1397])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#1397])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-9/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> ([i915#6645])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2.html">FAIL</a> ([i915#2521])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc.html">SKIP</a> ([i915#8709]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html">SKIP</a> ([i915#8502]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#8247]) +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#8247]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb1/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#8247]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([fdo#109271] / [i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#5286])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111615] / [i915#5286])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#5190]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5190]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([fdo#110723])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([fdo#111615])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([i915#4538]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs.html">SKIP</a> ([i915#3734] / [i915#5354] / [i915#6095]) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-5/igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-2/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#6095]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#5354] / [i915#6095])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk9/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-2/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#6095]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-10/igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#7213]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-1/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> ([i915#4087]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#4087]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-9/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> ([i915#7828]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> ([i915#7828]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#7828]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_content_protection@atomic@pipe-a-dp-2.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> ([i915#1339])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> ([i915#3546])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([fdo#109274] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> ([fdo#111825]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#111825]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> ([i915#3555]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([i915#3637]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> ([fdo#109274] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">FAIL</a> ([i915#6880]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> ([i915#5354]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#3023]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#110189]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> ([i915#3458]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> ([fdo#109271]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +16 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([fdo#109280]) +14 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> ([i915#3458]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-2/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-planes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@kms_plane@pixel-format@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@kms_plane@pixel-format@pipe-b-planes.html">FAIL</a> ([i915#1623])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-dp-4.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-4.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4.html">SKIP</a> ([i915#5235]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-snb2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html">SKIP</a> ([fdo#109271]) +248 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html">SKIP</a> ([i915#5235]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk9/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([i915#1072]) +2 similar issues</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([i915#1072]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([i915#1072]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([fdo#111615] / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#4235] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_plane:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-16/igt@kms_selftest@drm_plane.html">SKIP</a> ([i915#8661]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_vblank@pipe-c-ts-continuation-modeset.html">SKIP</a> ([i915#4070] / [i915#6768])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html">SKIP</a> ([i915#4070] / [i915#533] / [i915#6768])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-18/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html">FAIL</a> ([i915#8724])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@perf_pmu@frequency@gt0.html">FAIL</a> ([i915#6806])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#5234])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-8/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> ([i915#4349]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@prime_vgem@basic-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@prime_vgem@coherency-blt.html">FAIL</a> ([i915#8445])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-14/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@wait-all-for-submit-delayed-submit:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@syncobj_wait@wait-all-for-submit-delayed-submit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@syncobj_wait@wait-all-for-submit-delayed-submit.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@sysfs_preempt_timeout@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html">ABORT</a> ([i915#8521] / [i915#8865])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_bo_offset@create-get-offsets:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-17/igt@v3d/v3d_get_bo_offset@create-get-offsets.html">SKIP</a> ([i915#2575]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@array-job-submission:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@v3d/v3d_job_submission@array-job-submission.html">SKIP</a> ([fdo#109315]) +3 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-9/igt@v3d/v3d_job_submission@array-job-submission.html">SKIP</a> ([fdo#109315] / [i915#2575]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@v3d/v3d_submit_cl@bad-bo.html">SKIP</a> ([i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@single-out-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-6/igt@v3d/v3d_submit_cl@single-out-sync.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-pad:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk5/igt@v3d/v3d_submit_csd@bad-pad.html">SKIP</a> ([fdo#109271]) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_create_bo@create-bo-zeroed:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@vc4/vc4_create_bo@create-bo-zeroed.html">SKIP</a> ([i915#7711]) +4 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@vc4/vc4_create_bo@create-bo-zeroed.html">SKIP</a> ([i915#7711]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@get-values-invalid-pointer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-8/igt@vc4/vc4_perfmon@get-values-invalid-pointer.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-willneed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@vc4/vc4_purgeable_bo@mark-willneed.html">SKIP</a> ([i915#7711]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-handle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@vc4/vc4_tiling@get-bad-handle.html">SKIP</a> ([i915#7711]) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_allocator@default-alignment:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@api_intel_allocator@default-alignment.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@api_intel_allocator@default-alignment.html">PASS</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> ([i915#9057]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@fbdev@info.html">SKIP</a> ([i915#1849] / [i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@fbdev@nullptr.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@fbdev@nullptr.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@gem_ctx_persistence@engines-hang@vcs0.html">FAIL</a> ([i915#2410]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@gem_ctx_persistence@engines-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-7/igt@gem_eio@in-flight-contexts-1us.html">ABORT</a> ([i915#8503]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-4/igt@gem_exec_capture@pi@ccs0.html">FAIL</a> ([i915#7765]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-2/igt@gem_exec_capture@pi@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk1/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-rkl-2/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-4/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> ([i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-7/igt@gem_exec_suspend@basic-s4-devices@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-6/igt@gem_userptr_blits@nohangcheck.html">FAIL</a> ([i915#6268]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-1/igt@gem_userptr_blits@nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk9/igt@gen9_exec_parse@allowed-single.html">ABORT</a> ([i915#5566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk8/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-tglu-6/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#3989] / [i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api@gt0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-8/igt@i915_pm_freq_api@freq-basic-api@gt0.html">FAIL</a> ([i915#8670]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@i915_pm_freq_api@freq-basic-api@gt0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-8/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> ([i915#8403]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-rkl-1/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg1-17/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> ([i915#7059]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> ([i915#8497]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> ([i915#6367]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> ([i915#6763]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">FAIL</a> ([i915#2521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#2521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">FAIL</a> ([i915#72]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_dp_aux_dev.html">PASS</a> +279 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-3/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-1/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-2/igt@kms_flip_event_leak@basic@pipe-a-edp-1.html">DMESG-WARN</a> ([i915#2017]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@kms_flip_event_leak@basic@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html">ABORT</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-tglu-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-mtlp-6/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> ([i915#8332]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-mtlp-3/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@tools_test@tools_test:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@tools_test@tools_test.html">FAIL</a> ([i915#9030]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@tools_test@tools_test.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> ([i915#8414]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@feature_discovery@psr1.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a> ([i915#4077]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([fdo#109289]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354] / [i915#7561]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_rpm@fences.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@i915_pm_rpm@fences.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([i915#2575] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([i915#5190]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354]) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> ([fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-10/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-12/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#7162]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-1/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-12/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> ([i915#3555]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/shard-dg2-2/igt@kms_cursor_legacy@">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0155473112239454647==--
