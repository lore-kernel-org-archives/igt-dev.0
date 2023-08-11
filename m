Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B8010E6A2
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 15:12:27 +0000 (UTC)
Date: Fri, 11 Aug 2023 17:12:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230811151222.gjzkhlivszrhjf2i@kamilkon-desk1>
References: <20230803220248.871666-1-lucas.demarchi@intel.com>
 <169112902829.2852.15207904875305670923@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169112902829.2852.15207904875305670923@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogIGZhaWx1cmUgZm9yIHRlc3Rz?=
 =?utf-8?q?/xe=5Fdebugfs=3A_Skip_test_for_tile_count?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below issue is unrelated to xe_debufs, no need for respin.

Regards,
Kamil

On 2023-08-04 at 06:03:48 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_debugfs: Skip test for tile count
> URL   : https://patchwork.freedesktop.org/series/121990/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13471_full -> IGTPW_9511_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9511_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9511_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9511_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@forked-bo@pipe-a:
>     - shard-snb:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-snb1/igt@kms_cursor_legacy@forked-bo@pipe-a.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-snb7/igt@kms_cursor_legacy@forked-bo@pipe-a.html
> 
>   
> #### Warnings ####
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-dg2:          [FAIL][3] ([i915#7484]) -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9511_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#7456])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-1/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [PASS][6] -> [FAIL][7] ([i915#7742])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@drm_fdinfo@virtual-busy-all:
>     - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8414])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@drm_fdinfo@virtual-busy-all.html
> 
>   * igt@feature_discovery@chamelium:
>     - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#4854])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@feature_discovery@chamelium.html
>     - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#4854])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-12/igt@feature_discovery@chamelium.html
> 
>   * igt@feature_discovery@display-2x:
>     - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#1839])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-8/igt@feature_discovery@display-2x.html
>     - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#1839])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-1/igt@feature_discovery@display-2x.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#7697])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-6/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-rkl:          [PASS][14] -> [FAIL][15] ([i915#6268])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_freq@sysfs@gt0:
>     - shard-dg2:          NOTRUN -> [FAIL][16] ([i915#6786])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@gem_ctx_freq@sysfs@gt0.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-cleanup:
>     - shard-snb:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#1099])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-snb6/igt@gem_ctx_persistence@legacy-engines-cleanup.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
>     - shard-mtlp:         [PASS][18] -> [FAIL][19] ([i915#2410])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-1/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [PASS][20] -> [FAIL][21] ([i915#5784]) +1 similar issue
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg1-17/igt@gem_eio@unwedge-stress.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-16/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@noheartbeat:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8555])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@gem_exec_balancer@noheartbeat.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#4525])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-7/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#2842])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-rkl:          [PASS][26] -> [FAIL][27] ([i915#2842])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-rkl-1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_flush@basic-uc-pro-default:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3539] / [i915#4852]) +4 similar issues
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-5/igt@gem_exec_flush@basic-uc-pro-default.html
> 
>   * igt@gem_exec_flush@basic-uc-rw-default:
>     - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#3539] / [i915#4852])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-18/igt@gem_exec_flush@basic-uc-rw-default.html
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
>     - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#3281]) +2 similar issues
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-5/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#3281]) +3 similar issues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-7/igt@gem_exec_reloc@basic-wc.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3281]) +10 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-5/igt@gem_exec_reloc@basic-write-read-active.html
>     - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#3281])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-15/igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][34] ([i915#7975] / [i915#8213])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#4613])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          [PASS][36] -> [TIMEOUT][37] ([i915#5493])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_media_vme:
>     - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#284])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_wc@bad-offset:
>     - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4083]) +1 similar issue
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-2/igt@gem_mmap_wc@bad-offset.html
> 
>   * igt@gem_mmap_wc@write-read-distinct:
>     - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4083]) +3 similar issues
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@gem_mmap_wc@write-read-distinct.html
> 
>   * igt@gem_partial_pwrite_pread@reads:
>     - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3282]) +1 similar issue
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-6/igt@gem_partial_pwrite_pread@reads.html
> 
>   * igt@gem_ppgtt@blt-vs-render-ctx0:
>     - shard-snb:          [PASS][42] -> [DMESG-FAIL][43] ([i915#8295])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-snb2/igt@gem_ppgtt@blt-vs-render-ctx0.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctx0.html
> 
>   * igt@gem_pread@bench:
>     - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#3282])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-8/igt@gem_pread@bench.html
> 
>   * igt@gem_pwrite@basic-random:
>     - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3282])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-4/igt@gem_pwrite@basic-random.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4270]) +1 similar issue
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#8428]) +1 similar issue
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-3/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4079]) +1 similar issue
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
>     - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4079])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-15/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_spin_batch@spin-all-new:
>     - shard-dg2:          NOTRUN -> [FAIL][50] ([i915#5889])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html
> 
>   * igt@gem_tiled_blits@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4077]) +8 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-3/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_userptr_blits@coherency-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3297])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@gem_userptr_blits@coherency-unsync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3297] / [i915#4880])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate.html
> 
>   * igt@gem_userptr_blits@readonly-unsync:
>     - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#3297]) +1 similar issue
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-6/igt@gem_userptr_blits@readonly-unsync.html
> 
>   * igt@gen3_mixed_blits:
>     - shard-rkl:          NOTRUN -> [SKIP][55] ([fdo#109289])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-1/igt@gen3_mixed_blits.html
> 
>   * igt@gen7_exec_parse@batch-without-end:
>     - shard-dg2:          NOTRUN -> [SKIP][56] ([fdo#109289]) +3 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-8/igt@gen7_exec_parse@batch-without-end.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [PASS][57] -> [ABORT][58] ([i915#5566])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-glk1/igt@gen9_exec_parse@allowed-single.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-glk6/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@bb-large:
>     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#2527])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-12/igt@gen9_exec_parse@bb-large.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#2856]) +3 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@gen9_exec_parse@bb-start-far.html
>     - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#2527]) +1 similar issue
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-4/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@gen9_exec_parse@bb-start-out:
>     - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#2527] / [i915#2856])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-5/igt@gen9_exec_parse@bb-start-out.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][63] ([i915#7061] / [i915#8617])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_backlight@basic-brightness:
>     - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#5354] / [i915#7561]) +1 similar issue
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@i915_pm_backlight@basic-brightness.html
> 
>   * igt@i915_pm_backlight@fade:
>     - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#5354] / [i915#7561])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-17/igt@i915_pm_backlight@fade.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>     - shard-dg1:          [PASS][66] -> [FAIL][67] ([i915#3591]) +1 similar issue
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
> 
>   * igt@i915_pm_rpm@cursor-dpms:
>     - shard-tglu:         [PASS][68] -> [FAIL][69] ([i915#7940]) +1 similar issue
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-tglu-10/igt@i915_pm_rpm@cursor-dpms.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-2/igt@i915_pm_rpm@cursor-dpms.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([fdo#109506])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp:
>     - shard-dg2:          [PASS][71] -> [SKIP][72] ([i915#1397]) +1 similar issue
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg2-11/igt@i915_pm_rpm@modeset-non-lpsp.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg1:          [PASS][73] -> [FAIL][74] ([i915#7940]) +1 similar issue
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg1-18/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#6621]) +1 similar issue
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-8/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4387])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-5/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_selftest@live@requests:
>     - shard-mtlp:         [PASS][77] -> [DMESG-FAIL][78] ([i915#8497])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-7/igt@i915_selftest@live@requests.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-8/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#6645])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-1/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][80] ([i915#8841]) +2 similar issues
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-snb4/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc:
>     - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#8709]) +11 similar issues
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc.html
> 
>   * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [FAIL][82] ([i915#8247]) +1 similar issue
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-4/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [FAIL][83] ([i915#8247]) +3 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-3/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#404])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#404])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-mtlp:         [PASS][86] -> [FAIL][87] ([i915#5138])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#5286]) +1 similar issue
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
>     - shard-tglu:         NOTRUN -> [SKIP][89] ([fdo#111615] / [i915#5286])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-mtlp:         [PASS][90] -> [FAIL][91] ([i915#3743])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][92] ([fdo#111614] / [i915#3638])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-3/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([fdo#111614]) +1 similar issue
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][94] ([fdo#111615]) +1 similar issue
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#5190]) +9 similar issues
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4538] / [i915#5190]) +1 similar issue
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][97] ([fdo#110723])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>     - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#3886] / [i915#6095]) +2 similar issues
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][99] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-8/igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_mc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3689] / [i915#5354] / [i915#6095])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-19/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
>     - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#6095]) +5 similar issues
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-7/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-ccs-on-another-bo-yf_tiled_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3734] / [i915#5354] / [i915#6095])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-6/igt@kms_ccs@pipe-b-ccs-on-another-bo-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
>     - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#3689] / [i915#3886] / [i915#5354]) +8 similar issues
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-1/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#5354] / [i915#6095]) +2 similar issues
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-3/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_rc_ccs_cc:
>     - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#5354]) +5 similar issues
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-4/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3689] / [i915#5354]) +15 similar issues
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html
>     - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#3689] / [i915#5354] / [i915#6095])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-8/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#5354] / [i915#6095])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4087] / [i915#7213])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-3/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3742])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2:          NOTRUN -> [SKIP][112] ([fdo#111827])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#7828]) +7 similar issues
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_frames@dp-frame-dump:
>     - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#7828]) +1 similar issue
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-15/igt@kms_chamelium_frames@dp-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#7828]) +3 similar issues
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>     - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#7828]) +2 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
>     - shard-mtlp:         NOTRUN -> [SKIP][117] ([i915#7828]) +3 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
> 
>   * igt@kms_color@deep-color:
>     - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#3555]) +5 similar issues
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-3/igt@kms_color@deep-color.html
>     - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#3555])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-13/igt@kms_color@deep-color.html
> 
>   * igt@kms_concurrent@pipe-c:
>     - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#4070] / [i915#6768])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-2/igt@kms_concurrent@pipe-c.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#3299])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#6944])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-7/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][123] ([i915#7173])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([fdo#109274] / [i915#5354]) +2 similar issues
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [PASS][125] -> [FAIL][126] ([i915#2346])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-apl:          [PASS][127] -> [FAIL][128] ([i915#2346]) +1 similar issue
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#4213])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#4103] / [i915#4213])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#3804])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg2:          [PASS][132] -> [FAIL][133] ([i915#4767])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg2-2/igt@kms_fbcon_fbt@fbc-suspend.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-8/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-rkl:          NOTRUN -> [SKIP][134] ([fdo#111825]) +2 similar issues
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([fdo#109274] / [fdo#111767])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#3637])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][137] ([fdo#109274]) +3 similar issues
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
>     - shard-glk:          [PASS][138] -> [FAIL][139] ([i915#79])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#2672]) +1 similar issue
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#2672])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#5354]) +30 similar issues
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
>     - shard-dg1:          NOTRUN -> [SKIP][143] ([fdo#111825]) +3 similar issues
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
>     - shard-dg2:          [PASS][144] -> [FAIL][145] ([i915#6880])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#3023]) +3 similar issues
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#8708]) +7 similar issues
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html
>     - shard-tglu:         NOTRUN -> [SKIP][148] ([fdo#110189]) +1 similar issue
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html
>     - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#8708]) +1 similar issue
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
>     - shard-rkl:          NOTRUN -> [SKIP][150] ([fdo#111825] / [i915#1825]) +9 similar issues
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#3458]) +1 similar issue
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#1825]) +8 similar issues
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#8708])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-tglu:         NOTRUN -> [SKIP][154] ([fdo#109280]) +6 similar issues
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>     - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#3458]) +11 similar issues
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#3555] / [i915#8228])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-7/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#3555] / [i915#8228]) +1 similar issue
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#6301])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-8/igt@kms_panel_fitting@atomic-fastset.html
>     - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#6301])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-16/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
>     - shard-mtlp:         [PASS][160] -> [FAIL][161] ([i915#1623])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#8821])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-1/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#8806])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-3/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [FAIL][164] ([i915#8292])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][165] ([i915#8292])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#5176]) +3 similar issues
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#5176]) +11 similar issues
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1:
>     - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#5176]) +19 similar issues
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#5235]) +11 similar issues
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#5235]) +23 similar issues
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#5235]) +15 similar issues
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
>     - shard-snb:          NOTRUN -> [SKIP][172] ([fdo#109271]) +220 similar issues
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-snb6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#658]) +1 similar issue
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
>     - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#658])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@primary_mmap_cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#1072]) +5 similar issues
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-8/igt@kms_psr@primary_mmap_cpu.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#1072]) +1 similar issue
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-3/igt@kms_psr@primary_page_flip.html
> 
>   * igt@kms_psr@psr2_primary_mmap_gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#1072])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-16/igt@kms_psr@psr2_primary_mmap_gtt.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#4235])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-2/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3555]) +1 similar issue
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-3/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_selftest@drm_damage:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#8661])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@kms_selftest@drm_damage.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#8850])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-1/igt@perf_pmu@cpu-hotplug.html
>     - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#8850])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-19/igt@perf_pmu@cpu-hotplug.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#8516])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@perf_pmu@rc6@runtime-pm-long-gt1:
>     - shard-mtlp:         [PASS][184] -> [SKIP][185] ([i915#8537]) +2 similar issues
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-7/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-1/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
> 
>   * igt@perf_pmu@render-node-busy-idle@vcs1:
>     - shard-mtlp:         [PASS][186] -> [FAIL][187] ([i915#4349]) +2 similar issues
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-1/igt@perf_pmu@render-node-busy-idle@vcs1.html
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-6/igt@perf_pmu@render-node-busy-idle@vcs1.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#3708] / [i915#4077])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@prime_vgem@basic-fence-mmap.html
>     - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#3708] / [i915#4077])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-17/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#3708])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-3/igt@prime_vgem@basic-read.html
>     - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#3291] / [i915#3708])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-8/igt@prime_vgem@basic-read.html
> 
>   * igt@sysfs_heartbeat_interval@nopreempt@rcs0:
>     - shard-mtlp:         [PASS][192] -> [FAIL][193] ([i915#6015]) +2 similar issues
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-4/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html
> 
>   * igt@sysfs_heartbeat_interval@precise@vecs0:
>     - shard-mtlp:         [PASS][194] -> [FAIL][195] ([i915#8332])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-7/igt@sysfs_heartbeat_interval@precise@vecs0.html
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-5/igt@sysfs_heartbeat_interval@precise@vecs0.html
> 
>   * igt@sysfs_timeslice_duration@timeout@vecs0:
>     - shard-mtlp:         [PASS][196] -> [ABORT][197] ([i915#8521])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-5/igt@sysfs_timeslice_duration@timeout@vecs0.html
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-1/igt@sysfs_timeslice_duration@timeout@vecs0.html
> 
>   * igt@v3d/v3d_perfmon@create-perfmon-0:
>     - shard-rkl:          NOTRUN -> [SKIP][198] ([fdo#109315]) +2 similar issues
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-6/igt@v3d/v3d_perfmon@create-perfmon-0.html
> 
>   * igt@v3d/v3d_perfmon@get-values-invalid-pad:
>     - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#2575]) +2 similar issues
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-3/igt@v3d/v3d_perfmon@get-values-invalid-pad.html
> 
>   * igt@v3d/v3d_submit_cl@bad-perfmon:
>     - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#2575]) +6 similar issues
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-5/igt@v3d/v3d_submit_cl@bad-perfmon.html
> 
>   * igt@v3d/v3d_wait_bo@used-bo-1ns:
>     - shard-tglu:         NOTRUN -> [SKIP][201] ([fdo#109315] / [i915#2575]) +1 similar issue
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-9/igt@v3d/v3d_wait_bo@used-bo-1ns.html
> 
>   * igt@vc4/vc4_mmap@mmap-bo:
>     - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#7711])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-4/igt@vc4/vc4_mmap@mmap-bo.html
> 
>   * igt@vc4/vc4_wait_bo@unused-bo-0ns:
>     - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#7711]) +1 similar issue
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-5/igt@vc4/vc4_wait_bo@unused-bo-0ns.html
> 
>   * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
>     - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#7711]) +2 similar issues
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-2/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-dg2:          [ABORT][205] ([i915#5507] / [i915#8260]) -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg2-2/igt@device_reset@unbind-reset-rebind.html
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-5/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [FAIL][207] ([i915#6268]) -> [PASS][208]
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-7/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile@vecs0:
>     - shard-mtlp:         [FAIL][209] ([i915#7816]) -> [PASS][210] +2 similar issues
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
> 
>   * igt@gem_exec_capture@pi@vcs0:
>     - shard-mtlp:         [FAIL][211] ([i915#4475]) -> [PASS][212]
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-2/igt@gem_exec_capture@pi@vcs0.html
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-2/igt@gem_exec_capture@pi@vcs0.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][213] ([i915#2842]) -> [PASS][214]
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-glk:          [FAIL][215] ([i915#2842]) -> [PASS][216] +1 similar issue
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.html
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-glk5/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_whisper@basic-contexts-priority-all:
>     - shard-mtlp:         [ABORT][217] ([i915#7392] / [i915#8131]) -> [PASS][218]
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [DMESG-WARN][219] ([i915#4936] / [i915#5493]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@i915_hangman@engine-engine-error@vcs0:
>     - shard-mtlp:         [FAIL][221] ([i915#7069]) -> [PASS][222] +1 similar issue
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-5/igt@i915_hangman@engine-engine-error@vcs0.html
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-6/igt@i915_hangman@engine-engine-error@vcs0.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-tglu:         [SKIP][223] ([i915#4281]) -> [PASS][224]
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-tglu-7/igt@i915_pm_dc@dc9-dpms.html
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-2/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_rc6_residency@rc6-accuracy:
>     - shard-mtlp:         [SKIP][225] ([fdo#109289] / [i915#8403]) -> [PASS][226]
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress@smem0:
>     - shard-dg1:          [FAIL][227] ([i915#7940]) -> [PASS][228] +1 similar issue
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg1-15/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html
> 
>   * igt@i915_pm_rpm@pm-caching:
>     - shard-tglu:         [FAIL][229] ([i915#7940]) -> [PASS][230]
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-tglu-5/igt@i915_pm_rpm@pm-caching.html
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-8/igt@i915_pm_rpm@pm-caching.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - shard-mtlp:         [DMESG-FAIL][231] ([i915#6763]) -> [PASS][232]
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-7/igt@i915_selftest@live@workarounds.html
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-8/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [FAIL][233] ([i915#5138]) -> [PASS][234]
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-mtlp:         [FAIL][235] ([i915#3743]) -> [PASS][236] +1 similar issue
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_flip@flip-vs-rmfb@b-vga1:
>     - shard-snb:          [ABORT][237] -> [PASS][238]
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-snb7/igt@kms_flip@flip-vs-rmfb@b-vga1.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-snb2/igt@kms_flip@flip-vs-rmfb@b-vga1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
>     - shard-mtlp:         [FAIL][239] ([fdo#103375]) -> [PASS][240]
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-dg2:          [FAIL][241] ([IGT#2]) -> [PASS][242]
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg2-10/igt@kms_sysfs_edid_timing.html
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
>     - shard-dg2:          [FAIL][243] ([fdo#103375]) -> [PASS][244] +1 similar issue
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-11/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@pipe-c-ts-continuation-suspend:
>     - shard-tglu:         [ABORT][245] ([i915#5122] / [i915#8213]) -> [PASS][246]
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-tglu-8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-tglu-6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
> 
>   * igt@perf_pmu@busy-idle@vcs0:
>     - shard-dg2:          [FAIL][247] ([i915#4349]) -> [PASS][248] +7 similar issues
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg2-11/igt@perf_pmu@busy-idle@vcs0.html
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg2-10/igt@perf_pmu@busy-idle@vcs0.html
>     - shard-dg1:          [FAIL][249] ([i915#4349]) -> [PASS][250] +2 similar issues
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg1-19/igt@perf_pmu@busy-idle@vcs0.html
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-18/igt@perf_pmu@busy-idle@vcs0.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [FAIL][251] ([i915#4349]) -> [PASS][252]
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-rkl-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
> 
>   * igt@syncobj_wait@multi-wait-all-signaled:
>     - shard-mtlp:         [DMESG-WARN][253] ([i915#2017]) -> [PASS][254]
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-5/igt@syncobj_wait@multi-wait-all-signaled.html
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-3/igt@syncobj_wait@multi-wait-all-signaled.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-mtlp:         [SKIP][255] ([fdo#109289]) -> [SKIP][256] ([fdo#109289] / [i915#8403])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   * igt@kms_async_flips@crc@pipe-a-edp-1:
>     - shard-mtlp:         [DMESG-FAIL][257] ([i915#1982] / [i915#8561]) -> [DMESG-FAIL][258] ([i915#8561])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-2/igt@kms_async_flips@crc@pipe-a-edp-1.html
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-2/igt@kms_async_flips@crc@pipe-a-edp-1.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-mtlp:         [DMESG-FAIL][259] ([i915#2017] / [i915#5954]) -> [FAIL][260] ([i915#2346])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          [SKIP][261] ([i915#3955]) -> [SKIP][262] ([fdo#110189] / [i915#3955])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - shard-dg1:          [SKIP][263] ([i915#1072] / [i915#4078]) -> [SKIP][264] ([i915#1072])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13471/shard-dg1-13/igt@kms_psr@sprite_plane_onoff.html
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/shard-dg1-14/igt@kms_psr@sprite_plane_onoff.html
> 
>   
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1623]: https://gitlab.freedesktop.org/drm/intel/issues/1623
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
>   [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5507]: https://gitlab.freedesktop.org/drm/intel/issues/5507
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5889]: https://gitlab.freedesktop.org/drm/intel/issues/5889
>   [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
>   [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6786]: https://gitlab.freedesktop.org/drm/intel/issues/6786
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
>   [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8131]: https://gitlab.freedesktop.org/drm/intel/issues/8131
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8295]: https://gitlab.freedesktop.org/drm/intel/issues/8295
>   [i915#8332]: https://gitlab.freedesktop.org/drm/intel/issues/8332
>   [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
>   [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
>   [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
>   [i915#8537]: https://gitlab.freedesktop.org/drm/intel/issues/8537
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8561]: https://gitlab.freedesktop.org/drm/intel/issues/8561
>   [i915#8617]: https://gitlab.freedesktop.org/drm/intel/issues/8617
>   [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
>   [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
>   [i915#8850]: https://gitlab.freedesktop.org/drm/intel/issues/8850
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7413 -> IGTPW_9511
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_13471: 9ae790e550072205635381bf9345a4066eae20f6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9511: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/index.html
>   IGT_7413: 7413
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9511/index.html
