Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2376918045140165936=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Fri, 30 Jun 2023 18:48:04 -0000
Message-ID: <168815088488.24874.13103165956297574009@emeril.freedesktop.org>
References: <20230628084528.18779-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230628084528.18779-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fmadvise=3A_fix_dontneed-*-mmap_subtests?=
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

--===============2376918045140165936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_madvise: fix dontneed-*-mmap subtests
URL   : https://patchwork.freedesktop.org/series/119962/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13329_full -> IGTPW_9288_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_9288_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9288_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9288_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          [SKIP][1] ([i915#4579]) -> [SKIP][2] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html
    - shard-rkl:          [SKIP][3] ([i915#4579]) -> [SKIP][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html
    - shard-tglu:         [SKIP][5] ([i915#4579]) -> [SKIP][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-9/igt@kms_plane_lowres@tiling-yf.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@kms_plane_lowres@tiling-yf.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - {shard-dg1}:        [SKIP][7] ([i915#4579]) -> [SKIP][8] +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-gtt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_9288_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#6230])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@api_intel_bb@crc32.html

  * igt@drm_fdinfo@busy@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8414]) +10 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@drm_fdinfo@busy@ccs0.html

  * igt@drm_fdinfo@virtual-busy-hang-all:
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8414])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@drm_fdinfo@virtual-busy-hang-all.html

  * igt@feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#658]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@feature_discovery@psr1.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#3281]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#3936])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_busy@semaphore.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#7697])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [FAIL][16] ([i915#8621])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([fdo#109314])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
    - shard-mtlp:         [PASS][18] -> [FAIL][19] ([i915#2410])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html

  * igt@gem_ctx_sseu@engines:
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][21] ([i915#7975] / [i915#8213])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-10/igt@gem_eio@hibernate.html
    - shard-rkl:          NOTRUN -> [ABORT][22] ([i915#7975] / [i915#8213])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-mtlp:         [PASS][23] -> [ABORT][24] ([i915#7941])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@gem_eio@in-flight-contexts-10ms.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][25] -> [ABORT][26] ([i915#180])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl2/igt@gem_eio@in-flight-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4812]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-dg2:          [PASS][28] -> [FAIL][29] ([i915#6032])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-10/igt@gem_exec_balancer@full-pulse.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#4525])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#6334])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-dg2:          [PASS][32] -> [TIMEOUT][33] ([i915#3778] / [i915#7016] / [i915#7921])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-10/igt@gem_exec_endless@dispatch@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][34] -> [FAIL][35] ([i915#2842])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4473] / [i915#4771])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@gem_exec_fair@basic-none-vip.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-rkl:          [PASS][37] -> [FAIL][38] ([i915#2842])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#2842]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3539])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fence@submit3:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4812])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3281]) +5 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#3281]) +9 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][46] ([fdo#103375])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4860])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4860])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#4613])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl1/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#4613])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#4613]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4613]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4077]) +8 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4077]) +5 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_offset@clear@smem0:
    - shard-dg2:          [PASS][55] -> [DMESG-WARN][56] ([i915#8304])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-5/igt@gem_mmap_offset@clear@smem0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@gem_mmap_offset@clear@smem0.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4083]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@read:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4083])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3282]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#3282]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-random:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#3282])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4270])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4270])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#4270])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-7/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4270]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#8428]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4079])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_pread_basic:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4079]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3297]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3297] / [i915#4880]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#3297])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3297])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@gem_userptr_blits@set-cache-level.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([fdo#109289]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@gen7_exec_parse@batch-without-end.html
    - shard-rkl:          NOTRUN -> [SKIP][74] ([fdo#109289]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([fdo#109289])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][76] -> [ABORT][77] ([i915#5566])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl3/igt@gen9_exec_parse@allowed-single.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl3/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#2856]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@gen9_exec_parse@batch-without-end.html
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#2527]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#2527] / [i915#2856])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-6/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_fb_tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#4881])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@i915_fb_tiling.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#6412])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#3361])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271]) +53 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl2/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([fdo#109289] / [i915#8403])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [PASS][86] -> [FAIL][87] ([i915#8230])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#1397])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#8431])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-dg2:          [PASS][90] -> [SKIP][91] ([i915#1397]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [PASS][92] -> [FAIL][93] ([i915#6537])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl2/igt@i915_pm_rps@engine-order.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl4/igt@i915_pm_rps@engine-order.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#6621])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         NOTRUN -> [FAIL][95] ([i915#8346])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-mtlp:         [PASS][96] -> [DMESG-FAIL][97] ([i915#7059])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@i915_selftest@live@gt_mocs.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@i915_selftest@live@gt_mocs.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4212]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#8502]) +3 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][100] ([i915#8247]) +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#1769] / [i915#3555])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#1769] / [i915#3555])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][103] ([fdo#111615] / [i915#5286])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#5286]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][105] -> [FAIL][106] ([i915#5138]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-mtlp:         NOTRUN -> [FAIL][107] ([i915#3743])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([fdo#111614]) +3 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([fdo#111614]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][110] ([fdo#111614] / [i915#3638])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         [PASS][111] -> [FAIL][112] ([i915#3743])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#5190]) +7 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([fdo#111615]) +7 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([fdo#110723])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4538] / [i915#5190])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#3886])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl7/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#3886] / [i915#6095]) +3 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#5354] / [i915#6095]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#3886] / [i915#5354] / [i915#6095])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#5354] / [i915#6095]) +4 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#6095]) +24 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#3689] / [i915#3886] / [i915#5354]) +4 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#5354]) +16 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#3689] / [i915#5354] / [i915#6095])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-3/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#3689] / [i915#5354]) +8 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-10/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#5354]) +9 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([fdo#111827]) +2 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([fdo#111827])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_chamelium_color@gamma.html
    - shard-rkl:          NOTRUN -> [SKIP][131] ([fdo#111827])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#7828])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#7828])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#7828]) +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#7828]) +5 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#7118])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][137] ([i915#7173])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#3299])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#7118])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#3359]) +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3359])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#8761]) +11 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#3555]) +3 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-max-size.html
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#3555]) +1 similar issue
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#4213])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([fdo#109274] / [i915#5354]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([fdo#109274])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([fdo#111767] / [i915#3546]) +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#3546])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [PASS][150] -> [FAIL][151] ([i915#2346])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4103] / [i915#4213])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#3804])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#3840])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#4881])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([fdo#109274]) +3 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][157] -> [FAIL][158] ([i915#79])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([fdo#109274] / [i915#3637])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-snb:          NOTRUN -> [SKIP][160] ([fdo#109271] / [fdo#111767])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-snb5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#8381])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#2587] / [i915#2672])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#5274])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#8708]) +14 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#8708]) +3 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-dg2:          [PASS][166] -> [FAIL][167] ([i915#6880])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#3458]) +5 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3023]) +5 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#1825]) +20 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([fdo#111825]) +2 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([fdo#109280]) +5 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([fdo#111825] / [i915#1825]) +7 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([fdo#110189]) +4 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][175] ([i915#4573]) +1 similar issue
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#5176]) +5 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#5176]) +3 similar issues
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#5176]) +5 similar issues
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#5235]) +3 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#5235]) +3 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][181] ([fdo#109271]) +29 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-snb2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#5235]) +15 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#5235]) +3 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-apl:          NOTRUN -> [SKIP][184] ([fdo#109271] / [i915#658])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl4/igt@kms_psr2_su@page_flip-p010.html
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#4348])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@cursor_render:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#1072]) +2 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_psr@cursor_render.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#1072]) +3 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#4235])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#5289])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#4235])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#5289])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#4235] / [i915#5190])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-rkl:          NOTRUN -> [SKIP][193] ([fdo#111615] / [i915#5289])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#3555])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#4070] / [i915#6768]) +1 similar issue
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  * igt@kms_vblank@pipe-d-accuracy-idle:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#4070] / [i915#533] / [i915#6768])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_vblank@pipe-d-accuracy-idle.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-dg2:          [PASS][197] -> [INCOMPLETE][198] ([i915#7838])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-1/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#2437])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_writeback@writeback-check-output.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#7387])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@perf@global-sseu-config-invalid.html

  * igt@perf@stress-open-close@0-rcs0:
    - shard-glk:          [PASS][201] -> [ABORT][202] ([i915#5213] / [i915#7941])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk7/igt@perf@stress-open-close@0-rcs0.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk9/igt@perf@stress-open-close@0-rcs0.html

  * igt@perf_pmu@faulting-read@gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#8440])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@perf_pmu@faulting-read@gtt.html

  * igt@prime_vgem@basic-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][204] ([i915#8445]) +1 similar issue
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@prime_vgem@basic-blt.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3291] / [i915#3708]) +1 similar issue
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([fdo#109295] / [i915#3291] / [i915#3708])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#3708])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([fdo#109295])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@prime_vgem@fence-write-hang.html

  * igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#2575]) +4 similar issues
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html

  * igt@v3d/v3d_submit_cl@bad-multisync-in-sync:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([fdo#109315] / [i915#2575])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-7/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html

  * igt@v3d/v3d_submit_cl@simple-flush-cache:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#2575]) +5 similar issues
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@v3d/v3d_submit_cl@simple-flush-cache.html

  * igt@v3d/v3d_submit_csd@bad-multisync-out-sync:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([fdo#109315]) +1 similar issue
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@v3d/v3d_submit_csd@bad-multisync-out-sync.html

  * igt@vc4/vc4_mmap@mmap-bad-handle:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#7711]) +3 similar issues
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@vc4/vc4_mmap@mmap-bad-handle.html
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#7711]) +2 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@vc4/vc4_mmap@mmap-bad-handle.html

  * igt@vc4/vc4_purgeable_bo@free-purged-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#7711]) +3 similar issues
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@vc4/vc4_purgeable_bo@free-purged-bo.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][216] ([i915#6268]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [FAIL][218] ([i915#2842]) -> [PASS][219] +1 similar issue
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][220] ([i915#2842]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglu:         [FAIL][222] ([i915#2842]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         [ABORT][224] ([i915#8131]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-mtlp:         [FAIL][226] ([i915#6363]) -> [PASS][227] +1 similar issue
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-2/igt@gem_exec_whisper@basic-normal-all.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@gem_exec_whisper@basic-normal-all.html

  * igt@i915_hangman@gt-engine-hang@vcs0:
    - shard-mtlp:         [FAIL][228] ([i915#7069]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-4/igt@i915_hangman@gt-engine-hang@vcs0.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][230] ([i915#7061]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][232] ([i915#8489]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - {shard-dg1}:        [FAIL][234] ([i915#3591]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][236] ([i915#1397]) -> [PASS][237] +1 similar issue
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-4/igt@i915_pm_rpm@dpms-lpsp.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-dg1}:        [SKIP][238] ([i915#1397]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg1-18/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_selftest@live@slpc:
    - shard-mtlp:         [DMESG-WARN][240] ([i915#6367]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@i915_selftest@live@slpc.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@i915_selftest@live@slpc.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:
    - shard-dg2:          [FAIL][242] ([fdo#103375]) -> [PASS][243] +2 similar issues
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-mtlp:         [FAIL][244] ([i915#8248]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][246] ([i915#2346]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][248] ([i915#2346]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [ABORT][250] ([i915#180]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2:          [FAIL][252] ([i915#6880]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [SKIP][254] ([i915#433]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-mtlp:         [FAIL][256] ([i915#4349]) -> [PASS][257] +2 similar issues
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-7/igt@perf_pmu@busy-double-start@vcs1.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
    - shard-mtlp:         [FAIL][258] ([i915#6015]) -> [PASS][259] +2 similar issues
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-mtlp:         [TIMEOUT][260] ([i915#7947]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@sysfs_preempt_timeout@timeout@vecs0.html

  
#### Warnings ####

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         [SKIP][262] ([i915#4579] / [i915#8414]) -> [SKIP][263] ([i915#8414]) +6 similar issues
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@drm_fdinfo@busy-check-all@ccs0.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@most-busy-check-all@ccs3:
    - shard-dg2:          [SKIP][264] ([i915#4579] / [i915#8414]) -> [SKIP][265] ([i915#8414]) +6 similar issues
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-3/igt@drm_fdinfo@most-busy-check-all@ccs3.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@drm_fdinfo@most-busy-check-all@ccs3.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][266] ([i915#3555] / [i915#4579] / [i915#5325]) -> [SKIP][267] ([i915#3555] / [i915#5325]) +1 similar issue
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html
    - shard-tglu:         [SKIP][268] ([i915#3555] / [i915#4579] / [i915#5325]) -> [SKIP][269] ([i915#3555] / [i915#5325]) +1 similar issue
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          [SKIP][270] ([i915#4098] / [i915#4579] / [i915#5325]) -> [SKIP][271] ([i915#4098] / [i915#5325])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          [SKIP][272] ([i915#4579] / [i915#5325]) -> [SKIP][273] ([i915#5325]) +1 similar issue
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-6/igt@gem_ccs@suspend-resume.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         [SKIP][274] ([i915#4579] / [i915#5325]) -> [SKIP][275] ([i915#5325]) +2 similar issues
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-4/igt@gem_ccs@suspend-resume.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@hog-create@smem0:
    - shard-dg2:          [FAIL][276] ([i915#5892] / [i915#7679]) -> [FAIL][277] ([i915#5892])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@gem_create@hog-create@smem0.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@gem_create@hog-create@smem0.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
    - shard-mtlp:         [SKIP][278] ([i915#4579] / [i915#5882]) -> [SKIP][279] ([i915#5882])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3:
    - shard-dg2:          [SKIP][280] ([i915#4579] / [i915#5882]) -> [SKIP][281] ([i915#5882])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          [SKIP][282] ([fdo#109271] / [i915#4579] / [i915#6334]) -> [SKIP][283] ([fdo#109271] / [i915#6334])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk8/igt@gem_exec_capture@capture-invisible@smem0.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk1/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-dg2:          [SKIP][284] ([i915#4579] / [i915#6334]) -> [SKIP][285] ([i915#6334])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-1/igt@gem_exec_capture@capture-invisible@smem0.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-rkl:          [SKIP][286] ([i915#4579] / [i915#6334]) -> [SKIP][287] ([i915#6334])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-tglu:         [SKIP][288] ([i915#4579] / [i915#6334]) -> [SKIP][289] ([i915#6334])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-6/igt@gem_exec_capture@capture-invisible@smem0.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-2/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-apl:          [SKIP][290] ([fdo#109271] / [i915#4579] / [i915#6334]) -> [SKIP][291] ([fdo#109271] / [i915#6334])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl1/igt@gem_exec_capture@capture-invisible@smem0.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl3/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-mtlp:         [TIMEOUT][292] ([i915#8628]) -> [ABORT][293] ([i915#8131])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-2/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [DMESG-WARN][294] ([i915#4936] / [i915#5493]) -> [TIMEOUT][295] ([i915#5493])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          [SKIP][296] ([i915#4579] / [i915#6590]) -> [SKIP][297] ([i915#6590])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         [SKIP][298] ([i915#4579] / [i915#6590]) -> [SKIP][299] ([i915#6590])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-10/igt@i915_pm_freq_mult@media-freq@gt0.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          [SKIP][300] ([fdo#109271] / [i915#1937] / [i915#4579]) -> [SKIP][301] ([fdo#109271] / [i915#1937])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          [SKIP][302] ([fdo#109271] / [i915#1937] / [i915#4579]) -> [SKIP][303] ([fdo#109271] / [i915#1937])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk9/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
    - shard-dg2:          [SKIP][304] ([i915#1937] / [i915#4579]) -> [SKIP][305] ([i915#1937])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
    - shard-rkl:          [SKIP][306] ([i915#1937] / [i915#4579]) -> [SKIP][307] ([i915#1937])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][308] ([i915#8247]) -> [DMESG-FAIL][309] ([i915#8561]) +2 similar issues
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@kms_async_flips@crc@pipe-d-edp-1.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          [SKIP][310] ([fdo#109271] / [i915#1769] / [i915#4579]) -> [SKIP][311] ([fdo#109271] / [i915#1769]) +1 similar issue
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-snb:          [SKIP][312] ([fdo#109271] / [i915#1769] / [i915#4579]) -> [SKIP][313] ([fdo#109271] / [i915#1769]) +1 similar issue
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-snb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         [SKIP][314] ([i915#1769] / [i915#3555] / [i915#4579]) -> [SKIP][315] ([i915#1769] / [i915#3555]) +1 similar issue
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-apl:          [SKIP][316] ([fdo#109271] / [i915#1769] / [i915#4579]) -> [SKIP][317] ([fdo#109271] / [i915#1769]) +1 similar issue
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg2:          [SKIP][318] ([i915#1769] / [i915#3555] / [i915#4579]) -> [SKIP][319] ([i915#1769] / [i915#3555])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          [SKIP][320] ([i915#1769] / [i915#3555] / [i915#4579]) -> [SKIP][321] ([i915#1769] / [i915#3555])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_cdclk@mode-transition@pipe-d-edp-1:
    - shard-mtlp:         [SKIP][322] ([i915#4579] / [i915#7213]) -> [SKIP][323] ([i915#7213])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@kms_cdclk@mode-transition@pipe-d-edp-1.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_cdclk@mode-transition@pipe-d-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          [SKIP][324] ([i915#4087] / [i915#4579]) -> [SKIP][325] ([i915#4087])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-d-edp-1:
    - shard-mtlp:         [SKIP][326] ([i915#4087] / [i915#4579]) -> [SKIP][327] ([i915#4087])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@kms_cdclk@plane-scaling@pipe-d-edp-1.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@kms_cdclk@plane-scaling@pipe-d-edp-1.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][328] ([i915#4579] / [i915#7118]) -> [SKIP][329] ([i915#7118]) +6 similar issues
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@kms_content_protection@srm.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][330] ([i915#4579] / [i915#7118]) -> [SKIP][331] ([i915#7118]) +4 similar issues
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-6/igt@kms_content_protection@type1.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@kms_content_protection@type1.html
    - shard-tglu:         [SKIP][332] ([i915#4579] / [i915#6944] / [i915#7116] / [i915#7118]) -> [SKIP][333] ([i915#6944] / [i915#7116] / [i915#7118]) +8 similar issues
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-7/igt@kms_content_protection@type1.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         [SKIP][334] ([i915#4579]) -> [SKIP][335] ([i915#8761]) +77 similar issues
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          [SKIP][336] ([fdo#109271] / [i915#4579]) -> [SKIP][337] ([fdo#109271]) +95 similar issues
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk7/igt@kms_cursor_crc@cursor-random-max-size.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk1/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          [SKIP][338] ([i915#3555] / [i915#4579]) -> [SKIP][339] ([i915#3555]) +34 similar issues
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [DMESG-FAIL][340] ([i915#2017] / [i915#5954]) -> [FAIL][341] ([i915#2346])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         [SKIP][342] ([i915#3804] / [i915#4579]) -> [SKIP][343] ([i915#3804])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          [SKIP][344] ([i915#3840] / [i915#4579]) -> [SKIP][345] ([i915#3840]) +1 similar issue
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@kms_dsc@dsc-basic.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          [SKIP][346] ([i915#3840] / [i915#4579]) -> [SKIP][347] ([i915#3840]) +2 similar issues
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-4/igt@kms_dsc@dsc-basic.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@kms_dsc@dsc-basic.html
    - shard-tglu:         [SKIP][348] ([i915#3840] / [i915#4579]) -> [SKIP][349] ([i915#3840]) +2 similar issues
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-8/igt@kms_dsc@dsc-basic.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][350] ([fdo#110189] / [i915#3955]) -> [SKIP][351] ([i915#3955]) +1 similar issue
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         [SKIP][352] ([i915#2587] / [i915#2672] / [i915#4579]) -> [SKIP][353] ([i915#2587] / [i915#2672]) +22 similar issues
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][354] ([i915#2672] / [i915#4579]) -> [SKIP][355] ([i915#2672]) +21 similar issues
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          [SKIP][356] ([i915#2672] / [i915#4579]) -> [SKIP][357] ([i915#2672]) +22 similar issues
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          [SKIP][358] ([i915#2672] / [i915#3555] / [i915#4579]) -> [SKIP][359] ([i915#2672] / [i915#3555])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          [SKIP][360] ([i915#4579] / [i915#6953] / [i915#8228]) -> [SKIP][361] ([i915#6953] / [i915#8228])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@kms_hdr@invalid-hdr.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          [SKIP][362] ([i915#4579] / [i915#6953] / [i915#8228]) -> [SKIP][363] ([i915#6953] / [i915#8228]) +1 similar issue
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         [SKIP][364] ([i915#4579] / [i915#6953] / [i915#8228]) -> [SKIP][365] ([i915#6953] / [i915#8228]) +1 similar issue
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-5/igt@kms_hdr@invalid-metadata-sizes.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
    - shard-mtlp:         [SKIP][366] ([i915#4579] / [i915#6403]) -> [SKIP][367] ([i915#6403])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][368] ([i915#4579] / [i915#6301]) -> [SKIP][369] ([i915#6301]) +1 similar issue
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         [SKIP][370] ([i915#4579] / [i915#6301]) -> [SKIP][371] ([i915#6301]) +1 similar issue
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-5/igt@kms_panel_fitting@legacy.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:
    - shard-mtlp:         [SKIP][372] ([i915#3582] / [i915#4579]) -> [SKIP][373] ([i915#3582]) +2 similar issues
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-3/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          [SKIP][374] ([i915#4579] / [i915#6953]) -> [SKIP][375] ([i915#6953]) +1 similar issue
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          [SKIP][376] ([i915#3555] / [i915#4579]) -> [SKIP][377] ([i915#3555]) +33 similar issues
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         [SKIP][378] ([i915#4579] / [i915#5176]) -> [SKIP][379] ([i915#5176]) +4 similar issues
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-dp-4:
    - shard-dg2:          [SKIP][380] ([i915#4579] / [i915#5176]) -> [SKIP][381] ([i915#5176]) +1 similar issue
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-dp-4.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][382] ([i915#4579] / [i915#5176]) -> [SKIP][383] ([i915#5176]) +5 similar issues
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1:
    - shard-tglu:         [SKIP][384] ([i915#4579] / [i915#5176]) -> [SKIP][385] ([i915#5176]) +8 similar issues
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-3:
    - shard-dg2:          [SKIP][386] ([i915#4579] / [i915#5235]) -> [SKIP][387] ([i915#5235]) +1 similar issue
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-3.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1:
    - shard-mtlp:         [SKIP][388] ([i915#4579] / [i915#5235]) -> [SKIP][389] ([i915#5235]) +13 similar issues
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][390] ([i915#4579] / [i915#5235]) -> [SKIP][391] ([i915#5235]) +3 similar issues
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-tglu:         [SKIP][392] ([i915#4579] / [i915#5235]) -> [SKIP][393] ([i915#5235]) +4 similar issues
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-apl:          [SKIP][394] ([fdo#109271] / [i915#4579]) -> [SKIP][395] ([fdo#109271]) +83 similar issues
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl6/igt@kms_scaling_modes@scaling-mode-center.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl7/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         [SKIP][396] ([i915#3555] / [i915#4579]) -> [SKIP][397] ([i915#3555]) +39 similar issues
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          [SKIP][398] ([i915#3555] / [i915#4098] / [i915#4579]) -> [SKIP][399] ([i915#3555] / [i915#4098]) +4 similar issues
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vrr@flip-suspend:
    - shard-snb:          [SKIP][400] ([fdo#109271] / [i915#4579]) -> [SKIP][401] ([fdo#109271]) +146 similar issues
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-snb4/igt@kms_vrr@flip-suspend.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-snb7/igt@kms_vrr@flip-suspend.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          [FAIL][402] ([i915#7484]) -> [FAIL][403] ([i915#7757])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@perf@non-zero-reason@0-rcs0.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          [SKIP][404] ([fdo#112283] / [i915#4579]) -> [SKIP][405] ([fdo#112283])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-6/igt@perf_pmu@event-wait@rcs0.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@perf_pmu@event-wait@rcs0.html
    - shard-rkl:          [SKIP][406] ([fdo#112283] / [i915#4579]) -> [SKIP][407] ([fdo#112283])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@perf_pmu@event-wait@rcs0.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglu:         [SKIP][408] ([fdo#112283] / [i915#4579]) -> [SKIP][409] ([fdo#112283])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-7/igt@perf_pmu@event-wait@rcs0.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-5/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          [INCOMPLETE][410] ([i915#5493]) -> [CRASH][411] ([i915#7331])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/intel/issues/3582
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5882]: https://gitlab.freedesktop.org/drm/intel/issues/5882
  [i915#5892]: https://gitlab.freedesktop.org/drm/intel/issues/5892
  [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
  [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
  [i915#6032]: https://gitlab.freedesktop.org/drm/intel/issues/6032
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6363]: https://gitlab.freedesktop.org/drm/intel/issues/6363
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7016]: https://gitlab.freedesktop.org/drm/intel/issues/7016
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7331]: https://gitlab.freedesktop.org/drm/intel/issues/7331
  [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
  [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
  [i915#7679]: https://gitlab.freedesktop.org/drm/intel/issues/7679
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7757]: https://gitlab.freedesktop.org/drm/intel/issues/7757
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7838]: https://gitlab.freedesktop.org/drm/intel/issues/7838
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7921]: https://gitlab.freedesktop.org/drm/intel/issues/7921
  [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
  [i915#7947]: https://gitlab.freedesktop.org/drm/intel/issues/7947
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8131]: https://gitlab.freedesktop.org/drm/intel/issues/8131
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/is

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/index.html

--===============2376918045140165936==
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
<tr><td><b>Series:</b></td><td>i915/gem_madvise: fix dontneed-*-mmap subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119962/">https://patchwork.freedesktop.org/series/119962/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13329_full -&gt; IGTPW_9288_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_9288_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9288_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9288_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> +7 similar issues</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-9/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_draw_crc@draw-method-mmap-gtt:<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9288_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@drm_fdinfo@busy@ccs0.html">SKIP</a> ([i915#8414]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-6/igt@gem_create@create-ext-set-pat.html">FAIL</a> ([i915#8621])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@bsd1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-10/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/is">i915#8213</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/is">i915#8213</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@gem_eio@in-flight-contexts-10ms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7941">i915#7941</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl2/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl7/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-pulse:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-10/igt@gem_exec_balancer@full-pulse.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@gem_exec_balancer@full-pulse.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6032">i915#6032</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-10/igt@gem_exec_endless@dispatch@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@gem_exec_endless@dispatch@rcs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3778</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7016">i915#7016</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7921">i915#7921</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@gem_exec_fair@basic-none-vip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@gem_exec_suspend@basic-s3@lmem0.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl1/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear@smem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-5/igt@gem_mmap_offset@clear@smem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@gem_mmap_offset@clear@smem0.html">DMESG-WARN</a> ([i915#8304])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@gem_mmap_wc@bad-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@gem_mmap_wc@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@gem_pwrite@basic-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-7/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#8428]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880">i915#4880</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@gem_userptr_blits@set-cache-level.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl3/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl3/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@i915_fb_tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl2/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a> / [i915#8403])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> ([i915#8230])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html">SKIP</a> ([i915#8431])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl2/igt@i915_pm_rps@engine-order.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl4/igt@i915_pm_rps@engine-order.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6537">i915#6537</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@i915_pm_rps@waitboost.html">FAIL</a> ([i915#8346])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html">SKIP</a> ([i915#8502]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#8247]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl7/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-3/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-10/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +8 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +9 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> ([i915#8761]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-snb5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-snb2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4348">i915#4348</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_psr@cursor_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-accuracy-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_vblank@pipe-d-accuracy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-1/igt@kms_vblank@pipe-d-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_vblank@pipe-d-ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7838">i915#7838</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close@0-rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk7/igt@perf@stress-open-close@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk9/igt@perf@stress-open-close@0-rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7941">i915#7941</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@faulting-read@gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@perf_pmu@faulting-read@gtt.html">SKIP</a> ([i915#8440])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@prime_vgem@basic-blt.html">FAIL</a> ([i915#8445]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-in-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-7/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@simple-flush-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@v3d/v3d_submit_cl@simple-flush-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-out-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@v3d/v3d_submit_csd@bad-multisync-out-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bad-handle:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@vc4/vc4_mmap@mmap-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@vc4/vc4_mmap@mmap-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@free-purged-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@vc4/vc4_purgeable_bo@free-purged-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@gem_exec_fair@basic-none@bcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8131">i915#8131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-2/igt@gem_exec_whisper@basic-normal-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6363">i915#6363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@gem_exec_whisper@basic-normal-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-4/igt@i915_hangman@gt-engine-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7061">i915#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#8489]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-4/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg1-18/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-5/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#8248]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-7/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7947">i915#7947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@sysfs_preempt_timeout@timeout@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / [i915#8414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> ([i915#8414]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@ccs3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-3/igt@drm_fdinfo@most-busy-check-all@ccs3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / [i915#8414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@drm_fdinfo@most-busy-check-all@ccs3.html">SKIP</a> ([i915#8414]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-4/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-5/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@hog-create@smem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@gem_create@hog-create@smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5892">i915#5892</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7679">i915#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@gem_create@hog-create@smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5892">i915#5892</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5882">i915#5882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5882">i915#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5882">i915#5882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5882">i915#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk8/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</p>
</li>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-6/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-2/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl3/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-2/igt@gem_exec_whisper@basic-contexts-forked-all.html">TIMEOUT</a> ([i915#8628]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@gem_exec_whisper@basic-contexts-forked-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8131">i915#8131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4936">i915#4936</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-10/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk9/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</p>
</li>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@kms_async_flips@crc@pipe-d-edp-1.html">FAIL</a> ([i915#8247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-2/igt@kms_async_flips@crc@pipe-d-edp-1.html">DMESG-FAIL</a> ([i915#8561]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-snb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>) +1 similar issue</p>
</li>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@kms_cdclk@mode-transition@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_cdclk@mode-transition@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@kms_cdclk@plane-scaling@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-4/igt@kms_cdclk@plane-scaling@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +4 similar issues</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([i915#8761]) +77 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk7/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-glk1/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +95 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +34 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3804">i915#3804</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / [i915#8228]) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / [i915#8228]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6403">i915#6403</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-3/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6403">i915#6403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-3/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3582">i915#3582</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-1/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3582">i915#3582</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl6/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-apl7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +83 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-snb4/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-snb7/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +146 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7484">i915#7484</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7757">i915#7757</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-6/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-2/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-rkl-6/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-7/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-tglu-5/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/shard-dg2-11/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7331">i915#7331</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============2376918045140165936==--
