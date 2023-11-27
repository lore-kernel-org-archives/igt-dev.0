Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 27 Nov 2023 13:31:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231127123146.n6mcdjpu7utze6ov@kamilkon-desk.igk.intel.com>
References: <20231124140403.1503568-1-daniel.t.mrzyglod@intel.com>
 <170097000514.9026.7130387826589346935@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170097000514.9026.7130387826589346935@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWwt?=
 =?utf-8?q?ci/xe-fast-feedback=3A_Add_xe=5Fwaitfence_subtest_for_Xe_run?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

below regressions are note related to new Xe subtest,

Regards,
Kamil

On 2023-11-26 at 03:40:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci/xe-fast-feedback: Add xe_waitfence subtest for Xe run
> URL   : https://patchwork.freedesktop.org/series/126875/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13921_full -> IGTPW_10266_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10266_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10266_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): shard-tglu0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10266_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-mtlp-7/igt@gem_eio@in-flight-contexts-10ms.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-2/igt@gem_eio@in-flight-contexts-10ms.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10266_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-noreloc-keep-cache-simple:
>     - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271]) +58 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-snb1/igt@api_intel_bb@object-noreloc-keep-cache-simple.html
> 
>   * igt@drm_fdinfo@all-busy-idle-check-all:
>     - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#8414])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@drm_fdinfo@all-busy-idle-check-all.html
> 
>   * igt@drm_fdinfo@most-busy-check-all@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8414]) +40 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@drm_fdinfo@most-busy-check-all@bcs0.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8414]) +4 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-16/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#3555])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#7697])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html
>     - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#7697]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_create@create-ext-cpu-access-sanity-check:
>     - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#6335])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-7/igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8562])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_persistence@engines-hostile:
>     - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1099]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-snb7/igt@gem_ctx_persistence@engines-hostile.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8555]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-stop:
>     - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#8555])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-stop.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg1:          [PASS][15] -> [FAIL][16] ([i915#5784])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-dg1-16/igt@gem_eio@reset-stress.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-12/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@bonded-dual:
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#4771]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@gem_exec_balancer@bonded-dual.html
> 
>   * igt@gem_exec_balancer@bonded-false-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#4812]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@gem_exec_balancer@bonded-false-hang.html
> 
>   * igt@gem_exec_balancer@hog:
>     - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#4812])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-11/igt@gem_exec_balancer@hog.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-tglu:         NOTRUN -> [FAIL][20] ([i915#6117])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-9/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#6334]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_fair@basic-none-solo:
>     - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#3539] / [i915#4852])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-19/igt@gem_exec_fair@basic-none-solo.html
> 
>   * igt@gem_exec_fair@basic-none-vip@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][23] ([i915#2842]) +1 other test fail
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-7/igt@gem_exec_fair@basic-none-vip@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace:
>     - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#4473] / [i915#4771]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-7/igt@gem_exec_fair@basic-pace.html
> 
>   * igt@gem_exec_fair@basic-pace-solo:
>     - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#3539])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@gem_exec_fair@basic-pace-solo.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#3539] / [i915#4852]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-dg2:          NOTRUN -> [SKIP][27] ([fdo#109283] / [i915#5107])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
>     - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#3281]) +4 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-5/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#3281])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-17/igt@gem_exec_reloc@basic-write-wc.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts:
>     - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#4537] / [i915#4812])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4537] / [i915#4812]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][32] ([i915#7975] / [i915#8213])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#4860]) +6 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
>     - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#4860])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-7/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
> 
>   * igt@gem_lmem_swapping@heavy-multi:
>     - shard-glk:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#4613])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-glk6/igt@gem_lmem_swapping@heavy-multi.html
>     - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4613])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-7/igt@gem_lmem_swapping@heavy-multi.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-tglu:         NOTRUN -> [SKIP][37] ([i915#4613])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-2/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][38] ([i915#4936] / [i915#5493])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html
>     - shard-dg1:          [PASS][39] -> [TIMEOUT][40] ([i915#5493])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4565])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html
> 
>   * igt@gem_media_vme:
>     - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#284])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_gtt@close-race:
>     - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4077]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-7/igt@gem_mmap_gtt@close-race.html
> 
>   * igt@gem_mmap_gtt@ptrace:
>     - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4077]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-18/igt@gem_mmap_gtt@ptrace.html
> 
>   * igt@gem_mmap_gtt@zero-extend:
>     - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4077]) +15 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-5/igt@gem_mmap_gtt@zero-extend.html
> 
>   * igt@gem_mmap_wc@bad-object:
>     - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4083]) +6 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@gem_mmap_wc@bad-object.html
> 
>   * igt@gem_mmap_wc@write:
>     - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4083]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@gem_mmap_wc@write.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-snb:          NOTRUN -> [WARN][48] ([i915#2658])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-snb2/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pread@snoop:
>     - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3282]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@gem_pread@snoop.html
> 
>   * igt@gem_pwrite@basic-random:
>     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3282]) +5 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@gem_pwrite@basic-random.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4270]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4270])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#4270]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#8428]) +4 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4079]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_spin_batch@spin-all-new:
>     - shard-dg2:          NOTRUN -> [FAIL][56] ([i915#5889])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html
> 
>   * igt@gem_userptr_blits@access-control:
>     - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3297]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@gem_userptr_blits@access-control.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-tglu:         NOTRUN -> [SKIP][58] ([fdo#110542])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-8/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3297]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#3297])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-9/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>   * igt@gem_userptr_blits@relocations:
>     - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3281]) +13 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@gem_userptr_blits@relocations.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3297] / [i915#4958])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#2527] / [i915#2856]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-7/igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#2856]) +2 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-5/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#2856]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@i915_fb_tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4881])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@i915_fb_tiling.html
> 
>   * igt@i915_hangman@gt-error-state-capture@rcs0:
>     - shard-mtlp:         [PASS][67] -> [ABORT][68] ([i915#9414])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-mtlp-7/igt@i915_hangman@gt-error-state-capture@rcs0.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-5/igt@i915_hangman@gt-error-state-capture@rcs0.html
> 
>   * igt@i915_module_load@load:
>     - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#6227])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-5/igt@i915_module_load@load.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#7091])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-dg2:          NOTRUN -> [SKIP][71] ([fdo#109293] / [fdo#109506])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rps@min-max-config-loaded:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#6621]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@i915_pm_rps@min-max-config-loaded.html
> 
>   * igt@i915_power@sanity:
>     - shard-mtlp:         [PASS][73] -> [SKIP][74] ([i915#7984])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-mtlp-7/igt@i915_power@sanity.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@i915_power@sanity.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-mtlp:         NOTRUN -> [SKIP][75] ([fdo#109303])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4212])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4212]) +2 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [FAIL][78] ([i915#8247]) +3 other tests fail
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-12/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#1769] / [i915#3555])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>     - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#1769] / [i915#3555])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][81] ([fdo#111614]) +3 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-tglu:         NOTRUN -> [SKIP][82] ([fdo#111615] / [i915#5286])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#5286])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-9/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4538] / [i915#5286])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-mtlp:         [PASS][85] -> [FAIL][86] ([i915#5138])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][87] ([fdo#111614]) +6 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         NOTRUN -> [FAIL][88] ([i915#3743])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-tglu:         [PASS][89] -> [FAIL][90] ([i915#3743])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-tglu-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#5190]) +19 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>     - shard-tglu:         NOTRUN -> [SKIP][92] ([fdo#111615]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4538] / [i915#5190]) +7 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#6187])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][95] ([fdo#111615]) +4 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4538])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_joiner@2x-modeset:
>     - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#2705])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-11/igt@kms_big_joiner@2x-modeset.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#2705])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-7/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4087] / [i915#7213]) +2 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#7213])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#3742])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-3/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-tglu:         NOTRUN -> [SKIP][102] ([fdo#111827])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-3/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2:          NOTRUN -> [SKIP][103] ([fdo#111827]) +2 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-glk:          NOTRUN -> [SKIP][104] ([fdo#109271]) +38 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-glk8/igt@kms_chamelium_color@ctm-max.html
>     - shard-mtlp:         NOTRUN -> [SKIP][105] ([fdo#111827])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-6/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#7828]) +12 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#7828]) +3 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-2/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#7828]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>     - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#7828]) +5 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#3299])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][111] ([i915#6944])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#7118]) +2 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-5/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#7118] / [i915#7162])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-11/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-edp-1:
>     - shard-mtlp:         [PASS][114] -> [DMESG-WARN][115] ([i915#2017])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-edp-1.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-edp-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#3555] / [i915#8814]) +3 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#3555]) +3 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#3359]) +5 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#3555]) +5 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-tglu:         NOTRUN -> [SKIP][120] ([fdo#109274])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#3546])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][122] ([fdo#109274] / [i915#5354]) +7 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [PASS][123] -> [FAIL][124] ([i915#2346])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#4103])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#1257])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-3/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#8812])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#3555] / [i915#3840] / [i915#4098])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#3555] / [i915#3840] / [i915#4098])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#3637]) +5 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([fdo#109274]) +4 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][132] ([fdo#109274] / [fdo#111767])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-tglu:         NOTRUN -> [SKIP][133] ([fdo#109274] / [i915#3637]) +5 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][134] ([fdo#111767] / [i915#3637])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#8810])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#2672])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#2672] / [i915#3555])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#2587] / [i915#2672])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#2672]) +2 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#8708]) +29 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#1825]) +16 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][142] ([fdo#111825]) +5 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#5354]) +39 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#8708]) +1 other test skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-tglu:         NOTRUN -> [SKIP][145] ([fdo#110189]) +12 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([fdo#109280]) +20 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#3458]) +23 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#8708]) +5 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3555] / [i915#8228])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#3555] / [i915#8228])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-9/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#6301])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
>     - shard-mtlp:         NOTRUN -> [SKIP][152] ([fdo#109289]) +2 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-2/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#3582]) +3 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@kms_plane_lowres@tiling-4@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#5176]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#5176] / [i915#9423]) +3 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#5235]) +7 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#5235]) +23 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#5235]) +3 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][159] ([fdo#111068] / [i915#9683]) +1 other test skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-tglu:         NOTRUN -> [SKIP][160] ([fdo#109642] / [fdo#111068] / [i915#9683])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#9683]) +5 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@psr2_cursor_plane_move:
>     - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#9681]) +7 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@kms_psr@psr2_cursor_plane_move.html
> 
>   * igt@kms_psr@psr2_primary_mmap_gtt:
>     - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#9673]) +1 other test skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-3/igt@kms_psr@psr2_primary_mmap_gtt.html
> 
>   * igt@kms_rotation_crc@exhaust-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#4884])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#4235]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#4235] / [i915#5190])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-tglu:         NOTRUN -> [SKIP][167] ([fdo#111615] / [i915#5289])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#4235]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3555] / [i915#8809])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3555] / [i915#4098])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-dg2:          NOTRUN -> [FAIL][171] ([IGT#2])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#8623])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#8623])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:
>     - shard-snb:          [PASS][174] -> [FAIL][175] ([i915#9196])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - shard-mtlp:         [PASS][176] -> [FAIL][177] ([i915#9196])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-tglu:         [PASS][178] -> [FAIL][179] ([i915#9196]) +1 other test fail
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#2437]) +1 other test skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-5/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@enable-disable@0-rcs0:
>     - shard-dg2:          NOTRUN -> [FAIL][181] ([i915#8724])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-dg2:          NOTRUN -> [FAIL][182] ([i915#7484])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html
> 
>   * igt@perf@per-context-mode-unprivileged:
>     - shard-dg2:          NOTRUN -> [SKIP][183] ([fdo#109289]) +2 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@perf@per-context-mode-unprivileged.html
>     - shard-tglu:         NOTRUN -> [SKIP][184] ([fdo#109289]) +2 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-7/igt@perf@per-context-mode-unprivileged.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#8850])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-8/igt@perf_pmu@cpu-hotplug.html
> 
>   * igt@perf_pmu@event-wait@rcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][186] ([fdo#112283])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@perf_pmu@event-wait@rcs0.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-dg2:          NOTRUN -> [FAIL][187] ([i915#5793])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@perf_pmu@module-unload.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#8516])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-6/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@perf_pmu@render-node-busy-idle@ccs0:
>     - shard-mtlp:         [PASS][189] -> [FAIL][190] ([i915#4349])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle@ccs0.html
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle@ccs0.html
> 
>   * igt@perf_pmu@semaphore-busy@vcs1:
>     - shard-dg1:          [PASS][191] -> [FAIL][192] ([i915#4349]) +2 other tests fail
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-dg1-15/igt@perf_pmu@semaphore-busy@vcs1.html
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-12/igt@perf_pmu@semaphore-busy@vcs1.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3708])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#4818])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@tools_test@sysfs_l3_parity.html
> 
>   * igt@v3d/v3d_job_submission@array-job-submission:
>     - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#2575]) +18 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@v3d/v3d_job_submission@array-job-submission.html
> 
>   * igt@v3d/v3d_mmap@mmap-bo:
>     - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#2575]) +6 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-2/igt@v3d/v3d_mmap@mmap-bo.html
> 
>   * igt@v3d/v3d_submit_cl@bad-multisync-pad:
>     - shard-tglu:         NOTRUN -> [SKIP][197] ([fdo#109315] / [i915#2575]) +6 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-6/igt@v3d/v3d_submit_cl@bad-multisync-pad.html
> 
>   * igt@v3d/v3d_submit_csd@multi-and-single-sync:
>     - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#2575]) +1 other test skip
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-17/igt@v3d/v3d_submit_csd@multi-and-single-sync.html
> 
>   * igt@vc4/vc4_perfmon@create-single-perfmon:
>     - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#7711]) +3 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-5/igt@vc4/vc4_perfmon@create-single-perfmon.html
> 
>   * igt@vc4/vc4_perfmon@create-two-perfmon:
>     - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#7711]) +1 other test skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-18/igt@vc4/vc4_perfmon@create-two-perfmon.html
> 
>   * igt@vc4/vc4_tiling@set-get:
>     - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#2575]) +3 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-10/igt@vc4/vc4_tiling@set-get.html
> 
>   * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#7711]) +14 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
>     - shard-dg2:          [INCOMPLETE][203] ([i915#7297]) -> [PASS][204]
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-dg2-2/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-6/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
> 
>   * igt@gem_ctx_freq@sysfs@gt0:
>     - shard-dg2:          [FAIL][205] ([i915#9561]) -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-dg2-6/igt@gem_ctx_freq@sysfs@gt0.html
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-10/igt@gem_ctx_freq@sysfs@gt0.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][207] ([i915#5784]) -> [PASS][208]
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-dg1-14/igt@gem_eio@unwedge-stress.html
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-14/igt@gem_eio@unwedge-stress.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-dg1:          [FAIL][209] ([fdo#103375]) -> [PASS][210] +2 other tests pass
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-dg1-18/igt@i915_pm_rpm@system-suspend.html
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg1-15/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [INCOMPLETE][211] ([i915#7790]) -> [PASS][212]
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-snb5/igt@i915_pm_rps@reset.html
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-snb5/igt@i915_pm_rps@reset.html
>     - shard-tglu:         [INCOMPLETE][213] -> [PASS][214]
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-tglu-6/igt@i915_pm_rps@reset.html
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-2/igt@i915_pm_rps@reset.html
> 
>   * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a:
>     - shard-mtlp:         [ABORT][215] ([i915#9414]) -> [PASS][216]
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-mtlp-2/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-mtlp-5/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
>     - shard-dg2:          [FAIL][217] ([i915#6880]) -> [PASS][218]
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * {igt@kms_pm_dc@dc6-dpms}:
>     - shard-tglu:         [FAIL][219] ([i915#9295]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-tglu-2/igt@kms_pm_dc@dc6-dpms.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-2/igt@kms_pm_dc@dc6-dpms.html
> 
>   * {igt@kms_pm_rpm@dpms-non-lpsp}:
>     - shard-dg2:          [SKIP][221] ([i915#9519]) -> [PASS][222]
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-dg2-10/igt@kms_pm_rpm@dpms-non-lpsp.html
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-2/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * {igt@kms_sequence@get-forked-busy@pipe-a-dp-4}:
>     - shard-dg2:          [DMESG-WARN][223] ([i915#1982]) -> [PASS][224]
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-dg2-11/igt@kms_sequence@get-forked-busy@pipe-a-dp-4.html
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-dg2-11/igt@kms_sequence@get-forked-busy@pipe-a-dp-4.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-tglu:         [FAIL][225] ([i915#9196]) -> [PASS][226]
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13921/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3582]: https://gitlab.freedesktop.org/drm/intel/issues/3582
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
>   [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
>   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
>   [i915#5107]: https://gitlab.freedesktop.org/drm/intel/issues/5107
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5793]: https://gitlab.freedesktop.org/drm/intel/issues/5793
>   [i915#5889]: https://gitlab.freedesktop.org/drm/intel/issues/5889
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
>   [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
>   [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#7091]: https://gitlab.freedesktop.org/drm/intel/issues/7091
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7297]: https://gitlab.freedesktop.org/drm/intel/issues/7297
>   [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#7984]: https://gitlab.freedesktop.org/drm/intel/issues/7984
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/intel/issues/8562
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8724]: https://gitlab.freedesktop.org/drm/intel/issues/8724
>   [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
>   [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
>   [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
>   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
>   [i915#8850]: https://gitlab.freedesktop.org/drm/intel/issues/8850
>   [i915#9053]: https://gitlab.freedesktop.org/drm/intel/issues/9053
>   [i915#9067]: https://gitlab.freedesktop.org/drm/intel/issues/9067
>   [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
>   [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
>   [i915#9310]: https://gitlab.freedesktop.org/drm/intel/issues/9310
>   [i915#9337]: https://gitlab.freedesktop.org/drm/intel/issues/9337
>   [i915#9340]: https://gitlab.freedesktop.org/drm/intel/issues/9340
>   [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
>   [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
>   [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
>   [i915#9433]: https://gitlab.freedesktop.org/drm/intel/issues/9433
>   [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
>   [i915#9561]: https://gitlab.freedesktop.org/drm/intel/issues/9561
>   [i915#9653]: https://gitlab.freedesktop.org/drm/intel/issues/9653
>   [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
>   [i915#9681]: https://gitlab.freedesktop.org/drm/intel/issues/9681
>   [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/intel/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7603 -> IGTPW_10266
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_13921: 002e96d8067fa253ee53af2fa191717f4f5b782b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10266: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/index.html
>   IGT_7603: 2ddd8cac90d4333943cd017319514949b047821b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10266/index.html
