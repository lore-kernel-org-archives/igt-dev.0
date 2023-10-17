Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE47810E2BE
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 10:14:24 +0000 (UTC)
Date: Tue, 17 Oct 2023 12:13:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231017101359.gmviyvvpxrjooo5g@kamilkon-desk.igk.intel.com>
References: <20231016131752.39196-1-kamil.konieczny@linux.intel.com>
 <169747554673.13510.11457608828971888210@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169747554673.13510.11457608828971888210@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdG9vbHMv?=
 =?utf-8?q?intel=5Fgpu=5Ffrequency=3A_fix_device_opening?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below regressions are not related to tools change,
could you supress them? No need for respin.

Regards,
Kamil

On 2023-10-16 at 16:59:06 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/intel_gpu_frequency: fix device opening
> URL   : https://patchwork.freedesktop.org/series/125170/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13759_full -> IGTPW_10004_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10004_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10004_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/index.html
> 
> Participating hosts (9 -> 11)
> ------------------------------
> 
>   Additional (2): shard-rkl0 shard-tglu0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10004_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_parallel@engines@fds:
>     - shard-tglu:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-tglu-7/igt@gem_exec_parallel@engines@fds.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-5/igt@gem_exec_parallel@engines@fds.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_plane@plane-panning-bottom-right@pipe-b}:
>     - shard-mtlp:         [PASS][4] -> [FAIL][5] +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-8/igt@kms_plane@plane-panning-bottom-right@pipe-b.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-5/igt@kms_plane@plane-panning-bottom-right@pipe-b.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10004_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8411])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8411]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@render-ccs:
>     - shard-dg2:          NOTRUN -> [FAIL][8] ([i915#6122])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-6/igt@api_intel_bb@render-ccs.html
> 
>   * igt@drm_fdinfo@busy-idle@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8414]) +20 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@drm_fdinfo@busy-idle@bcs0.html
>     - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8414]) +4 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@drm_fdinfo@busy-idle@bcs0.html
> 
>   * igt@drm_fdinfo@virtual-idle:
>     - shard-rkl:          [PASS][11] -> [FAIL][12] ([i915#7742]) +1 other test fail
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-rkl-7/igt@drm_fdinfo@virtual-idle.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-4/igt@drm_fdinfo@virtual-idle.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#7697])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-16/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [PASS][14] -> [FAIL][15] ([i915#6268])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-tglu-7/igt@gem_ctx_exec@basic-nohangcheck.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-tglu:         NOTRUN -> [SKIP][16] ([fdo#109314])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-3/igt@gem_ctx_param@set-priority-not-supported.html
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([fdo#109314])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-6/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-mtlp:         [PASS][18] -> [ABORT][19] ([i915#9262]) +1 other test abort
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-1/igt@gem_eio@reset-stress.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-4/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [PASS][20] -> [FAIL][21] ([i915#5784])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg1-12/igt@gem_eio@unwedge-stress.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-15/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@bonded-pair:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#4771])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
>     - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#4771])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@gem_exec_balancer@bonded-pair.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#4812])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-2/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@noheartbeat:
>     - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8555]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@gem_exec_balancer@noheartbeat.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][26] ([i915#2842])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-7/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-rkl:          [PASS][27] -> [FAIL][28] ([i915#2842]) +1 other test fail
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-rkl-4/igt@gem_exec_fair@basic-none@vecs0.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-4/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglu:         [PASS][29] -> [FAIL][30] ([i915#2842])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_flush@basic-uc-pro-default:
>     - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@gem_exec_flush@basic-uc-pro-default.html
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>   * igt@gem_exec_flush@basic-wb-pro-default:
>     - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#3539] / [i915#4852]) +4 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@gem_exec_flush@basic-wb-pro-default.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#7697])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@gem_exec_gttfill@multigpu-basic.html
>     - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#7697])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-4/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-active:
>     - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3281]) +7 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-wc-active.html
> 
>   * igt@gem_exec_reloc@basic-write-cpu-active:
>     - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3281]) +7 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-18/igt@gem_exec_reloc@basic-write-cpu-active.html
> 
>   * igt@gem_exec_reloc@basic-write-read:
>     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#3281])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-1/igt@gem_exec_reloc@basic-write-read.html
> 
>   * igt@gem_exec_schedule@deep@rcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4537])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-5/igt@gem_exec_schedule@deep@rcs0.html
> 
>   * igt@gem_exec_schedule@preempt-queue-chain:
>     - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4537] / [i915#4812])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts:
>     - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4537] / [i915#4812]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html
> 
>   * igt@gem_exec_schedule@reorder-wide:
>     - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4812])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@gem_exec_schedule@reorder-wide.html
> 
>   * igt@gem_fence_thrash@bo-copy:
>     - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4860]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@gem_fence_thrash@bo-copy.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4860])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4565])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html
> 
>   * igt@gem_lmem_swapping@massive-random:
>     - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#4613])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-1/igt@gem_lmem_swapping@massive-random.html
> 
>   * igt@gem_mmap_gtt@flink-race:
>     - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#4077]) +13 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@gem_mmap_gtt@flink-race.html
> 
>   * igt@gem_mmap_gtt@medium-copy-xy:
>     - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4077]) +16 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@gem_mmap_gtt@medium-copy-xy.html
> 
>   * igt@gem_mmap_wc@coherency:
>     - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4083]) +3 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-7/igt@gem_mmap_wc@coherency.html
> 
>   * igt@gem_mmap_wc@write-wc-read-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4083]) +2 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@gem_mmap_wc@write-wc-read-gtt.html
> 
>   * igt@gem_partial_pwrite_pread@reads-display:
>     - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#3282])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-5/igt@gem_partial_pwrite_pread@reads-display.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
>     - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3282]) +4 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-tglu:         NOTRUN -> [WARN][53] ([i915#2658])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-4/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pread@snoop:
>     - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3282]) +11 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-6/igt@gem_pread@snoop.html
> 
>   * igt@gem_pwrite@basic-self:
>     - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#3282])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-4/igt@gem_pwrite@basic-self.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-3:
>     - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4270]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-16/igt@gem_pxp@reject-modify-context-protection-off-3.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4270]) +4 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#8428]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-7/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4079]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4885])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-8/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_tiled_pread_basic:
>     - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4079])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-14/igt@gem_tiled_pread_basic.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3297])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3297]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-15/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gen7_exec_parse@basic-offset:
>     - shard-dg2:          NOTRUN -> [SKIP][64] ([fdo#109289]) +4 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@gen7_exec_parse@basic-offset.html
> 
>   * igt@gen7_exec_parse@cmd-crossing-page:
>     - shard-tglu:         NOTRUN -> [SKIP][65] ([fdo#109289])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-4/igt@gen7_exec_parse@cmd-crossing-page.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#2527]) +4 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#2527])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-2/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#2527] / [i915#2856])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-4/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#2856]) +5 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_hangman@engine-engine-hang@vcs0:
>     - shard-mtlp:         [PASS][70] -> [FAIL][71] ([i915#7069])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-8/igt@i915_hangman@engine-engine-hang@vcs0.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-2/igt@i915_hangman@engine-engine-hang@vcs0.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#6621])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#6621]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-14/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4387])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-5/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#6245])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-3/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_query@query-topology-coherent-slice-mask:
>     - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#6188])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html
> 
>   * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4212])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4212]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-15/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#5286]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][80] ([fdo#111614])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4538] / [i915#5286]) +6 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-tglu:         NOTRUN -> [SKIP][82] ([fdo#111615] / [i915#5286]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#3638]) +5 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][84] ([fdo#111614]) +5 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][85] ([fdo#111614])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-9/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-tglu:         [PASS][86] -> [FAIL][87] ([i915#3743]) +2 other tests fail
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4538]) +3 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-14/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][89] ([fdo#111615]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4538] / [i915#5190]) +7 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][91] ([fdo#111615])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][92] ([fdo#111615])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#5190]) +15 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-rkl:          NOTRUN -> [SKIP][94] ([fdo#110723]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#2705])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-3/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#3742])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#4087] / [i915#7213]) +4 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#7828]) +4 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-7/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-mtlp:         NOTRUN -> [SKIP][99] ([fdo#111827])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-2/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg1:          NOTRUN -> [SKIP][100] ([fdo#111827]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-18/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-dg2:          NOTRUN -> [SKIP][101] ([fdo#111827]) +2 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-tglu:         NOTRUN -> [SKIP][102] ([fdo#111827])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-9/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#7828]) +8 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-7/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>     - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#7828]) +6 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#6944])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-6/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#7118]) +3 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [FAIL][107] ([i915#1339])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][108] ([fdo#109279] / [i915#3359])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#3359]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>     - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3359])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#3555]) +9 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][112] ([fdo#109274] / [i915#5354]) +7 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>     - shard-tglu:         NOTRUN -> [SKIP][113] ([fdo#109274]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4103] / [i915#4213])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-rkl:          NOTRUN -> [SKIP][115] ([fdo#111825]) +1 other test skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-dg2:          NOTRUN -> [SKIP][116] ([fdo#109274] / [fdo#111767] / [i915#5354])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>     - shard-dg1:          NOTRUN -> [SKIP][117] ([fdo#111767] / [fdo#111825]) +1 other test skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-apl:          [PASS][118] -> [FAIL][119] ([i915#2346])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#3555])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-7/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#3804])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#8812])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#3555] / [i915#3840]) +1 other test skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#3469])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-15/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#3637])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][126] ([fdo#109274] / [fdo#111767])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][127] -> [FAIL][128] ([i915#79])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-flip-vs-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#8381]) +1 other test skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@kms_flip@2x-flip-vs-fences.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#8381])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([fdo#109274]) +9 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][132] ([fdo#109274] / [i915#3637])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][133] ([i915#8841]) +3 other tests dmesg-warn
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#2587] / [i915#2672]) +3 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#2672]) +5 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#2672])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-dg1:          NOTRUN -> [SKIP][138] ([fdo#109285])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-15/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][139] ([fdo#111825]) +40 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][140] ([fdo#109280]) +13 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#1825]) +5 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
>     - shard-dg2:          [PASS][142] -> [FAIL][143] ([i915#6880])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#8708]) +13 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][145] ([fdo#110189]) +9 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#8708]) +1 other test skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][147] ([fdo#111825] / [i915#1825]) +4 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#3458]) +14 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3458]) +19 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite:
>     - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#3023])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#5354]) +36 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#8708]) +24 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#433])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#3555] / [i915#8228]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3555] / [i915#8228])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#3555] / [i915#8228])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@kms_hdr@invalid-hdr.html
>     - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#3555] / [i915#8228])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-4/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#6301])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-14/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#3555] / [i915#8821])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-5/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-dg1:          NOTRUN -> [FAIL][160] ([i915#8292])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-1-invalid-num-scalers:
>     - shard-snb:          NOTRUN -> [SKIP][161] ([fdo#109271]) +13 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-snb1/igt@kms_plane_scaling@invalid-num-scalers@pipe-a-hdmi-a-1-invalid-num-scalers.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#5176] / [i915#9423]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#5235]) +3 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#5235]) +11 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#658]) +3 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#658]) +1 other test skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#658])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-5/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-tglu:         NOTRUN -> [SKIP][168] ([fdo#111068] / [i915#658])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg1:          NOTRUN -> [SKIP][169] ([fdo#111068] / [i915#658])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-15/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@cursor_blt:
>     - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#1072] / [i915#4078]) +5 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-15/igt@kms_psr@cursor_blt.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#1072]) +4 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-11/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#5461] / [i915#658])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#5289])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#4235] / [i915#5190])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>     - shard-dg1:          NOTRUN -> [SKIP][175] ([fdo#111615] / [i915#5289])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#4235])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3555]) +7 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-5/igt@kms_scaling_modes@scaling-mode-none.html
>     - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3555])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-dg2:          NOTRUN -> [FAIL][179] ([IGT#2])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-6/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [FAIL][180] ([i915#9196])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#2437])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-18/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@perf@global-sseu-config:
>     - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#7387])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@perf@global-sseu-config.html
> 
>   * igt@perf@stress-open-close@0-rcs0:
>     - shard-mtlp:         [PASS][183] -> [ABORT][184] ([i915#9414])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-7/igt@perf@stress-open-close@0-rcs0.html
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-4/igt@perf@stress-open-close@0-rcs0.html
> 
>   * igt@perf_pmu@event-wait@rcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][185] ([fdo#112283])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@perf_pmu@event-wait@rcs0.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#5608] / [i915#8516])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@perf_pmu@rc6-all-gts.html
>     - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#8516])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-15/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#8516])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-7/igt@perf_pmu@rc6@other-idle-gt0.html
>     - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#8516])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-7/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_udl:
>     - shard-tglu:         NOTRUN -> [SKIP][190] ([fdo#109291])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-4/igt@prime_udl.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#3708] / [i915#4077])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#3708])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3708] / [i915#4077]) +2 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-1/igt@prime_vgem@coherency-gtt.html
>     - shard-tglu:         NOTRUN -> [SKIP][194] ([fdo#109295] / [fdo#111656])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-4/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#3708])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-7/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@v3d/v3d_perfmon@create-perfmon-0:
>     - shard-tglu:         NOTRUN -> [SKIP][196] ([fdo#109315] / [i915#2575]) +3 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-3/igt@v3d/v3d_perfmon@create-perfmon-0.html
> 
>   * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
>     - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#2575]) +11 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-15/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html
> 
>   * igt@v3d/v3d_submit_csd@bad-multisync-out-sync:
>     - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#2575])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-8/igt@v3d/v3d_submit_csd@bad-multisync-out-sync.html
> 
>   * igt@v3d/v3d_wait_bo@unused-bo-0ns:
>     - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#2575]) +13 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-6/igt@v3d/v3d_wait_bo@unused-bo-0ns.html
> 
>   * igt@vc4/vc4_label_bo@set-bad-name:
>     - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#2575]) +2 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-5/igt@vc4/vc4_label_bo@set-bad-name.html
> 
>   * igt@vc4/vc4_tiling@get-bad-handle:
>     - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#7711]) +7 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-6/igt@vc4/vc4_tiling@get-bad-handle.html
> 
>   * igt@vc4/vc4_wait_bo@used-bo-1ns:
>     - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#7711]) +3 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@vc4/vc4_wait_bo@used-bo-1ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-check-all@rcs0:
>     - shard-rkl:          [FAIL][203] ([i915#7742]) -> [PASS][204]
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
>     - shard-mtlp:         [FAIL][205] ([i915#2410]) -> [PASS][206] +2 other tests pass
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-2/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-4/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
> 
>   * igt@gem_eio@in-flight-10ms:
>     - shard-dg1:          [INCOMPLETE][207] -> [PASS][208] +1 other test pass
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg1-16/igt@gem_eio@in-flight-10ms.html
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-16/igt@gem_eio@in-flight-10ms.html
> 
>   * igt@gem_exec_async@concurrent-writes@rcs0:
>     - shard-mtlp:         [ABORT][209] ([i915#9262]) -> [PASS][210]
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-4/igt@gem_exec_async@concurrent-writes@rcs0.html
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-2/igt@gem_exec_async@concurrent-writes@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-rkl:          [FAIL][211] ([i915#2842]) -> [PASS][212]
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-rkl-4/igt@gem_exec_fair@basic-none@vcs0.html
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-4/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          [DMESG-WARN][213] ([i915#4936] / [i915#5493]) -> [PASS][214]
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html
>     - shard-dg1:          [TIMEOUT][215] ([i915#5493]) -> [PASS][216]
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_userptr_blits@nohangcheck:
>     - shard-mtlp:         [FAIL][217] ([i915#9353]) -> [PASS][218]
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-2/igt@gem_userptr_blits@nohangcheck.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-4/igt@gem_userptr_blits@nohangcheck.html
> 
>   * igt@i915_hangman@engine-engine-error@vcs0:
>     - shard-mtlp:         [FAIL][219] ([i915#7069]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-5/igt@i915_hangman@engine-engine-error@vcs0.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-8/igt@i915_hangman@engine-engine-error@vcs0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>     - shard-dg1:          [FAIL][221] ([i915#3591]) -> [PASS][222]
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-dg1:          [DMESG-WARN][223] ([i915#4391] / [i915#4423]) -> [PASS][224]
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg1-16/igt@i915_suspend@basic-s2idle-without-i915.html
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-14/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-mtlp:         [FAIL][225] ([i915#5138]) -> [PASS][226]
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [FAIL][227] ([i915#2346]) -> [PASS][228]
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglu:         [SKIP][229] ([i915#433]) -> [PASS][230]
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html
> 
>   * {igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a}:
>     - shard-dg2:          [FAIL][231] ([fdo#103375]) -> [PASS][232] +2 other tests pass
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg2-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-tglu:         [FAIL][233] ([i915#8292]) -> [PASS][234]
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * {igt@kms_pm_rpm@i2c}:
>     - shard-dg2:          [FAIL][235] -> [PASS][236]
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg2-2/igt@kms_pm_rpm@i2c.html
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@kms_pm_rpm@i2c.html
> 
>   * {igt@kms_pm_rpm@modeset-lpsp-stress}:
>     - shard-rkl:          [SKIP][237] ([i915#9519]) -> [PASS][238] +2 other tests pass
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * {igt@kms_pm_rpm@modeset-non-lpsp}:
>     - shard-dg1:          [SKIP][239] ([i915#9519]) -> [PASS][240] +2 other tests pass
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-dg1:          [DMESG-WARN][241] ([i915#1982]) -> [PASS][242]
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg1-15/igt@kms_rotation_crc@primary-rotation-90.html
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-12/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1:
>     - shard-mtlp:         [DMESG-WARN][243] ([i915#2017]) -> [PASS][244]
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-1/igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1.html
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-2/igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1.html
> 
>   * igt@perf_pmu@busy-double-start@ccs0:
>     - shard-mtlp:         [FAIL][245] ([i915#4349]) -> [PASS][246]
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-1/igt@perf_pmu@busy-double-start@ccs0.html
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-7/igt@perf_pmu@busy-double-start@ccs0.html
> 
>   * igt@prime_self_import@export-vs-gem_close-race:
>     - shard-mtlp:         [FAIL][247] ([i915#9399]) -> [PASS][248]
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-mtlp-1/igt@prime_self_import@export-vs-gem_close-race.html
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-mtlp-1/igt@prime_self_import@export-vs-gem_close-race.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>     - shard-tglu:         [FAIL][249] ([i915#2681] / [i915#3591]) -> [WARN][250] ([i915#2681])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-rkl:          [SKIP][251] ([i915#3955]) -> [SKIP][252] ([fdo#110189] / [i915#3955])
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-rkl-2/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
>     - shard-dg1:          [SKIP][253] ([i915#4423] / [i915#8708]) -> [SKIP][254] ([i915#8708])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
> 
>   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>     - shard-dg2:          [INCOMPLETE][255] ([i915#5493]) -> [CRASH][256] ([i915#9351])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13759/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1339]: https://gitlab.freedesktop.org/drm/intel/issues/1339
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6122]: https://gitlab.freedesktop.org/drm/intel/issues/6122
>   [i915#6188]: https://gitlab.freedesktop.org/drm/intel/issues/6188
>   [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
>   [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
>   [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
>   [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
>   [i915#9337]: https://gitlab.freedesktop.org/drm/intel/issues/9337
>   [i915#9351]: https://gitlab.freedesktop.org/drm/intel/issues/9351
>   [i915#9353]: https://gitlab.freedesktop.org/drm/intel/issues/9353
>   [i915#9399]: https://gitlab.freedesktop.org/drm/intel/issues/9399
>   [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
>   [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
>   [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7541 -> IGTPW_10004
> 
>   CI-20190529: 20190529
>   CI_DRM_13759: 33e6e703667cadb9da01350ffd8d0845a691320b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10004: 10004
>   IGT_7541: fcddb77c3f8a77020f7f3b2660a66cae27cfaa2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10004/index.html
