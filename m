Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E451210E06E
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 08:05:40 +0000 (UTC)
Date: Wed, 23 Aug 2023 10:05:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230823080535.fj5ey7dd7ethy2zo@kamilkon-desk.igk.intel.com>
References: <20230821140712.1034591-1-aurabindo.pillai@amd.com>
 <169274695231.20552.3460695171968426018@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169274695231.20552.3460695171968426018@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv4=2C1/2=5D_lib/amdgpu=3A__Add_check_for_ODM_?=
 =?utf-8?q?combine_segments_debugfs_endpoint_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below is unrelated to change in amdgpu. No need for respin.

Regards,
Kamil

On 2023-08-22 at 23:29:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [v4,1/2] lib/amdgpu: Add check for ODM combine segments debugfs endpoint (rev4)
> URL   : https://patchwork.freedesktop.org/series/122707/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13546_full -> IGTPW_9634_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9634_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9634_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9634_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@sysfs_heartbeat_interval@mixed@ccs0:
>     - shard-dg2:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-3/igt@sysfs_heartbeat_interval@mixed@ccs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@sysfs_heartbeat_interval@mixed@ccs0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9634_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8411])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-3/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8411])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@debugfs_test@basic-hwmon:
>     - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#7456])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-1/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@drm_buddy@drm_buddy_test:
>     - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#8661])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-5/igt@drm_buddy@drm_buddy_test.html
>     - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8661])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-16/igt@drm_buddy@drm_buddy_test.html
> 
>   * igt@drm_fdinfo@busy-idle-check-all@vcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8414]) +10 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-1/igt@drm_fdinfo@busy-idle-check-all@vcs0.html
> 
>   * igt@drm_fdinfo@most-busy-check-all@rcs0:
>     - shard-rkl:          [PASS][11] -> [FAIL][12] ([i915#7742])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html
> 
>   * igt@feature_discovery@display-3x:
>     - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#1839])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-11/igt@feature_discovery@display-3x.html
> 
>   * igt@gem_barrier_race@remote-request@rcs0:
>     - shard-glk:          [PASS][14] -> [ABORT][15] ([i915#7461] / [i915#8190])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-glk2/igt@gem_barrier_race@remote-request@rcs0.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-glk4/igt@gem_barrier_race@remote-request@rcs0.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#5325])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-1/igt@gem_ccs@block-copy-compressed.html
>     - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#5325])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-2/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#7697])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8562])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_persistence@engines-hang@vcs0:
>     - shard-mtlp:         [PASS][20] -> [FAIL][21] ([i915#2410]) +1 similar issue
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-1/igt@gem_ctx_persistence@engines-hang@vcs0.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-4/igt@gem_ctx_persistence@engines-hang@vcs0.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8555]) +1 similar issue
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>   * igt@gem_ctx_persistence@hostile:
>     - shard-snb:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#1099]) +2 similar issues
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-snb2/igt@gem_ctx_persistence@hostile.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#280])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-15/igt@gem_ctx_sseu@invalid-args.html
>     - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#280])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-1/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-snb:          NOTRUN -> [FAIL][26] ([i915#8898])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-snb5/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@bonded-dual:
>     - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4771])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-3/igt@gem_exec_balancer@bonded-dual.html
> 
>   * igt@gem_exec_balancer@sliced:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#4812]) +1 similar issue
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-3/igt@gem_exec_balancer@sliced.html
> 
>   * igt@gem_exec_capture@pi@rcs0:
>     - shard-mtlp:         [PASS][29] -> [FAIL][30] ([i915#4475]) +1 similar issue
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-7/igt@gem_exec_capture@pi@rcs0.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-4/igt@gem_exec_capture@pi@rcs0.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#2846])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-glk4/igt@gem_exec_fair@basic-deadline.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-glk2/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglu:         [PASS][33] -> [FAIL][34] ([i915#2842])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-tglu-7/igt@gem_exec_fair@basic-flow@rcs0.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-4/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][35] ([i915#2842]) +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-5/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][36] ([i915#2842])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-sync:
>     - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4473] / [i915#4771])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-2/igt@gem_exec_fair@basic-sync.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-wb:
>     - shard-mtlp:         [PASS][38] -> [DMESG-FAIL][39] ([i915#9121])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-8/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
> 
>   * igt@gem_exec_flush@basic-wb-ro-default:
>     - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852]) +1 similar issue
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@gem_exec_flush@basic-wb-ro-default.html
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3281]) +3 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-gtt.html
> 
>   * igt@gem_exec_reloc@basic-wc-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#3281]) +1 similar issue
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@gem_exec_reloc@basic-wc-gtt.html
> 
>   * igt@gem_exec_reloc@basic-wc-read-noreloc:
>     - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3281]) +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-14/igt@gem_exec_reloc@basic-wc-read-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-gtt-active:
>     - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#3281]) +1 similar issue
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-5/igt@gem_exec_reloc@basic-write-gtt-active.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain:
>     - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4812])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg1:          [PASS][46] -> [ABORT][47] ([i915#7975] / [i915#8213])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg1-17/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@smem:
>     - shard-rkl:          NOTRUN -> [ABORT][48] ([i915#7975] / [i915#8213])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices@smem.html
> 
>   * igt@gem_fenced_exec_thrash@2-spare-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4860])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@gem_fenced_exec_thrash@2-spare-fences.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#4613])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-engines.html
>     - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#4613])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-2/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4613]) +1 similar issue
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-2/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [PASS][53] -> [TIMEOUT][54] ([i915#5493])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_madvise@dontneed-before-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3282])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-14/igt@gem_madvise@dontneed-before-pwrite.html
>     - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#3282])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-1/igt@gem_madvise@dontneed-before-pwrite.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#8289])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-4/igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4077]) +2 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4077]) +12 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_mmap_gtt@fault-concurrent-y:
>     - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4077]) +2 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-12/igt@gem_mmap_gtt@fault-concurrent-y.html
> 
>   * igt@gem_mmap_wc@coherency:
>     - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4083])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@gem_mmap_wc@coherency.html
> 
>   * igt@gem_mmap_wc@set-cache-level:
>     - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4083]) +1 similar issue
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-2/igt@gem_mmap_wc@set-cache-level.html
> 
>   * igt@gem_pxp@create-protected-buffer:
>     - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4270])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@gem_pxp@create-protected-buffer.html
> 
>   * igt@gem_pxp@create-regular-context-1:
>     - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4270])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-19/igt@gem_pxp@create-regular-context-1.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4270]) +1 similar issue
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-8/igt@gem_pxp@display-protected-crc.html
>     - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#4270])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@gem_pxp@display-protected-crc.html
>     - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#4270])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-5/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_readwrite@beyond-eob:
>     - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3282]) +2 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-11/igt@gem_readwrite@beyond-eob.html
>     - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3282])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@gem_readwrite@beyond-eob.html
> 
>   * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#8428]) +2 similar issues
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-2/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4079])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#3297])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3297])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#3297])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@gem_userptr_blits@unsync-overlap.html
>     - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#3297])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-10/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gen3_render_tiledy_blits:
>     - shard-rkl:          NOTRUN -> [SKIP][76] ([fdo#109289]) +1 similar issue
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@gen3_render_tiledy_blits.html
> 
>   * igt@gen7_exec_parse@basic-allocation:
>     - shard-mtlp:         NOTRUN -> [SKIP][77] ([fdo#109289]) +1 similar issue
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-6/igt@gen7_exec_parse@basic-allocation.html
> 
>   * igt@gen7_exec_parse@basic-offset:
>     - shard-dg2:          NOTRUN -> [SKIP][78] ([fdo#109289]) +2 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@gen7_exec_parse@basic-offset.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#2856]) +3 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-8/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@batch-zero-length:
>     - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#2527] / [i915#2856]) +1 similar issue
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-3/igt@gen9_exec_parse@batch-zero-length.html
>     - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#2527]) +1 similar issue
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@gen9_exec_parse@batch-zero-length.html
> 
>   * igt@gen9_exec_parse@unaligned-jump:
>     - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#2527])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-18/igt@gen9_exec_parse@unaligned-jump.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#2856])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-5/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#8436])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@i915_pm_backlight@fade:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#5354] / [i915#7561])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-1/igt@i915_pm_backlight@fade.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-apl:          [PASS][86] -> [SKIP][87] ([fdo#109271])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-apl4/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api@gt0:
>     - shard-mtlp:         [PASS][88] -> [FAIL][89] ([i915#8670])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-8/igt@i915_pm_freq_api@freq-basic-api@gt0.html
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-1/igt@i915_pm_freq_api@freq-basic-api@gt0.html
> 
>   * igt@i915_pm_rpm@dpms-lpsp:
>     - shard-rkl:          [PASS][90] -> [SKIP][91] ([i915#1397]) +1 similar issue
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-4/igt@i915_pm_rpm@dpms-lpsp.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg1:          [PASS][92] -> [SKIP][93] ([i915#1397])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-18/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#1397])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
>     - shard-tglu:         NOTRUN -> [SKIP][95] ([fdo#111644] / [i915#1397]) +1 similar issue
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-mtlp:         NOTRUN -> [SKIP][96] ([fdo#109293]) +1 similar issue
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-4/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-dg2:          [PASS][97] -> [SKIP][98] ([i915#1397]) +1 similar issue
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-dg1:          NOTRUN -> [SKIP][99] ([fdo#109506])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-16/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][100] ([i915#7790])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-snb5/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#8925])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@i915_pm_rps@thresholds-park@gt0.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4387])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-8/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@query-topology-unsupported:
>     - shard-dg2:          NOTRUN -> [SKIP][103] ([fdo#109302])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@i915_query@query-topology-unsupported.html
>     - shard-rkl:          NOTRUN -> [SKIP][104] ([fdo#109302])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@i915_query@query-topology-unsupported.html
>     - shard-tglu:         NOTRUN -> [SKIP][105] ([fdo#109302])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-3/igt@i915_query@query-topology-unsupported.html
> 
>   * igt@i915_suspend@debugfs-reader:
>     - shard-dg2:          [PASS][106] -> [FAIL][107] ([fdo#103375]) +1 similar issue
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-2/igt@i915_suspend@debugfs-reader.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-5/igt@i915_suspend@debugfs-reader.html
> 
>   * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
>     - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#4212]) +1 similar issue
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4212]) +1 similar issue
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#8502] / [i915#8709]) +11 similar issues
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs.html
> 
>   * igt@kms_async_flips@crc@pipe-d-dp-4:
>     - shard-dg2:          NOTRUN -> [FAIL][111] ([i915#8247]) +3 similar issues
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-11/igt@kms_async_flips@crc@pipe-d-dp-4.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#6228])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#404])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-snb:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#1769])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#5286]) +2 similar issues
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][116] ([fdo#111614])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4538] / [i915#5286])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][118] ([fdo#111615] / [i915#5286]) +2 similar issues
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-mtlp:         [PASS][119] -> [FAIL][120] ([i915#3743])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [PASS][121] -> [FAIL][122] ([i915#5138]) +1 similar issue
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-mtlp:         NOTRUN -> [FAIL][123] ([i915#3743]) +1 similar issue
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([fdo#111614]) +1 similar issue
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3638])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-18/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#6187])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#5190]) +16 similar issues
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4538])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-15/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][129] ([fdo#110723])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][130] ([fdo#111615]) +3 similar issues
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg1:          NOTRUN -> [SKIP][131] ([fdo#111615])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-15/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-rkl:          NOTRUN -> [SKIP][132] ([fdo#111615])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>     - shard-tglu:         NOTRUN -> [SKIP][133] ([fdo#111615]) +1 similar issue
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#4538] / [i915#5190]) +2 similar issues
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>     - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#3886] / [i915#6095]) +2 similar issues
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#5354] / [i915#6095]) +5 similar issues
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-4/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#3734] / [i915#5354] / [i915#6095]) +1 similar issue
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#3689] / [i915#5354] / [i915#6095]) +3 similar issues
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-18/igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#5354]) +37 similar issues
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html
>     - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#5354] / [i915#6095]) +4 similar issues
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3689] / [i915#5354]) +16 similar issues
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#3689] / [i915#5354] / [i915#6095]) +6 similar issues
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-3/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
>     - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#5354]) +11 similar issues
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-1/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
>     - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#3689] / [i915#3886] / [i915#5354]) +3 similar issues
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-12/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-10/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][147] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095]) +1 similar issue
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-4/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#6095]) +11 similar issues
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-3/igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#5354] / [i915#6095]) +5 similar issues
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-16/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#7213] / [i915#9010]) +3 similar issues
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-1/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-mtlp:         NOTRUN -> [SKIP][151] ([fdo#111827])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([fdo#111827]) +1 similar issue
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-6/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-rkl:          NOTRUN -> [SKIP][153] ([fdo#111827])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@kms_chamelium_color@ctm-red-to-blue.html
>     - shard-tglu:         NOTRUN -> [SKIP][154] ([fdo#111827])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-3/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_edid@vga-edid-read:
>     - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#7828]) +1 similar issue
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@kms_chamelium_edid@vga-edid-read.html
>     - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#7828]) +1 similar issue
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-4/igt@kms_chamelium_edid@vga-edid-read.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-multiple:
>     - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#7828]) +1 similar issue
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#7828]) +4 similar issues
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#7828]) +1 similar issue
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][160] ([i915#8628])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@content_type_change:
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#7118])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_content_protection@content_type_change.html
> 
>   * igt@kms_content_protection@lic:
>     - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#7118])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-4/igt@kms_content_protection@lic.html
>     - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#6944] / [i915#7116] / [i915#7118])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-10/igt@kms_content_protection@lic.html
> 
>   * igt@kms_content_protection@lic@pipe-a-dp-2:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][164] ([i915#7173])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@kms_content_protection@lic@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#3359])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>     - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#3359])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>     - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#3359])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#8814])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][169] ([i915#8841]) +2 similar issues
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-snb5/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([fdo#109274] / [i915#5354]) +2 similar issues
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>     - shard-rkl:          NOTRUN -> [SKIP][171] ([fdo#111825]) +2 similar issues
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>     - shard-tglu:         NOTRUN -> [SKIP][172] ([fdo#109274]) +1 similar issue
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#4103])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>     - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#4103])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-mtlp:         [PASS][175] -> [FAIL][176] ([i915#8248])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#3546])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [PASS][178] -> [FAIL][179] ([i915#2346])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#8588])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-14/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#8588])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-2/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#3555] / [i915#3840])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3840])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-4/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][184] ([fdo#109274] / [i915#3637])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-rkl:          NOTRUN -> [SKIP][185] ([fdo#111767] / [fdo#111825])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>     - shard-tglu:         NOTRUN -> [SKIP][186] ([fdo#109274] / [fdo#111767] / [i915#3637])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#3637]) +3 similar issues
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][188] ([fdo#109274]) +5 similar issues
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
>     - shard-glk:          [PASS][189] -> [FAIL][190] ([i915#79])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp4:
>     - shard-dg2:          NOTRUN -> [FAIL][191] ([fdo#103375])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-11/igt@kms_flip@flip-vs-suspend@c-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#2672]) +1 similar issue
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#2672]) +3 similar issues
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>     - shard-dg2:          [PASS][194] -> [FAIL][195] ([i915#6880]) +1 similar issue
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#1825]) +19 similar issues
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#8708]) +1 similar issue
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][198] ([fdo#111825]) +8 similar issues
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
>     - shard-tglu:         NOTRUN -> [SKIP][199] ([fdo#109280]) +8 similar issues
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#5439])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
>     - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#5439])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#3458]) +5 similar issues
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][203] ([fdo#110189]) +12 similar issues
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#8708]) +13 similar issues
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:
>     - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3023]) +8 similar issues
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>     - shard-rkl:          NOTRUN -> [SKIP][206] ([fdo#111825] / [i915#1825]) +6 similar issues
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>     - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#3458]) +13 similar issues
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#8228])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-8/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8228]) +1 similar issue
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#3555] / [i915#8228]) +1 similar issue
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html
>     - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#3555] / [i915#8228])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-3/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#4816])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#6301])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-6/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([fdo#109289]) +1 similar issue
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-4/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
> 
>   * igt@kms_plane@pixel-format@pipe-b-planes:
>     - shard-mtlp:         NOTRUN -> [FAIL][215] ([i915#1623])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-4/igt@kms_plane@pixel-format@pipe-b-planes.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#3582]) +3 similar issues
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-4/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#8806])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#6953])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][219] -> [FAIL][220] ([i915#8292])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [FAIL][221] ([i915#8292])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#5176]) +11 similar issues
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#5176]) +7 similar issues
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:
>     - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#5176]) +15 similar issues
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#5176]) +3 similar issues
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#5235]) +11 similar issues
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#5235]) +11 similar issues
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#5235]) +3 similar issues
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#5235]) +3 similar issues
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#6524] / [i915#6805])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#6524])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-5/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#658]) +1 similar issue
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#4348])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-4/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@cursor_mmap_cpu:
>     - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#1072]) +2 similar issues
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@kms_psr@cursor_mmap_cpu.html
> 
>   * igt@kms_psr@psr2_sprite_mmap_gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#1072]) +6 similar issues
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@kms_psr@psr2_sprite_mmap_gtt.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#1072]) +1 similar issue
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-19/igt@kms_psr@sprite_plane_onoff.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#4235] / [i915#5190])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-rkl:          NOTRUN -> [SKIP][238] ([fdo#111615] / [i915#5289])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>     - shard-tglu:         NOTRUN -> [SKIP][239] ([fdo#111615] / [i915#5289])
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg1:          NOTRUN -> [SKIP][240] ([fdo#111615] / [i915#5289])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>     - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#4235])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#4235]) +1 similar issue
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#3555]) +8 similar issues
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-11/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_selftest@drm_damage:
>     - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#8661]) +1 similar issue
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-1/igt@kms_selftest@drm_damage.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#3555]) +1 similar issue
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-12/igt@kms_setmode@invalid-clone-exclusive-crtc.html
>     - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#8823])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_universal_plane@universal-plane-pipe-c-sanity:
>     - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#4070] / [i915#6768])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@kms_universal_plane@universal-plane-pipe-c-sanity.html
> 
>   * igt@kms_vblank@pipe-b-query-busy:
>     - shard-mtlp:         [PASS][248] -> [DMESG-WARN][249] ([i915#2017])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-8/igt@kms_vblank@pipe-b-query-busy.html
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-5/igt@kms_vblank@pipe-b-query-busy.html
> 
>   * igt@kms_vblank@pipe-c-query-busy-hang:
>     - shard-snb:          NOTRUN -> [SKIP][250] ([fdo#109271]) +199 similar issues
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-snb5/igt@kms_vblank@pipe-c-query-busy-hang.html
> 
>   * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
>     - shard-dg2:          [PASS][251] -> [INCOMPLETE][252] ([i915#7838])
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@pipe-d-query-forked-busy:
>     - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#4070] / [i915#533] / [i915#6768])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@kms_vblank@pipe-d-query-forked-busy.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#8808])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-8/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#2437])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-8/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf_pmu@busy-double-start@bcs0:
>     - shard-mtlp:         NOTRUN -> [FAIL][256] ([i915#4349]) +2 similar issues
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@perf_pmu@busy-double-start@bcs0.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [PASS][257] -> [FAIL][258] ([i915#4349]) +3 similar issues
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@event-wait@rcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][259] ([fdo#112283])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@perf_pmu@event-wait@rcs0.html
> 
>   * igt@perf_pmu@faulting-read@gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#8440])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@perf_pmu@faulting-read@gtt.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#3708] / [i915#4077])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@coherency-blt:
>     - shard-mtlp:         NOTRUN -> [FAIL][262] ([i915#8445])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@prime_vgem@coherency-blt.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#3708])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-1/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@sysfs_heartbeat_interval@mixed@ccs0:
>     - shard-mtlp:         [PASS][264] -> [ABORT][265] ([i915#8552])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-2/igt@sysfs_heartbeat_interval@mixed@ccs0.html
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@sysfs_heartbeat_interval@mixed@ccs0.html
> 
>   * igt@sysfs_heartbeat_interval@mixed@vecs0:
>     - shard-mtlp:         [PASS][266] -> [FAIL][267] ([i915#1731])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-2/igt@sysfs_heartbeat_interval@mixed@vecs0.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@sysfs_heartbeat_interval@mixed@vecs0.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-dg1:          NOTRUN -> [SKIP][268] ([fdo#109307] / [i915#4818])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-12/igt@tools_test@sysfs_l3_parity.html
>     - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#4818])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-8/igt@tools_test@sysfs_l3_parity.html
> 
>   * igt@v3d/v3d_get_bo_offset@create-get-offsets:
>     - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#2575]) +4 similar issues
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-4/igt@v3d/v3d_get_bo_offset@create-get-offsets.html
> 
>   * igt@v3d/v3d_get_param@get-bad-flags:
>     - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#2575]) +10 similar issues
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-5/igt@v3d/v3d_get_param@get-bad-flags.html
> 
>   * igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:
>     - shard-rkl:          NOTRUN -> [SKIP][272] ([fdo#109315]) +5 similar issues
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html
>     - shard-tglu:         NOTRUN -> [SKIP][273] ([fdo#109315] / [i915#2575]) +5 similar issues
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-3/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html
> 
>   * igt@v3d/v3d_submit_cl@simple-flush-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#2575]) +3 similar issues
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-12/igt@v3d/v3d_submit_cl@simple-flush-cache.html
> 
>   * igt@vc4/vc4_mmap@mmap-bad-handle:
>     - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#7711]) +2 similar issues
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@vc4/vc4_mmap@mmap-bad-handle.html
> 
>   * igt@vc4/vc4_perfmon@get-values-invalid-pointer:
>     - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#7711]) +4 similar issues
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-8/igt@vc4/vc4_perfmon@get-values-invalid-pointer.html
>     - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#7711])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-12/igt@vc4/vc4_perfmon@get-values-invalid-pointer.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-willneed:
>     - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#7711]) +5 similar issues
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-3/igt@vc4/vc4_purgeable_bo@mark-willneed.html
> 
>   * igt@vc4/vc4_tiling@get-after-free:
>     - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#2575]) +3 similar issues
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-5/igt@vc4/vc4_tiling@get-after-free.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-mtlp:         [FAIL][280] ([i915#6121]) -> [PASS][281]
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-1/igt@gem_ctx_exec@basic-nohangcheck.html
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-2/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_freq@sysfs@gt0:
>     - shard-dg2:          [FAIL][282] ([i915#6786]) -> [PASS][283]
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-11/igt@gem_ctx_freq@sysfs@gt0.html
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@gem_ctx_freq@sysfs@gt0.html
> 
>   * igt@gem_eio@hibernate:
>     - shard-tglu:         [ABORT][284] ([i915#7975] / [i915#8213] / [i915#8398]) -> [PASS][285]
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-tglu-10/igt@gem_eio@hibernate.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-9/igt@gem_eio@hibernate.html
>     - shard-dg2:          [ABORT][286] ([i915#7975] / [i915#8213]) -> [PASS][287]
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-2/igt@gem_eio@hibernate.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-11/igt@gem_eio@hibernate.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][288] ([i915#5784]) -> [PASS][289] +2 similar issues
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg1-12/igt@gem_eio@unwedge-stress.html
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-18/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_endless@dispatch@bcs0:
>     - shard-dg2:          [TIMEOUT][290] ([i915#3778] / [i915#7016] / [i915#7921]) -> [PASS][291]
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-11/igt@gem_exec_endless@dispatch@bcs0.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@gem_exec_endless@dispatch@bcs0.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-rkl:          [FAIL][292] ([i915#2846]) -> [PASS][293]
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglu:         [FAIL][294] ([i915#2842]) -> [PASS][295]
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-tglu-6/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-tglu-6/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fence@parallel@bcs0:
>     - shard-mtlp:         [DMESG-FAIL][296] ([i915#8962] / [i915#9121]) -> [PASS][297] +1 similar issue
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-4/igt@gem_exec_fence@parallel@bcs0.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@gem_exec_fence@parallel@bcs0.html
> 
>   * igt@gem_exec_fence@parallel@vcs0:
>     - shard-mtlp:         [DMESG-FAIL][298] ([i915#9121]) -> [PASS][299]
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-4/igt@gem_exec_fence@parallel@vcs0.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@gem_exec_fence@parallel@vcs0.html
> 
>   * igt@gem_exec_fence@parallel@vecs0:
>     - shard-mtlp:         [FAIL][300] ([i915#8957]) -> [PASS][301] +2 similar issues
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-4/igt@gem_exec_fence@parallel@vecs0.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@gem_exec_fence@parallel@vecs0.html
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - shard-dg2:          [INCOMPLETE][302] -> [PASS][303]
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-12/igt@gem_exec_suspend@basic-s0@smem.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-2/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@gem_ppgtt@blt-vs-render-ctx0:
>     - shard-snb:          [DMESG-FAIL][304] ([i915#8295]) -> [PASS][305]
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctx0.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-snb2/igt@gem_ppgtt@blt-vs-render-ctx0.html
> 
>   * igt@i915_hangman@detector@vcs0:
>     - shard-mtlp:         [FAIL][306] ([i915#8456]) -> [PASS][307] +2 similar issues
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-7/igt@i915_hangman@detector@vcs0.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-7/igt@i915_hangman@detector@vcs0.html
> 
>   * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>     - shard-dg1:          [SKIP][308] ([i915#1937]) -> [PASS][309]
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg1-18/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>     - shard-dg1:          [FAIL][310] ([i915#3591]) -> [PASS][311] +1 similar issue
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> 
>   * igt@i915_pm_rpm@dpms-non-lpsp:
>     - shard-dg1:          [SKIP][312] ([i915#1397]) -> [PASS][313] +1 similar issue
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-16/igt@i915_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp:
>     - shard-rkl:          [SKIP][314] ([i915#1397]) -> [PASS][315]
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2:          [SKIP][316] ([i915#1397]) -> [PASS][317] +1 similar issue
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-11/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - shard-rkl:          [DMESG-FAIL][318] ([i915#5334] / [i915#7872]) -> [PASS][319]
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-rkl-1/igt@i915_selftest@live@gt_heartbeat.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-dg2:          [INCOMPLETE][320] ([i915#4817]) -> [PASS][321]
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-5/igt@i915_suspend@forcewake.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@i915_suspend@forcewake.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-mtlp:         [FAIL][322] ([i915#3743]) -> [PASS][323] +1 similar issue
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [FAIL][324] ([i915#2346]) -> [PASS][325]
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
>     - shard-dg2:          [FAIL][326] ([i915#6880]) -> [PASS][327]
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-12/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
>     - shard-mtlp:         [FAIL][328] ([i915#1623]) -> [PASS][329]
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-snb:          [ABORT][330] ([i915#4528] / [i915#8668]) -> [PASS][331]
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-snb6/igt@perf_pmu@module-unload.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-snb2/igt@perf_pmu@module-unload.html
> 
>   * igt@sysfs_heartbeat_interval@nopreempt@vecs0:
>     - shard-mtlp:         [FAIL][332] ([i915#6015]) -> [PASS][333] +1 similar issue
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - shard-snb:          [DMESG-FAIL][334] ([fdo#103375]) -> [DMESG-WARN][335] ([i915#8841])
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-snb7/igt@gem_exec_suspend@basic-s3@smem.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-snb1/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          [SKIP][336] ([i915#7118] / [i915#7162]) -> [SKIP][337] ([i915#7118]) +1 similar issue
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg2-12/igt@kms_content_protection@type1.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg2-3/igt@kms_content_protection@type1.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          [SKIP][338] ([fdo#110189] / [i915#3955]) -> [SKIP][339] ([i915#3955]) +1 similar issue
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-rkl:          [SKIP][340] ([fdo#109285]) -> [SKIP][341] ([fdo#109285] / [i915#4098])
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][342] ([i915#4070] / [i915#4816]) -> [SKIP][343] ([i915#4816])
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_psr@primary_mmap_gtt:
>     - shard-dg1:          [SKIP][344] ([i915#1072]) -> [SKIP][345] ([i915#1072] / [i915#4078])
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg1-17/igt@kms_psr@primary_mmap_gtt.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-12/igt@kms_psr@primary_mmap_gtt.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - shard-dg1:          [SKIP][346] ([i915#1072] / [i915#4078]) -> [SKIP][347] ([i915#1072])
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13546/shard-dg1-12/igt@kms_psr@primary_page_flip.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/shard-dg1-17/igt@kms_psr@primary_page_flip.html
> 
>   
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1623]: https://gitlab.freedesktop.org/drm/intel/issues/1623
>   [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3582]: https://gitlab.freedesktop.org/drm/intel/issues/3582
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
>   [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
>   [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
>   [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
>   [i915#6228]: https://gitlab.freedesktop.org/drm/intel/issues/6228
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6786]: https://gitlab.freedesktop.org/drm/intel/issues/6786
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7016]: https://gitlab.freedesktop.org/drm/intel/issues/7016
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7838]: https://gitlab.freedesktop.org/drm/intel/issues/7838
>   [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#7921]: https://gitlab.freedesktop.org/drm/intel/issues/7921
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8190]: https://gitlab.freedesktop.org/drm/intel/issues/8190
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8248]: https://gitlab.freedesktop.org/drm/intel/issues/8248
>   [i915#8289]: https://gitlab.freedesktop.org/drm/intel/issues/8289
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8295]: https://gitlab.freedesktop.org/drm/intel/issues/8295
>   [i915#8398]: https://gitlab.freedesktop.org/drm/intel/issues/8398
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8436]: https://gitlab.freedesktop.org/drm/intel/issues/8436
>   [i915#8440]: https://gitlab.freedesktop.org/drm/intel/issues/8440
>   [i915#8445]: https://gitlab.freedesktop.org/drm/intel/issues/8445
>   [i915#8456]: https://gitlab.freedesktop.org/drm/intel/issues/8456
>   [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
>   [i915#8552]: https://gitlab.freedesktop.org/drm/intel/issues/8552
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/intel/issues/8562
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8628]: https://gitlab.freedesktop.org/drm/intel/issues/8628
>   [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8670]: https://gitlab.freedesktop.org/drm/intel/issues/8670
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
>   [i915#8808]: https://gitlab.freedesktop.org/drm/intel/issues/8808
>   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
>   [i915#8823]: https://gitlab.freedesktop.org/drm/intel/issues/8823
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
>   [i915#8898]: https://gitlab.freedesktop.org/drm/intel/issues/8898
>   [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
>   [i915#8957]: https://gitlab.freedesktop.org/drm/intel/issues/8957
>   [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
>   [i915#9010]: https://gitlab.freedesktop.org/drm/intel/issues/9010
>   [i915#9121]: https://gitlab.freedesktop.org/drm/intel/issues/9121
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7449 -> IGTPW_9634
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_13546: f6024d250da6ed099dacf2955832e9efdd83e938 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9634: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/index.html
>   IGT_7449: 7449
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9634/index.html
