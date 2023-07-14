Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5099084190569181661=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Date: Fri, 14 Jul 2023 02:27:15 -0000
Message-ID: <168930163547.13875.3770981585517778978@emeril.freedesktop.org>
References: <20230713220319.3315155-1-gustavo.sousa@intel.com>
In-Reply-To: <20230713220319.3315155-1-gustavo.sousa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=5Fflips=3A_Use_define_for_number_of_framebuffers?=
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

--===============5099084190569181661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Use define for number of framebuffers
URL   : https://patchwork.freedesktop.org/series/120703/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13384_full -> IGTPW_9406_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): pig-kbl-iris 

Known issues
------------

  Here are the changes found in IGTPW_9406_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][1] ([i915#8414]) +10 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [PASS][2] -> [FAIL][3] ([i915#7742])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#8414]) +6 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@drm_fdinfo@virtual-busy.html

  * igt@feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#1839])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-3/igt@feature_discovery@display-3x.html

  * igt@gem_barrier_race@remote-request@rcs0:
    - shard-tglu:         [PASS][6] -> [ABORT][7] ([i915#8211] / [i915#8234])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-tglu-5/igt@gem_barrier_race@remote-request@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-9/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#7697])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#5325])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_create@create-ext-set-pat:
    - shard-snb:          NOTRUN -> [FAIL][10] ([i915#8621])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-hang@vcs0:
    - shard-mtlp:         [PASS][11] -> [FAIL][12] ([i915#2410]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-5/igt@gem_ctx_persistence@engines-hang@vcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@vcs0.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb2/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8555])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-rkl:          [PASS][15] -> [FAIL][16] ([i915#5099])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-4/igt@gem_ctx_persistence@smoketest.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-1/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#280])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-3/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-rkl:          NOTRUN -> [ABORT][18] ([i915#7975] / [i915#8213])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-mtlp:         [PASS][19] -> [ABORT][20] ([i915#7941])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-7/igt@gem_eio@in-flight-contexts-10ms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@kms:
    - shard-dg2:          [PASS][21] -> [FAIL][22] ([i915#5784])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-12/igt@gem_eio@kms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#4771])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#4473] / [i915#4771]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#4473])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][26] -> [FAIL][27] ([i915#2842])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-rkl:          [PASS][28] -> [FAIL][29] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_fence@submit67:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#4812]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#3539] / [i915#4852])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#3281]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-read.html
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#3281]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#3281]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][36] ([i915#7975] / [i915#8213]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-tglu:         [PASS][37] -> [ABORT][38] ([i915#7975] / [i915#8213])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-tglu-3/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-mtlp:         [PASS][39] -> [TIMEOUT][40] ([i915#8628])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-2/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4860])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#4613])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk9/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4613]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#284])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#284])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4077]) +6 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4077]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4083]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@copy:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4083]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#3282]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#4270]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-10/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4270]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#8428])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4079])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4885])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3297])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3297]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3282]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3297] / [i915#4880])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#3297])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-4/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen3_render_mixed_blits:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([fdo#109289])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-2/igt@gen3_render_mixed_blits.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([fdo#109289]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#2856]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@gen9_exec_parse@allowed-all.html
    - shard-apl:          [PASS][64] -> [ABORT][65] ([i915#5566])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-apl3/igt@gen9_exec_parse@allowed-all.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#2856]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#2527])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_backlight@bad-brightness:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#5354] / [i915#7561])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_dc@dc5-dpms-negative:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#8018])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-2/igt@i915_pm_dc@dc5-dpms-negative.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#3361])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][71] -> [SKIP][72] ([i915#1397]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [PASS][73] -> [SKIP][74] ([i915#1397]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-4/igt@i915_pm_rpm@dpms-non-lpsp.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][75] ([fdo#111644] / [i915#1397])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-3/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#1397])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#6245])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-5/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][78] ([i915#7059])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][79] ([i915#6763])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@forcewake:
    - shard-dg2:          [PASS][80] -> [FAIL][81] ([fdo#103375]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-7/igt@i915_suspend@forcewake.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4212])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-glk:          [PASS][83] -> [FAIL][84] ([i915#2521])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#5286]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([fdo#111614])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-mtlp:         [PASS][87] -> [FAIL][88] ([i915#3743])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#5190]) +5 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#6187])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([fdo#111615]) +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4538] / [i915#5190]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([fdo#110723]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#2705])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-10/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#2705])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-4/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#3886] / [i915#6095]) +6 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#3689] / [i915#5354]) +11 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#3734] / [i915#5354] / [i915#6095]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3689] / [i915#3886] / [i915#5354]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#3886]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk4/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-4_tiled_mtl_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#5354] / [i915#6095]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-7/igt@kms_ccs@pipe-b-ccs-on-another-bo-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#5354] / [i915#6095]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][103] ([fdo#109271]) +35 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk1/igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#5354]) +4 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3689] / [i915#5354] / [i915#6095])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-7/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#6095]) +22 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#7213])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([fdo#111827])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@degamma:
    - shard-mtlp:         NOTRUN -> [SKIP][109] ([fdo#111827])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#7828]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#7828]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#7828]) +4 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#6944]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2:          NOTRUN -> [TIMEOUT][114] ([i915#7173])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-12/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#7118]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#3555])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#3555])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#3359]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][119] ([i915#8841]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb5/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([fdo#109274] / [i915#5354]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#3546]) +3 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][122] -> [FAIL][123] ([i915#2346])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#4213]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#3555] / [i915#3840])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#3555] / [i915#3840])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#3840])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#3469]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#3637]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-snb:          NOTRUN -> [SKIP][130] ([fdo#109271] / [fdo#111767]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([fdo#111767] / [i915#3637])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([fdo#109274]) +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-12/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-apl:          [PASS][133] -> [FAIL][134] ([i915#79])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [PASS][135] -> [FAIL][136] ([i915#79])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#8381])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][138] -> [FAIL][139] ([i915#2122])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk8/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#2672])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#2672]) +2 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#5274])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#8708]) +4 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          [PASS][144] -> [FAIL][145] ([i915#6880]) +1 similar issue
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([fdo#109280]) +2 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#5354]) +15 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#3458]) +7 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([fdo#111825] / [i915#1825]) +5 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#8708]) +5 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#3023]) +1 similar issue
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#1825]) +26 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#3555] / [i915#8228]) +2 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([fdo#109289]) +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-10/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-rkl:          NOTRUN -> [SKIP][155] ([fdo#109289])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-128:
    - shard-mtlp:         [PASS][156] -> [DMESG-WARN][157] ([i915#1982])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-8/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-128.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-128.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#6953])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#6953])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#6953])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#5176]) +11 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#5176]) +1 similar issue
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][163] ([fdo#109271]) +277 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#5235]) +3 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#5235]) +3 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#5235]) +23 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_prime@d3hot:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#6524])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@kms_prime@d3hot.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#658])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2_dpms:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#1072]) +1 similar issue
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-10/igt@kms_psr@psr2_dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#1072]) +1 similar issue
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([fdo#110189])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-4/igt@kms_psr@psr2_suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#5289])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#4235] / [i915#5190])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#5030]) +3 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html

  * igt@kms_setmode@basic@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][175] ([i915#5465]) +1 similar issue
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb4/igt@kms_setmode@basic@pipe-a-vga-1.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#8823])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#4070] / [i915#6768])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-wait-busy-hang:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#4070] / [i915#533] / [i915#6768])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-1/igt@kms_vblank@pipe-d-wait-busy-hang.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#2437])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> [SKIP][180] ([fdo#109271] / [i915#2437])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [PASS][181] -> [FAIL][182] ([i915#5234])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-6/igt@perf_pmu@all-busy-idle-check-all.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [PASS][183] -> [FAIL][184] ([i915#5234])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([fdo#112283])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-4/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][186] ([i915#5793] / [i915#6121])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@perf_pmu@module-unload.html

  * igt@prime_udl:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([fdo#109291])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@prime_udl.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#3708] / [i915#4077])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@fence-write-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#3708])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@prime_vgem@fence-write-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#4818])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@tools_test@sysfs_l3_parity.html
    - shard-rkl:          NOTRUN -> [SKIP][191] ([fdo#109307])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#2575]) +5 similar issues
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html

  * igt@v3d/v3d_submit_csd@bad-extension:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([fdo#109315] / [i915#2575]) +1 similar issue
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-3/igt@v3d/v3d_submit_csd@bad-extension.html

  * igt@v3d/v3d_submit_csd@bad-multisync-out-sync:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#2575]) +1 similar issue
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-10/igt@v3d/v3d_submit_csd@bad-multisync-out-sync.html

  * igt@vc4/vc4_purgeable_bo@free-purged-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#7711]) +2 similar issues
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@vc4/vc4_purgeable_bo@free-purged-bo.html

  * igt@vc4/vc4_purgeable_bo@mark-willneed:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#7711]) +1 similar issue
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@vc4/vc4_purgeable_bo@mark-willneed.html

  * igt@vc4/vc4_wait_bo@used-bo-1ns:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#7711]) +4 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@vc4/vc4_wait_bo@used-bo-1ns.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
    - shard-mtlp:         [FAIL][198] ([i915#2410]) -> [PASS][199] +2 similar issues
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html

  * igt@gem_eio@unwedge-stress:
    - {shard-dg1}:        [FAIL][200] ([i915#5784]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg1-14/igt@gem_eio@unwedge-stress.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg1-19/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-dg2:          [FAIL][202] ([i915#6032]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-11/igt@gem_exec_balancer@full-pulse.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][204] ([i915#2846]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk3/igt@gem_exec_fair@basic-deadline.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk9/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-rkl:          [FAIL][206] ([i915#2842]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-1/igt@gem_exec_fair@basic-none@vecs0.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][208] ([i915#5493]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-snb:          [DMESG-FAIL][210] ([i915#8295]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb6/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@i915_hangman@detector@vcs0:
    - shard-mtlp:         [FAIL][212] ([i915#8456]) -> [PASS][213] +2 similar issues
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-8/igt@i915_hangman@detector@vcs0.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@i915_hangman@detector@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][214] ([i915#7061]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][216] ([i915#8489] / [i915#8668]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][218] ([i915#3989] / [i915#454]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-tglu-7/igt@i915_pm_dc@dc6-dpms.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][220] ([i915#4281]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-tglu-7/igt@i915_pm_dc@dc9-dpms.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-10/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - {shard-dg1}:        [FAIL][222] ([i915#3591]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglu:         [FAIL][224] ([i915#7940]) -> [PASS][225] +1 similar issue
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-tglu-4/igt@i915_pm_rpm@cursor.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-5/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][226] ([i915#1397]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-2/igt@i915_pm_rpm@dpms-lpsp.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - {shard-dg1}:        [SKIP][228] ([i915#1397]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg1-15/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - {shard-dg1}:        [FAIL][230] ([i915#7940]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg1-18/igt@i915_pm_rpm@system-suspend-execbuf.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg1-17/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [DMESG-FAIL][232] ([i915#5334]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][234] ([i915#2521]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [FAIL][236] ([i915#79]) -> [PASS][237] +1 similar issue
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-vga1:
    - shard-snb:          [ABORT][238] -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-snb7/igt@kms_flip@wf_vblank-ts-check@a-vga1.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb5/igt@kms_flip@wf_vblank-ts-check@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2:          [FAIL][240] ([i915#6880]) -> [PASS][241] +2 similar issues
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-mtlp:         [FAIL][242] ([i915#8726]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-4/igt@kms_psr@psr2_primary_blt.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@kms_psr@psr2_primary_blt.html

  * igt@sysfs_heartbeat_interval@mixed@ccs0:
    - shard-mtlp:         [ABORT][244] ([i915#8552]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-1/igt@sysfs_heartbeat_interval@mixed@ccs0.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@ccs0.html

  * igt@sysfs_heartbeat_interval@mixed@vecs0:
    - shard-mtlp:         [FAIL][246] ([i915#1731]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-1/igt@sysfs_heartbeat_interval@mixed@vecs0.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@vecs0.html

  * igt@sysfs_heartbeat_interval@nopreempt@ccs0:
    - shard-mtlp:         [FAIL][248] ([i915#6015]) -> [PASS][249] +3 similar issues
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html

  
#### Warnings ####

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         [ABORT][250] ([i915#8131]) -> [TIMEOUT][251] ([i915#7392])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-mtlp:         [SKIP][252] ([fdo#109289]) -> [SKIP][253] ([fdo#109289] / [i915#8403])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_suspend@sysfs-reader:
    - shard-snb:          [DMESG-WARN][254] ([i915#8841]) -> [DMESG-FAIL][255] ([fdo#103375])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-snb5/igt@i915_suspend@sysfs-reader.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_content_protection@content_type_change:
    - shard-dg2:          [SKIP][256] ([i915#7118]) -> [SKIP][257] ([i915#7118] / [i915#7162])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-6/igt@kms_content_protection@content_type_change.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@kms_content_protection@content_type_change.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [FAIL][258] ([i915#2346]) -> [DMESG-FAIL][259] ([i915#2017] / [i915#5954])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][260] ([i915#3955]) -> [SKIP][261] ([fdo#110189] / [i915#3955])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][262] ([fdo#109285] / [i915#4098]) -> [SKIP][263] ([fdo#109285])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][264] ([i915#4070] / [i915#4816]) -> [SKIP][265] ([i915#4816])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-mtlp:         [ABORT][266] ([i915#8521]) -> [TIMEOUT][267] ([i915#6950])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-7/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5099]: https://gitlab.freedesktop.org/drm/intel/issues/5099
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5793]: https://gitlab.freedesktop.org/drm/intel/issues/5793
  [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
  [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
  [i915#6032]: https://gitlab.freedesktop.org/drm/intel/issues/6032
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6950]: https://gitlab.freedesktop.org/drm/intel/issues/6950
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7691]: https://gitlab.freedesktop.org/drm/intel/issues/7691
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8018]: https://gitlab.freedesktop.org/drm/intel/issues/8018
  [i915#8131]: https://gitlab.freedesktop.org/drm/intel/issues/8131
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8234]: https://gitlab.freedesktop.org/drm/intel/issues/8234
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8295]: https://gitlab.freedesktop.org/drm/intel/issues/8295
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
  [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8456]: https://gitlab.freedesktop.org/drm/intel/issues/8456
  [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
  [i915#8552]: https://gitlab.freedesktop.org/drm/intel/issues/8552
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8621]: https://gitlab.freedesktop.org/drm/intel/issues/8621
  [i915#8628]: https://gitlab.freedesktop.org/drm/intel/issues/8628
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8726]: https://gitlab.freedesktop.org/drm/intel/issues/8726
  [i915#8823]: https://gitlab.freedesktop.org/drm/intel/issues/8823
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7386 -> IGTPW_9406
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13384: ea8d81bf649580240f0b944b85521d2a091d8ebc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9406: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/index.html
  IGT_7386: 54dc25efaf10d87962f95be9b1d1a8f0f907912b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/index.html

--===============5099084190569181661==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Use define for number of framebuffers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/120703/">https://patchwork.freedesktop.org/series/120703/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13384_full -&gt; IGTPW_9406_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9406_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@drm_fdinfo@busy-hang@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@drm_fdinfo@virtual-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-3/igt@feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-tglu-5/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-9/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8211">i915#8211</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8234">i915#8234</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb4/igt@gem_create@create-ext-set-pat.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8621">i915#8621</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-5/igt@gem_ctx_persistence@engines-hang@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb2/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-4/igt@gem_ctx_persistence@smoketest.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-1/igt@gem_ctx_persistence@smoketest.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5099">i915#5099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-3/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-7/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@gem_eio@in-flight-contexts-10ms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7941">i915#7941</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-12/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_exec_fair@basic-deadline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@gem_exec_fence@submit67.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-tglu-3/igt@gem_exec_suspend@basic-s4-devices@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-2/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-forked-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8628">i915#8628</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk9/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@gem_mmap_gtt@flink-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@gem_mmap_wc@close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@gem_mmap_wc@copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-10/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-4/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-2/igt@gen3_render_mixed_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-apl3/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-apl2/igt@gen9_exec_parse@allowed-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@i915_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-2/igt@i915_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8018">i915#8018</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-3/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-4/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-3/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-5/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6763">i915#6763</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-7/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@i915_suspend@forcewake.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-10/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-4/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +11 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk4/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-7/igt@kms_ccs@pipe-b-ccs-on-another-bo-4_tiled_mtl_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk1/igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-7/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-2/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-12/igt@kms_content_protection@legacy@pipe-a-dp-2.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb5/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-12/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk8/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-10/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-128:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-8/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-128.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +277 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-8/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-10/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-4/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5030">i915#5030</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb4/igt@kms_setmode@basic@pipe-a-vga-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8823">i915#8823</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-busy-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-1/igt@kms_vblank@pipe-d-wait-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-6/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5234">i915#5234</a>)</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5234">i915#5234</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-4/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-1/igt@perf_pmu@module-unload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5793">i915#5793</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@prime_udl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109307">fdo#109307</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-extension:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-3/igt@v3d/v3d_submit_csd@bad-extension.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-out-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-10/igt@v3d/v3d_submit_csd@bad-multisync-out-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@free-purged-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@vc4/vc4_purgeable_bo@free-purged-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-willneed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-4/igt@vc4/vc4_purgeable_bo@mark-willneed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@used-bo-1ns:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-8/igt@vc4/vc4_wait_bo@used-bo-1ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@vebox:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg1-14/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg1-19/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-pulse:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-11/igt@gem_exec_balancer@full-pulse.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6032">i915#6032</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@gem_exec_balancer@full-pulse.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk9/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-1/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-2/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctx0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8295">i915#8295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb6/igt@gem_ppgtt@blt-vs-render-ctx0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@detector@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-8/igt@i915_hangman@detector@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8456">i915#8456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@i915_hangman@detector@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7061">i915#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8489">i915#8489</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-tglu-7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-tglu-7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-10/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-tglu-4/igt@i915_pm_rpm@cursor.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-tglu-5/igt@i915_pm_rpm@cursor.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-2/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg1-15/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg1-18/igt@i915_pm_rpm@system-suspend-execbuf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg1-17/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-snb7/igt@kms_flip@wf_vblank-ts-check@a-vga1.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb5/igt@kms_flip@wf_vblank-ts-check@a-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-4/igt@kms_psr@psr2_primary_blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8726">i915#8726</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@kms_psr@psr2_primary_blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-1/igt@sysfs_heartbeat_interval@mixed@ccs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8552">i915#8552</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-1/igt@sysfs_heartbeat_interval@mixed@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8131">i915#8131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8403">i915#8403</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-snb5/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-snb7/igt@i915_suspend@sysfs-reader.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-dg2-6/igt@kms_content_protection@content_type_change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-dg2-11/igt@kms_content_protection@content_type_change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7162">i915#7162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13384/shard-mtlp-7/igt@sysfs_timeslice_duration@timeout@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8521">i915#8521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/shard-mtlp-7/igt@sysfs_timeslice_duration@timeout@vecs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6950">i915#6950</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7386 -&gt; IGTPW_9406</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13384: ea8d81bf649580240f0b944b85521d2a091d8ebc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9406: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9406/index.html<br />
  IGT_7386: 54dc25efaf10d87962f95be9b1d1a8f0f907912b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5099084190569181661==--
