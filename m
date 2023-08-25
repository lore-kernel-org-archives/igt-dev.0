Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E847C10E6B3
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 14:55:44 +0000 (UTC)
Date: Fri, 25 Aug 2023 16:55:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230825145520.ctze727ydoo6e4wo@kamilkon-desk.igk.intel.com>
References: <20230824161524.14083-1-mwen@igalia.com>
 <169294518343.10952.15739641681376277560@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169294518343.10952.15739641681376277560@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogIGZhaWx1cmUgZm9yIHRlc3Rz?=
 =?utf-8?q?/kms=5Fatomic=3A_remove_zpos_=3C_N-planes_assert?=
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

below is unrelated to this test.

Regards,
Kamil

On 2023-08-25 at 06:33:03 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_atomic: remove zpos < N-planes assert
> URL   : https://patchwork.freedesktop.org/series/122853/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13562_full -> IGTPW_9652_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9652_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9652_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9652_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-rkl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_psr@psr2_sprite_render:
>     - shard-mtlp:         [PASS][3] -> [FAIL][4] +1 similar issue
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-7/igt@kms_psr@psr2_sprite_render.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@kms_psr@psr2_sprite_render.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9652_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#6230])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@api_intel_bb@crc32.html
>     - shard-tglu:         NOTRUN -> [SKIP][6] ([i915#6230])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-9/igt@api_intel_bb@crc32.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#7701])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@device_reset@cold-reset-bound.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#7701])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html
>     - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#7701])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-2/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@drm_fdinfo@busy@vcs1:
>     - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8414]) +4 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-19/igt@drm_fdinfo@busy@vcs1.html
> 
>   * igt@drm_fdinfo@most-busy-check-all@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8414]) +42 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html
> 
>   * igt@feature_discovery@chamelium:
>     - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#4854])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@feature_discovery@chamelium.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#7697])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-7/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_busy@semaphore:
>     - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#3936])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-12/igt@gem_busy@semaphore.html
> 
>   * igt@gem_caching@writes:
>     - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#4873])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-7/igt@gem_caching@writes.html
> 
>   * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][16] ([i915#6311] / [i915#7297])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-1/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#7697])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-1/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_ctx_persistence@engines-hostile@vcs0:
>     - shard-mtlp:         [PASS][18] -> [FAIL][19] ([i915#2410]) +2 similar issues
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-8/igt@gem_ctx_persistence@engines-hostile@vcs0.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@gem_ctx_persistence@engines-hostile@vcs0.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#8555])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-4/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-stop:
>     - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8555])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-stop.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-queued:
>     - shard-snb:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#1099]) +1 similar issue
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
>     - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#5882]) +5 similar issues
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#280])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - shard-mtlp:         [PASS][25] -> [ABORT][26] ([i915#7941])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-5/igt@gem_eio@in-flight-contexts-10ms.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-4/igt@gem_eio@in-flight-contexts-10ms.html
> 
>   * igt@gem_exec_balancer@bonded-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4771]) +1 similar issue
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html
> 
>   * igt@gem_exec_balancer@parallel-contexts:
>     - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#4525])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@gem_exec_balancer@parallel-contexts.html
> 
>   * igt@gem_exec_balancer@sliced:
>     - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4812]) +2 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-12/igt@gem_exec_balancer@sliced.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#6344])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html
>     - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#6344])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-7/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-rkl:          [PASS][32] -> [FAIL][33] ([i915#2842]) +1 similar issue
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-sync:
>     - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#3539])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-15/igt@gem_exec_fair@basic-sync.html
> 
>   * igt@gem_exec_flush@basic-wb-rw-default:
>     - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#3539] / [i915#4852]) +7 similar issues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-default.html
> 
>   * igt@gem_exec_reloc@basic-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#3281]) +4 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@gem_exec_reloc@basic-wc.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3281]) +10 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-1/igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_exec_schedule@preempt-engines@ccs0:
>     - shard-mtlp:         [PASS][38] -> [FAIL][39] ([i915#9119]) +4 similar issues
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-6/igt@gem_exec_schedule@preempt-engines@ccs0.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4537] / [i915#4812])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
> 
>   * igt@gem_exec_suspend@basic-s0@lmem0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][41] ([i915#6311])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-12/igt@gem_exec_suspend@basic-s0@lmem0.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg1:          [PASS][42] -> [ABORT][43] ([i915#7975] / [i915#8213])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg1-19/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4860]) +1 similar issue
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-2/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4613])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
>     - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#4613])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [PASS][47] -> [TIMEOUT][48] ([i915#5493])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_mmap_gtt@basic-copy:
>     - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4077])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-19/igt@gem_mmap_gtt@basic-copy.html
> 
>   * igt@gem_mmap_gtt@basic-small-bo:
>     - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4077]) +1 similar issue
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-2/igt@gem_mmap_gtt@basic-small-bo.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4077]) +15 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_mmap_wc@copy:
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4083]) +2 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@gem_mmap_wc@copy.html
> 
>   * igt@gem_partial_pwrite_pread@reads-uncached:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3282]) +7 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#3282]) +2 similar issues
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-snb:          NOTRUN -> [WARN][55] ([i915#2658]) +1 similar issue
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-snb4/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pread@snoop:
>     - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3282]) +1 similar issue
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-13/igt@gem_pread@snoop.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4270])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#4270]) +1 similar issue
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-2/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4270])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-13/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#4270])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-10/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_readwrite@write-bad-handle:
>     - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#3282])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-2/igt@gem_readwrite@write-bad-handle.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4079]) +1 similar issue
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_softpin@evict-snoop:
>     - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4885])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@gem_softpin@evict-snoop.html
> 
>   * igt@gem_spin_batch@user-each:
>     - shard-mtlp:         [PASS][64] -> [DMESG-FAIL][65] ([i915#8962] / [i915#9121]) +1 similar issue
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-3/igt@gem_spin_batch@user-each.html
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-4/igt@gem_spin_batch@user-each.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3297] / [i915#4880]) +1 similar issue
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3297] / [i915#4958])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-12/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3297]) +4 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-5/igt@gem_userptr_blits@unsync-overlap.html
>     - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3297])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-7/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3297])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-dg2:          [PASS][71] -> [INCOMPLETE][72] ([i915#9138])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg2-11/igt@gem_workarounds@suspend-resume-context.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-5/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@gen3_render_mixed_blits:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([fdo#109289])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-14/igt@gen3_render_mixed_blits.html
>     - shard-mtlp:         NOTRUN -> [SKIP][74] ([fdo#109289])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-6/igt@gen3_render_mixed_blits.html
> 
>   * igt@gen3_render_tiledy_blits:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([fdo#109289]) +3 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@gen3_render_tiledy_blits.html
>     - shard-rkl:          NOTRUN -> [SKIP][76] ([fdo#109289])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-7/igt@gen3_render_tiledy_blits.html
>     - shard-tglu:         NOTRUN -> [SKIP][77] ([fdo#109289])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-3/igt@gen3_render_tiledy_blits.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#2856]) +5 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-12/igt@gen9_exec_parse@bb-start-far.html
>     - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#2527]) +2 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-1/igt@gen9_exec_parse@bb-start-far.html
>     - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#2527] / [i915#2856]) +2 similar issues
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-7/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@i915_hangman@engine-engine-error@vcs0:
>     - shard-mtlp:         [PASS][81] -> [FAIL][82] ([i915#7069])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-3/igt@i915_hangman@engine-engine-error@vcs0.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-1/igt@i915_hangman@engine-engine-error@vcs0.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#6412])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@i915_module_load@resize-bar.html
>     - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#6412])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-2/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#7091])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-8/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@i915_pm_backlight@bad-brightness:
>     - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#7561])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-5/igt@i915_pm_backlight@bad-brightness.html
> 
>   * igt@i915_pm_backlight@fade-with-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#7561]) +1 similar issue
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@i915_pm_backlight@fade-with-dpms.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#4281])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-5/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>     - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#1937])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-16/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
> 
>   * igt@i915_pm_rpm@dpms-non-lpsp:
>     - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#1397])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-6/igt@i915_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2:          [PASS][91] -> [SKIP][92] ([i915#1397])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg2-8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#1397])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-dg2:          NOTRUN -> [SKIP][94] ([fdo#109506])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#8925])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@i915_pm_rps@thresholds-park@gt0.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4387])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@i915_pm_sseu@full-enable.html
>     - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#4387])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@query-topology-coherent-slice-mask:
>     - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#6188])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-8/igt@i915_query@query-topology-coherent-slice-mask.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-tglu:         NOTRUN -> [SKIP][99] ([fdo#109303])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-5/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4215] / [i915#5190])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-12/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4212]) +2 similar issues
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
>     - shard-glk:          [PASS][102] -> [FAIL][103] ([i915#2521])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
>     - shard-mtlp:         [PASS][104] -> [FAIL][105] ([i915#2521])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#8502] / [i915#8709]) +11 similar issues
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs.html
> 
>   * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [FAIL][107] ([i915#8247]) +3 similar issues
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-13/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#1769]) +1 similar issue
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-snb:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#1769])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#4538] / [i915#5286]) +1 similar issue
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-13/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#5286]) +4 similar issues
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>     - shard-tglu:         NOTRUN -> [SKIP][112] ([fdo#111615] / [i915#5286]) +1 similar issue
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [PASS][113] -> [FAIL][114] ([i915#5138])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#3638])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-18/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][116] ([fdo#111614] / [i915#3638]) +3 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html
>     - shard-tglu:         NOTRUN -> [SKIP][117] ([fdo#111614]) +1 similar issue
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][118] ([fdo#111614]) +1 similar issue
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][119] ([fdo#111614]) +1 similar issue
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#5190]) +17 similar issues
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4538] / [i915#5190]) +8 similar issues
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4538]) +1 similar issue
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-17/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][123] ([fdo#111615]) +1 similar issue
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-rkl:          NOTRUN -> [SKIP][124] ([fdo#111615])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([fdo#110723]) +1 similar issue
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-mtlp:         NOTRUN -> [SKIP][126] ([fdo#111615]) +2 similar issues
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_joiner@2x-modeset:
>     - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#2705])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@kms_big_joiner@2x-modeset.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#3886] / [i915#5354] / [i915#6095])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-ccs-on-another-bo-4_tiled_mtl_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][129] ([fdo#109271]) +24 similar issues
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-glk8/igt@kms_ccs@pipe-a-ccs-on-another-bo-4_tiled_mtl_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#3689] / [i915#5354] / [i915#6095]) +4 similar issues
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-18/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#3689] / [i915#5354]) +28 similar issues
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#3689] / [i915#3886] / [i915#5354]) +13 similar issues
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#5354] / [i915#6095]) +10 similar issues
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-2/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#3734] / [i915#5354] / [i915#6095])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#6095]) +5 similar issues
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
>     - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#3886] / [i915#6095]) +1 similar issue
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-8/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][137] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-3/igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#3689] / [i915#5354] / [i915#6095]) +4 similar issues
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-9/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#5354] / [i915#6095]) +12 similar issues
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-10/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc:
>     - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#5354] / [i915#6095]) +5 similar issues
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-18/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#5354]) +17 similar issues
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-2/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3742])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-1/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#3742])
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-4/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>     - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#4087] / [i915#7213]) +4 similar issues
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4087]) +3 similar issues
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-rkl:          NOTRUN -> [SKIP][146] ([fdo#111827])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-dg1:          NOTRUN -> [SKIP][147] ([fdo#111827])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-18/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2:          NOTRUN -> [SKIP][148] ([fdo#111827]) +1 similar issue
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#7828]) +1 similar issue
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-15/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>     - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#7828]) +12 similar issues
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#7828]) +3 similar issues
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-storm.html
>     - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#7828]) +2 similar issues
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-2/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#7828]) +2 similar issues
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_color@deep-color:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#3555]) +5 similar issues
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-5/igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#3299]) +1 similar issue
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][156] ([i915#7173])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@kms_content_protection@lic@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@mei_interface:
>     - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#6944] / [i915#7116] / [i915#7118])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-8/igt@kms_content_protection@mei_interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#7118]) +1 similar issue
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-8/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][159] ([fdo#109279] / [i915#3359])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-edp-1:
>     - shard-mtlp:         [PASS][160] -> [FAIL][161] ([i915#8787])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-edp-1.html
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-edp-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3359])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#3359])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#3359]) +1 similar issue
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#3359])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][166] ([fdo#109274] / [fdo#111767] / [i915#5354])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>     - shard-rkl:          NOTRUN -> [SKIP][167] ([fdo#111767] / [fdo#111825]) +1 similar issue
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>     - shard-tglu:         NOTRUN -> [SKIP][168] ([fdo#109274] / [fdo#111767])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#4103] / [i915#4213]) +1 similar issue
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([fdo#109274] / [i915#5354]) +4 similar issues
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-rkl:          NOTRUN -> [SKIP][171] ([fdo#111825]) +4 similar issues
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
>     - shard-tglu:         NOTRUN -> [SKIP][172] ([fdo#109274])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          NOTRUN -> [FAIL][173] ([i915#2346])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-apl:          [PASS][174] -> [FAIL][175] ([i915#2346])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#4103] / [i915#4213])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>     - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#4103]) +1 similar issue
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#8588])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-5/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#3555] / [i915#3840])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-8/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#3555] / [i915#3840])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-4/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3955])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
>     - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3469])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-9/igt@kms_fbcon_fbt@psr-suspend.html
>     - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#3469])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-8/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#4881])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-8/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-snb:          NOTRUN -> [SKIP][185] ([fdo#109271] / [fdo#111767]) +1 similar issue
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-snb7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#3637])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][187] -> [FAIL][188] ([i915#79]) +1 similar issue
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][189] ([fdo#109274] / [fdo#111767])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
>     - shard-tglu:         NOTRUN -> [SKIP][190] ([fdo#109274] / [fdo#111767] / [i915#3637])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][191] ([fdo#109274] / [i915#3637]) +1 similar issue
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-10/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg2:          NOTRUN -> [SKIP][192] ([fdo#109274]) +9 similar issues
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-1/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@flip-vs-fences:
>     - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#8381])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-5/igt@kms_flip@flip-vs-fences.html
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#8381])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-5/igt@kms_flip@flip-vs-fences.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][195] ([i915#8841]) +2 similar issues
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-snb1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-edp1:
>     - shard-mtlp:         [PASS][196] -> [DMESG-WARN][197] ([i915#1982])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-6/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-edp1.html
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-2/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-edp1.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a2:
>     - shard-glk:          [PASS][198] -> [FAIL][199] ([i915#2122])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-glk6/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a2.html
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-glk4/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#2587] / [i915#2672])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#2672]) +1 similar issue
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#8810])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#2672]) +1 similar issue
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#2672]) +6 similar issues
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#8708]) +32 similar issues
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
>     - shard-rkl:          NOTRUN -> [SKIP][206] ([fdo#111825] / [i915#1825]) +22 similar issues
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][207] ([fdo#109280]) +16 similar issues
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
>     - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#1825]) +4 similar issues
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3458]) +25 similar issues
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>     - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3458]) +3 similar issues
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
>     - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#3023]) +17 similar issues
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#5354]) +57 similar issues
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
>     - shard-tglu:         NOTRUN -> [SKIP][213] ([fdo#110189]) +15 similar issues
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#5460])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][215] ([fdo#111825]) +9 similar issues
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#8708])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#3555] / [i915#8228]) +1 similar issue
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-2/igt@kms_hdr@static-toggle-suspend.html
>     - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3555] / [i915#8228]) +1 similar issue
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-1/igt@kms_hdr@static-toggle-suspend.html
>     - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#3555] / [i915#8228])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-4/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
>     - shard-rkl:          [PASS][220] -> [FAIL][221] ([fdo#103375]) +1 similar issue
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-rkl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#8821])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#3555] / [i915#8821])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-5/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#6953])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-dg1:          NOTRUN -> [FAIL][225] ([i915#8292])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#5176]) +11 similar issues
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html
>     - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#5176]) +19 similar issues
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#5176]) +7 similar issues
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#5235]) +23 similar issues
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#5235]) +1 similar issue
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#5235]) +19 similar issues
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-15/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#6524])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-19/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#6524] / [i915#6805])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-12/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#658]) +4 similar issues
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>     - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#658])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>     - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#658])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr@psr2_dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#1072]) +8 similar issues
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@kms_psr@psr2_dpms.html
> 
>   * igt@kms_psr@psr2_primary_page_flip:
>     - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#1072]) +1 similar issue
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-16/igt@kms_psr@psr2_primary_page_flip.html
> 
>   * igt@kms_psr@sprite_mmap_gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#1072]) +3 similar issues
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@kms_psr@sprite_mmap_gtt.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#5289])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#4235] / [i915#5190])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-12/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#3555]) +3 similar issues
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-none.html
>     - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#3555]) +1 similar issue
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_selftest@drm_cmdline:
>     - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#8661])
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@kms_selftest@drm_cmdline.html
> 
>   * igt@kms_selftest@drm_damage:
>     - shard-snb:          NOTRUN -> [SKIP][245] ([fdo#109271] / [i915#8661]) +1 similar issue
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-snb6/igt@kms_selftest@drm_damage.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#8623])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#8623])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-2/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#8623])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vblank@pipe-c-query-busy-hang:
>     - shard-snb:          NOTRUN -> [SKIP][249] ([fdo#109271]) +259 similar issues
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-snb2/igt@kms_vblank@pipe-c-query-busy-hang.html
> 
>   * igt@kms_vblank@pipe-c-query-forked:
>     - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#4070] / [i915#6768]) +2 similar issues
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-1/igt@kms_vblank@pipe-c-query-forked.html
> 
>   * igt@kms_vblank@pipe-c-ts-continuation-suspend:
>     - shard-dg2:          [PASS][251] -> [FAIL][252] ([fdo#103375])
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg2-3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-idle:
>     - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#4070] / [i915#533] / [i915#6768]) +3 similar issues
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-7/igt@kms_vblank@pipe-d-ts-continuation-idle.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#3555])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-15/igt@kms_vrr@flip-dpms.html
>     - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#8808])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-5/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#2437])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-7/igt@kms_writeback@writeback-invalid-parameters.html
>     - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#2437])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-2/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@perf@enable-disable@0-rcs0:
>     - shard-dg2:          NOTRUN -> [FAIL][258] ([i915#8724])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html
> 
>   * igt@perf@global-sseu-config-invalid:
>     - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#7387])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@perf@global-sseu-config-invalid.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          NOTRUN -> [FAIL][260] ([i915#4349]) +3 similar issues
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-dg2:          NOTRUN -> [FAIL][261] ([i915#5793] / [i915#6121])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-5/igt@perf_pmu@module-unload.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#8516])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-5/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>     - shard-dg2:          NOTRUN -> [CRASH][263] ([i915#7331])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#3708] / [i915#4077])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#4818])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@tools_test@sysfs_l3_parity.html
>     - shard-rkl:          NOTRUN -> [SKIP][266] ([fdo#109307])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-2/igt@tools_test@sysfs_l3_parity.html
>     - shard-tglu:         NOTRUN -> [SKIP][267] ([fdo#109307])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-9/igt@tools_test@sysfs_l3_parity.html
> 
>   * igt@v3d/v3d_get_bo_offset@create-get-offsets:
>     - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#2575]) +2 similar issues
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-2/igt@v3d/v3d_get_bo_offset@create-get-offsets.html
> 
>   * igt@v3d/v3d_submit_cl@simple-flush-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#2575]) +2 similar issues
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-15/igt@v3d/v3d_submit_cl@simple-flush-cache.html
> 
>   * igt@v3d/v3d_submit_csd@job-perfmon:
>     - shard-tglu:         NOTRUN -> [SKIP][270] ([fdo#109315] / [i915#2575]) +3 similar issues
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-2/igt@v3d/v3d_submit_csd@job-perfmon.html
> 
>   * igt@v3d/v3d_submit_csd@single-out-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#2575]) +15 similar issues
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-3/igt@v3d/v3d_submit_csd@single-out-sync.html
> 
>   * igt@v3d/v3d_submit_csd@valid-multisync-submission:
>     - shard-rkl:          NOTRUN -> [SKIP][272] ([fdo#109315]) +9 similar issues
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-1/igt@v3d/v3d_submit_csd@valid-multisync-submission.html
> 
>   * igt@vc4/vc4_perfmon@create-two-perfmon:
>     - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#7711])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-8/igt@vc4/vc4_perfmon@create-two-perfmon.html
> 
>   * igt@vc4/vc4_tiling@set-get:
>     - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#7711]) +11 similar issues
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-2/igt@vc4/vc4_tiling@set-get.html
>     - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#7711]) +4 similar issues
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-1/igt@vc4/vc4_tiling@set-get.html
> 
>   * igt@vc4/vc4_wait_bo@used-bo:
>     - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#2575]) +3 similar issues
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-10/igt@vc4/vc4_wait_bo@used-bo.html
> 
>   * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
>     - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#7711]) +1 similar issue
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-16/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [FAIL][278] ([i915#7742]) -> [PASS][279]
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-rkl:          [FAIL][280] ([i915#6268]) -> [PASS][281]
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@bcs0:
>     - shard-dg2:          [FAIL][282] ([fdo#103375]) -> [PASS][283] +1 similar issue
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg2-5/igt@gem_ctx_isolation@preservation-s3@bcs0.html
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-8/igt@gem_ctx_isolation@preservation-s3@bcs0.html
> 
>   * igt@gem_eio@hibernate:
>     - shard-tglu:         [ABORT][284] ([i915#7975] / [i915#8213] / [i915#8398]) -> [PASS][285]
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-tglu-10/igt@gem_eio@hibernate.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-4/igt@gem_eio@hibernate.html
> 
>   * igt@gem_exec_capture@capture@vcs1-smem:
>     - shard-mtlp:         [DMESG-WARN][286] ([i915#5591]) -> [PASS][287]
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-3/igt@gem_exec_capture@capture@vcs1-smem.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-4/igt@gem_exec_capture@capture@vcs1-smem.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-apl:          [FAIL][288] ([i915#2842]) -> [PASS][289]
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_schedule@noreorder-priority@ccs0:
>     - shard-mtlp:         [DMESG-FAIL][290] ([i915#9121]) -> [PASS][291]
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-4/igt@gem_exec_schedule@noreorder-priority@ccs0.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-7/igt@gem_exec_schedule@noreorder-priority@ccs0.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [ABORT][292] ([i915#5566]) -> [PASS][293]
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-glk6/igt@gen9_exec_parse@allowed-single.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-glk9/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-untiled:
>     - shard-mtlp:         [FAIL][294] ([i915#8691]) -> [PASS][295]
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-tglu:         [FAIL][296] ([i915#3989] / [i915#454]) -> [PASS][297]
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-dg2:          [SKIP][298] ([i915#1397]) -> [PASS][299] +1 similar issue
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
>     - shard-rkl:          [SKIP][300] ([i915#1397]) -> [PASS][301]
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-dg1:          [SKIP][302] ([i915#1397]) -> [PASS][303] +1 similar issue
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg1-17/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-dg2:          [FAIL][304] ([i915#8229]) -> [PASS][305]
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg2-2/igt@i915_pm_rps@reset.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@i915_pm_rps@reset.html
>     - shard-dg1:          [FAIL][306] ([i915#8229]) -> [PASS][307]
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg1-14/igt@i915_pm_rps@reset.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-15/igt@i915_pm_rps@reset.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
>     - shard-mtlp:         [FAIL][308] ([i915#2521]) -> [PASS][309]
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-mtlp:         [FAIL][310] ([i915#5138]) -> [PASS][311]
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-mtlp:         [FAIL][312] ([i915#3743]) -> [PASS][313]
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>     - shard-mtlp:         [FAIL][314] ([i915#8248]) -> [PASS][315]
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-apl:          [FAIL][316] ([i915#2346]) -> [PASS][317]
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg1:          [FAIL][318] ([fdo#103375]) -> [PASS][319]
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg1-18/igt@kms_fbcon_fbt@fbc-suspend.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-19/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_getfb@getfb-addfb-different-handles:
>     - shard-mtlp:         [DMESG-WARN][320] ([i915#2017] / [i915#9157]) -> [PASS][321]
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-3/igt@kms_getfb@getfb-addfb-different-handles.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-8/igt@kms_getfb@getfb-addfb-different-handles.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
>     - shard-mtlp:         [FAIL][322] ([i915#1623]) -> [PASS][323] +1 similar issue
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-rkl:          [ABORT][324] ([i915#8178]) -> [PASS][325]
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-rkl-4/igt@kms_rotation_crc@sprite-rotation-90.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@perf_pmu@busy-idle@bcs0:
>     - shard-mtlp:         [FAIL][326] ([i915#4349]) -> [PASS][327] +9 similar issues
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-3/igt@perf_pmu@busy-idle@bcs0.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-2/igt@perf_pmu@busy-idle@bcs0.html
> 
>   * igt@perf_pmu@busy-idle@ccs0:
>     - shard-dg2:          [FAIL][328] ([i915#4349]) -> [PASS][329] +3 similar issues
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg2-3/igt@perf_pmu@busy-idle@ccs0.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-1/igt@perf_pmu@busy-idle@ccs0.html
> 
>   * igt@syncobj_timeline@invalid-wait-illegal-handle:
>     - shard-mtlp:         [DMESG-WARN][330] ([i915#2017]) -> [PASS][331] +1 similar issue
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-mtlp-3/igt@syncobj_timeline@invalid-wait-illegal-handle.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-mtlp-5/igt@syncobj_timeline@invalid-wait-illegal-handle.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>     - shard-tglu:         [WARN][332] ([i915#2681]) -> [FAIL][333] ([i915#2681] / [i915#3591])
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>     - shard-tglu:         [FAIL][334] ([i915#2681] / [i915#3591]) -> [WARN][335] ([i915#2681])
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-rkl:          [INCOMPLETE][336] ([i915#4817]) -> [FAIL][337] ([fdo#103375])
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-snb:          [DMESG-WARN][338] ([i915#8841]) -> [DMESG-FAIL][339] ([fdo#103375])
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-snb5/igt@i915_suspend@sysfs-reader.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-snb7/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_content_protection@content_type_change:
>     - shard-dg2:          [SKIP][340] ([i915#7118]) -> [SKIP][341] ([i915#7118] / [i915#7162])
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg2-3/igt@kms_content_protection@content_type_change.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-11/igt@kms_content_protection@content_type_change.html
> 
>   * igt@kms_content_protection@mei_interface:
>     - shard-dg1:          [SKIP][342] ([fdo#109300]) -> [SKIP][343] ([i915#7116])
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg1-14/igt@kms_content_protection@mei_interface.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-18/igt@kms_content_protection@mei_interface.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          [SKIP][344] ([i915#7118] / [i915#7162]) -> [SKIP][345] ([i915#7118])
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg2-12/igt@kms_content_protection@type1.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg2-6/igt@kms_content_protection@type1.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-rkl:          [SKIP][346] ([fdo#110189] / [i915#3955]) -> [SKIP][347] ([i915#3955])
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-rkl-1/igt@kms_fbcon_fbt@psr.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-rkl:          [SKIP][348] ([fdo#109285] / [i915#4098]) -> [SKIP][349] ([fdo#109285])
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-rkl-4/igt@kms_force_connector_basic@force-load-detect.html
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][350] ([i915#4816]) -> [SKIP][351] ([i915#4070] / [i915#4816])
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - shard-dg1:          [SKIP][352] ([i915#1072]) -> [SKIP][353] ([i915#1072] / [i915#4078])
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13562/shard-dg1-14/igt@kms_psr@sprite_plane_onoff.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/shard-dg1-13/igt@kms_psr@sprite_plane_onoff.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
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
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
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
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5460]: https://gitlab.freedesktop.org/drm/intel/issues/5460
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#5793]: https://gitlab.freedesktop.org/drm/intel/issues/5793
>   [i915#5882]: https://gitlab.freedesktop.org/drm/intel/issues/5882
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
>   [i915#6188]: https://gitlab.freedesktop.org/drm/intel/issues/6188
>   [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
>   [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
>   [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
>   [i915#7091]: https://gitlab.freedesktop.org/drm/intel/issues/7091
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7297]: https://gitlab.freedesktop.org/drm/intel/issues/7297
>   [i915#7331]: https://gitlab.freedesktop.org/drm/intel/issues/7331
>   [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8178]: https://gitlab.freedesktop.org/drm/intel/issues/8178
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8229]: https://gitlab.freedesktop.org/drm/intel/issues/8229
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8248]: https://gitlab.freedesktop.org/drm/intel/issues/8248
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8398]: https://gitlab.freedesktop.org/drm/intel/issues/8398
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
>   [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
>   [i915#8691]: https://gitlab.freedesktop.org/drm/intel/issues/8691
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8724]: https://gitlab.freedesktop.org/drm/intel/issues/8724
>   [i915#8787]: https://gitlab.freedesktop.org/drm/intel/issues/8787
>   [i915#8808]: https://gitlab.freedesktop.org/drm/intel/issues/8808
>   [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
>   [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
>   [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
>   [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
>   [i915#9119]: https://gitlab.freedesktop.org/drm/intel/issues/9119
>   [i915#9121]: https://gitlab.freedesktop.org/drm/intel/issues/9121
>   [i915#9138]: https://gitlab.freedesktop.org/drm/intel/issues/9138
>   [i915#9157]: https://gitlab.freedesktop.org/drm/intel/issues/9157
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7451 -> IGTPW_9652
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_13562: 6cd46255547ba72bb6cc6aab91c905b1dec95696 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9652: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/index.html
>   IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9652/index.html
