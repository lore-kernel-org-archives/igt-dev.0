Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86A010E545
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 18:08:15 +0000 (UTC)
Date: Thu, 17 Aug 2023 20:08:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230817180810.2f43dgph6oe2jlcb@kamilkon-desk1>
References: <20230816102431.2014326-1-janga.rahul.kumar@intel.com>
 <169220460489.10285.15210536166563864159@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169220460489.10285.15210536166563864159@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogIGZhaWx1cmUgZm9yIEFkZCBY?=
 =?utf-8?q?e_lib_support_for_hang_=26_GT_reset_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com,
 SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below issues are not related to Xe igt changes,
could you supress them and respin tests ?

Regards,
Kamil

On 2023-08-16 at 16:50:04 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add Xe lib support for hang & GT reset (rev6)
> URL   : https://patchwork.freedesktop.org/series/121292/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7438_full -> IGTPW_9596_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9596_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9596_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9596_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rps@reset:
>     - shard-tglu:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-tglu-2/igt@i915_pm_rps@reset.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-7/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-dg2:          [PASS][3] -> [WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@i915_suspend@basic-s3-without-i915.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2:          [SKIP][5] ([i915#6228]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9596_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8411])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@api_intel_bb@blit-reloc-keep-cache.html
>     - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#8411])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - shard-dg2:          [PASS][9] -> [SKIP][10] ([i915#6767])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@core_hotunplug@unbind-rebind.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@drm_fdinfo@busy-hang@bcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#8414]) +4 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-17/igt@drm_fdinfo@busy-hang@bcs0.html
> 
>   * igt@drm_fdinfo@busy-hang@rcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#8414]) +6 similar issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@drm_fdinfo@busy-hang@rcs0.html
> 
>   * igt@drm_fdinfo@busy-idle@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8414]) +19 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html
> 
>   * igt@fbdev@info:
>     - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#1849] / [i915#2582])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@fbdev@info.html
> 
>   * igt@fbdev@nullptr:
>     - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#2582])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@fbdev@nullptr.html
> 
>   * igt@fbdev@write:
>     - shard-dg2:          [PASS][16] -> [SKIP][17] ([i915#2582])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@fbdev@write.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@fbdev@write.html
> 
>   * igt@feature_discovery@display-2x:
>     - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#1839])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@feature_discovery@display-2x.html
> 
>   * igt@gem_bad_reloc@negative-reloc-lut:
>     - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#3281])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-16/igt@gem_bad_reloc@negative-reloc-lut.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#5325])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-2/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#5325])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-2/igt@gem_ccs@suspend-resume.html
>     - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#5325])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-2/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#7697])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_create@create-ext-cpu-access-sanity-check:
>     - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#6335])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-3/igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@rcs0:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][25] ([i915#8841]) +3 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-snb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#8555]) +1 similar issue
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-3/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-many:
>     - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#8555])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-many.html
> 
>   * igt@gem_ctx_persistence@hostile:
>     - shard-snb:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#1099]) +1 similar issue
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-snb5/igt@gem_ctx_persistence@hostile.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#280])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-18/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#280]) +1 similar issue
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg1:          [PASS][31] -> [FAIL][32] ([i915#5784])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg1-14/igt@gem_eio@reset-stress.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-15/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@bonded-pair:
>     - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4771])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-7/igt@gem_exec_balancer@bonded-pair.html
> 
>   * igt@gem_exec_balancer@parallel:
>     - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#4525])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-4/igt@gem_exec_balancer@parallel.html
> 
>   * igt@gem_exec_capture@pi@bcs0:
>     - shard-mtlp:         [PASS][35] -> [FAIL][36] ([i915#4475] / [i915#7765])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-3/igt@gem_exec_capture@pi@bcs0.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-2/igt@gem_exec_capture@pi@bcs0.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglu:         [PASS][37] -> [FAIL][38] ([i915#2842]) +1 similar issue
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-tglu-9/igt@gem_exec_fair@basic-flow@rcs0.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-7/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][39] ([i915#2842])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@bcs0:
>     - shard-rkl:          [PASS][40] -> [FAIL][41] ([i915#2842]) +1 similar issue
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][42] -> [FAIL][43] ([i915#2842]) +1 similar issue
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-sync:
>     - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4473] / [i915#4771]) +1 similar issue
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-3/igt@gem_exec_fair@basic-sync.html
> 
>   * igt@gem_exec_fair@basic-throttle:
>     - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3539])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@gem_exec_fair@basic-throttle.html
> 
>   * igt@gem_exec_fence@submit3:
>     - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4812])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@gem_exec_fence@submit3.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-wb:
>     - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#7697])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_params@no-vebox:
>     - shard-dg2:          [PASS][49] -> [SKIP][50] ([fdo#109283] / [i915#2575])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@gem_exec_params@no-vebox.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_exec_params@no-vebox.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-mtlp:         NOTRUN -> [SKIP][51] ([fdo#112283])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gem_exec_reloc@basic-concurrent0:
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3281]) +2 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@gem_exec_reloc@basic-concurrent0.html
> 
>   * igt@gem_exec_reloc@basic-cpu-wc-active:
>     - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#3281]) +7 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-wc-active.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-active:
>     - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#3281]) +1 similar issue
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-active.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4812]) +1 similar issue
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][56] ([i915#7975] / [i915#8213])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-12/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_fenced_exec_thrash@too-many-fences:
>     - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4860])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-5/igt@gem_fenced_exec_thrash@too-many-fences.html
>     - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4860])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-19/igt@gem_fenced_exec_thrash@too-many-fences.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#2190])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@gem_huc_copy@huc-copy.html
>     - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#2190])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-9/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#5775]) +4 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html
>     - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4613]) +3 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-2/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_media_vme:
>     - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#284])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-2/igt@gem_media_vme.html
>     - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#284])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-2/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_gtt@bad-object:
>     - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4077]) +5 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@gem_mmap_gtt@bad-object.html
> 
>   * igt@gem_mmap_gtt@ptrace:
>     - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4077]) +2 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-19/igt@gem_mmap_gtt@ptrace.html
> 
>   * igt@gem_mmap_wc@close:
>     - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4083]) +1 similar issue
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-12/igt@gem_mmap_wc@close.html
> 
>   * igt@gem_mmap_wc@read:
>     - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4083]) +1 similar issue
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@gem_mmap_wc@read.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>   * igt@gem_pread@uncached:
>     - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3282])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-17/igt@gem_pread@uncached.html
> 
>   * igt@gem_pxp@create-regular-context-2:
>     - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4270]) +1 similar issue
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-12/igt@gem_pxp@create-regular-context-2.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4270]) +1 similar issue
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4270])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
> 
>   * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#8428]) +2 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-1/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
>     - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3282]) +1 similar issue
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-1/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#3282]) +2 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-5/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@sync-unmap:
>     - shard-dg2:          [PASS][77] -> [SKIP][78] ([i915#2575]) +211 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@gem_userptr_blits@sync-unmap.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_userptr_blits@sync-unmap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3297])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@gem_userptr_blits@unsync-unmap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#3297])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-3/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gen3_render_tiledy_blits:
>     - shard-mtlp:         NOTRUN -> [SKIP][81] ([fdo#109289]) +4 similar issues
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-7/igt@gen3_render_tiledy_blits.html
> 
>   * igt@gen7_exec_parse@basic-offset:
>     - shard-dg2:          NOTRUN -> [SKIP][82] ([fdo#109289]) +1 similar issue
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@gen7_exec_parse@basic-offset.html
>     - shard-rkl:          NOTRUN -> [SKIP][83] ([fdo#109289])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-2/igt@gen7_exec_parse@basic-offset.html
> 
>   * igt@gen7_exec_parse@basic-rejected:
>     - shard-dg1:          NOTRUN -> [SKIP][84] ([fdo#109289])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-19/igt@gen7_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@batch-without-end:
>     - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#2856])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-3/igt@gen9_exec_parse@batch-without-end.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#2527])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-2/igt@gen9_exec_parse@bb-chained.html
>     - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#2527] / [i915#2856])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-2/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@i915_hangman@gt-engine-hang@vcs0:
>     - shard-mtlp:         [PASS][88] -> [FAIL][89] ([i915#7069])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-7/igt@i915_hangman@gt-engine-hang@vcs0.html
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@i915_hangman@gt-engine-hang@vcs0.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-dg2:          [PASS][90] -> [SKIP][91] ([i915#5775])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@i915_module_load@resize-bar.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-untiled:
>     - shard-mtlp:         [PASS][92] -> [FAIL][93] ([i915#8691])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
> 
>   * igt@i915_pm_backlight@basic-brightness:
>     - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#7561])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-17/igt@i915_pm_backlight@basic-brightness.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-tglu:         [PASS][95] -> [FAIL][96] ([i915#3989] / [i915#454])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt0:
>     - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#6590])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-15/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt1:
>     - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#6590]) +1 similar issue
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@i915_pm_freq_mult@media-freq@gt1.html
> 
>   * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>     - shard-rkl:          [PASS][99] -> [SKIP][100] ([i915#1937])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
>     - shard-dg1:          [PASS][101] -> [SKIP][102] ([i915#1937])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-17/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
> 
>   * igt@i915_pm_rc6_residency@rc6-accuracy:
>     - shard-mtlp:         [PASS][103] -> [SKIP][104] ([i915#8403])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@i915_pm_rc6_residency@rc6-accuracy.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>     - shard-dg1:          [PASS][105] -> [FAIL][106] ([i915#3591]) +1 similar issue
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#1397])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
>     - shard-tglu:         NOTRUN -> [SKIP][108] ([fdo#111644] / [i915#1397])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@dpms-non-lpsp:
>     - shard-dg1:          [PASS][109] -> [SKIP][110] ([i915#1397]) +3 similar issues
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg1-17/igt@i915_pm_rpm@dpms-non-lpsp.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-dg2:          [PASS][111] -> [SKIP][112] ([i915#1397])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@i915_pm_rpm@sysfs-read:
>     - shard-dg2:          [PASS][113] -> [SKIP][114] ([i915#5174]) +6 similar issues
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@i915_pm_rpm@sysfs-read.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#5174])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#6621])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-19/igt@i915_pm_rps@basic-api.html
>     - shard-mtlp:         NOTRUN -> [SKIP][117] ([i915#6621])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-2/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-mtlp:         NOTRUN -> [FAIL][118] ([i915#8346])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-1/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#8925]) +1 similar issue
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-12/igt@i915_pm_rps@thresholds-park@gt0.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#8437])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-7/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-dg1:          NOTRUN -> [SKIP][121] ([fdo#109303])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-19/igt@i915_query@query-topology-known-pci-ids.html
>     - shard-mtlp:         NOTRUN -> [SKIP][122] ([fdo#109303])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - shard-mtlp:         [PASS][123] -> [DMESG-FAIL][124] ([i915#7059])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-8/igt@i915_selftest@live@gt_mocs.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-7/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#4077]) +11 similar issues
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
>     - shard-dg2:          [PASS][126] -> [SKIP][127] ([i915#2575] / [i915#5190])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>     - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#4212]) +1 similar issue
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>   * igt@kms_addfb_basic@clobberred-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4212])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@kms_addfb_basic@clobberred-modifier.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
>     - shard-mtlp:         [PASS][130] -> [FAIL][131] ([i915#2521])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
> 
>   * igt@kms_async_flips@test-cursor:
>     - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#6229])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@kms_async_flips@test-cursor.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#404])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#404])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>     - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4538] / [i915#5286])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-16/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#5286])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
>     - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#5286])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][138] ([fdo#111614]) +2 similar issues
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
>     - shard-dg2:          [PASS][139] -> [SKIP][140] ([fdo#109315]) +27 similar issues
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-mtlp:         NOTRUN -> [FAIL][141] ([i915#3743]) +1 similar issue
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#3638])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][143] ([fdo#109315] / [i915#5190]) +7 similar issues
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#5190]) +2 similar issues
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][145] ([fdo#110723]) +3 similar issues
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([fdo#111615]) +1 similar issue
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#6187])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#4538] / [i915#5190]) +2 similar issues
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#4538]) +1 similar issue
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
>     - shard-mtlp:         NOTRUN -> [SKIP][150] ([fdo#111615]) +10 similar issues
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_joiner@2x-modeset:
>     - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#2705])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-2/igt@kms_big_joiner@2x-modeset.html
>     - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#2705])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-3/igt@kms_big_joiner@2x-modeset.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#3886] / [i915#6095]) +9 similar issues
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#3734] / [i915#5354] / [i915#6095]) +1 similar issue
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc:
>     - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#5354] / [i915#6095]) +3 similar issues
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#3689] / [i915#3886] / [i915#5354]) +2 similar issues
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>     - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#3886] / [i915#5354] / [i915#6095])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#3689] / [i915#5354] / [i915#6095]) +5 similar issues
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-16/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#6095]) +30 similar issues
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#3886] / [i915#5354] / [i915#6095])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-18/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#5354]) +13 similar issues
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html
>     - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#3689] / [i915#5354] / [i915#6095]) +3 similar issues
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-7/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_mc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#5354] / [i915#6095]) +5 similar issues
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-5/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#5354] / [i915#6095]) +4 similar issues
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-16/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
>     - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#3689] / [i915#5354]) +8 similar issues
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#4087] / [i915#7213]) +2 similar issues
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#7213])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-mtlp:         NOTRUN -> [SKIP][169] ([fdo#111827])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-1/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_edid@vga-edid-read:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#7828]) +2 similar issues
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@kms_chamelium_edid@vga-edid-read.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#7828]) +2 similar issues
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-17/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#7828]) +2 similar issues
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
>     - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#7828]) +1 similar issue
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#7828]) +5 similar issues
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_color@deep-color:
>     - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#3555])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-1/igt@kms_color@deep-color.html
>     - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#3555])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-10/igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#3116])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-1/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#7118])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#6944])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@kms_content_protection@uevent.html
>     - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#7116])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-18/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#8814]) +4 similar issues
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#3359])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>     - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#3359])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-15/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#3555]) +1 similar issue
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-19/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#3359])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#3359])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#3546]) +1 similar issue
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][188] ([fdo#111767] / [fdo#111825])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-19/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>     - shard-mtlp:         NOTRUN -> [SKIP][189] ([fdo#111767] / [i915#3546])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([fdo#109274] / [i915#5354]) +1 similar issue
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-rkl:          NOTRUN -> [SKIP][191] ([fdo#111825]) +2 similar issues
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#4103])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>     - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#4103])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-mtlp:         NOTRUN -> [FAIL][194] ([i915#8248])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-apl:          [PASS][195] -> [FAIL][196] ([i915#2346])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [PASS][197] -> [FAIL][198] ([i915#2346])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#3555] / [i915#3840])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-2/igt@kms_dsc@dsc-basic.html
>     - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#3555] / [i915#3840])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#3555] / [i915#3840])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-16/igt@kms_dsc@dsc-with-bpc-formats.html
>     - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#3840])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-5/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][203] ([fdo#111767] / [i915#3637])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][204] ([fdo#109274]) +3 similar issues
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#3637]) +6 similar issues
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-2/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-snb:          NOTRUN -> [SKIP][206] ([fdo#109271] / [fdo#111767])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-snb6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-snb:          NOTRUN -> [SKIP][207] ([fdo#109271]) +186 similar issues
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-snb2/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-apl:          NOTRUN -> [SKIP][208] ([fdo#109271]) +18 similar issues
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-apl1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-fences:
>     - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#8381]) +1 similar issue
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-2/igt@kms_flip@flip-vs-fences.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-dp2:
>     - shard-dg2:          NOTRUN -> [FAIL][210] ([fdo#103375])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-12/igt@kms_flip@flip-vs-suspend@a-dp2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#2672]) +3 similar issues
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#2587] / [i915#2672])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#2672])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#2587] / [i915#2672])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#8810]) +1 similar issue
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#2672]) +3 similar issues
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][217] ([fdo#109315]) +30 similar issues
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
>     - shard-dg2:          [PASS][218] -> [FAIL][219] ([i915#6880])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#8708]) +7 similar issues
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#8708]) +7 similar issues
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][222] ([fdo#111825] / [i915#1825]) +16 similar issues
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
>     - shard-tglu:         NOTRUN -> [SKIP][223] ([fdo#109280]) +8 similar issues
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#3458]) +3 similar issues
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#8708])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#3023]) +7 similar issues
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#5354]) +16 similar issues
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-12/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>     - shard-dg1:          NOTRUN -> [SKIP][228] ([fdo#111825]) +6 similar issues
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#1825]) +22 similar issues
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>     - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#3458]) +6 similar issues
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#8228]) +1 similar issue
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
>     - shard-tglu:         NOTRUN -> [SKIP][232] ([fdo#109289])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-7/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
>     - shard-apl:          [PASS][233] -> [ABORT][234] ([i915#180])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html
> 
>   * igt@kms_plane@pixel-format@pipe-a-planes:
>     - shard-rkl:          [PASS][235] -> [ABORT][236] ([i915#8311] / [i915#8875])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-4/igt@kms_plane@pixel-format@pipe-a-planes.html
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-2/igt@kms_plane@pixel-format@pipe-a-planes.html
> 
>   * igt@kms_plane@pixel-format@pipe-b-planes:
>     - shard-mtlp:         [PASS][237] -> [FAIL][238] ([i915#1623])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-1/igt@kms_plane@pixel-format@pipe-b-planes.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-1/igt@kms_plane@pixel-format@pipe-b-planes.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#3582]) +3 similar issues
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@kms_plane_lowres@tiling-4@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#6953])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-4/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][241] ([i915#8292])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][242] ([i915#8292])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#5176]) +3 similar issues
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1:
>     - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#5176]) +7 similar issues
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#5176]) +7 similar issues
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#5235]) +1 similar issue
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#5235]) +11 similar issues
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#5235]) +3 similar issues
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#5235]) +7 similar issues
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#7011])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@kms_prime@basic-modeset-hybrid.html
>     - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#6524])
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-2/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#658]) +1 similar issue
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@psr2_basic:
>     - shard-tglu:         NOTRUN -> [SKIP][253] ([fdo#110189]) +6 similar issues
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-7/igt@kms_psr@psr2_basic.html
> 
>   * igt@kms_psr@psr2_cursor_plane_move:
>     - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#1072]) +1 similar issue
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@kms_psr@psr2_cursor_plane_move.html
> 
>   * igt@kms_psr@psr2_primary_blt:
>     - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#1072]) +2 similar issues
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-16/igt@kms_psr@psr2_primary_blt.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#1072]) +1 similar issue
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-1/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#4235])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:
>     - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#5030]) +3 similar issues
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-7/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html
> 
>   * igt@kms_selftest@drm_cmdline:
>     - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#8661])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@kms_selftest@drm_cmdline.html
>     - shard-snb:          NOTRUN -> [SKIP][260] ([fdo#109271] / [i915#8661])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-snb6/igt@kms_selftest@drm_cmdline.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#3555]) +2 similar issues
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#8623])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#8623])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#8623])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vblank@pipe-d-query-forked-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#4070] / [i915#533] / [i915#6768]) +1 similar issue
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@kms_vblank@pipe-d-query-forked-hang.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#2437])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-2/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@perf@create-destroy-userspace-config:
>     - shard-dg2:          [PASS][267] -> [SKIP][268] ([i915#5608]) +2 similar issues
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@perf@create-destroy-userspace-config.html
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@perf@create-destroy-userspace-config.html
> 
>   * igt@perf@global-sseu-config-invalid:
>     - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#7387])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@perf@global-sseu-config-invalid.html
> 
>   * igt@perf@stress-open-close:
>     - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#5608]) +18 similar issues
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@perf@stress-open-close.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#8516])
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-14/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][272] ([i915#5493])
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-12/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-rkl:          NOTRUN -> [SKIP][273] ([fdo#109295] / [i915#3291] / [i915#3708])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-4/igt@prime_vgem@basic-write.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#3708])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#3708]) +1 similar issue
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
>     - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#2575]) +185 similar issues
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html
> 
>   * igt@sysfs_timeslice_duration@timeout@vecs0:
>     - shard-mtlp:         [PASS][277] -> [ABORT][278] ([i915#8521] / [i915#8865])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-3/igt@sysfs_timeslice_duration@timeout@vecs0.html
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@sysfs_timeslice_duration@timeout@vecs0.html
> 
>   * igt@tools_test@tools_test:
>     - shard-dg2:          [PASS][279] -> [FAIL][280] ([i915#9030])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@tools_test@tools_test.html
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@tools_test@tools_test.html
> 
>   * igt@v3d/v3d_create_bo@create-bo-zeroed:
>     - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#2575]) +2 similar issues
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-18/igt@v3d/v3d_create_bo@create-bo-zeroed.html
> 
>   * igt@v3d/v3d_mmap@mmap-bad-flags:
>     - shard-tglu:         NOTRUN -> [SKIP][282] ([fdo#109315] / [i915#2575]) +1 similar issue
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-6/igt@v3d/v3d_mmap@mmap-bad-flags.html
> 
>   * igt@v3d/v3d_submit_csd@bad-flag:
>     - shard-rkl:          NOTRUN -> [SKIP][283] ([fdo#109315]) +3 similar issues
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-4/igt@v3d/v3d_submit_csd@bad-flag.html
> 
>   * igt@v3d/v3d_wait_bo@map-bo-0ns:
>     - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#2575]) +10 similar issues
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@v3d/v3d_wait_bo@map-bo-0ns.html
> 
>   * igt@vc4/vc4_mmap@mmap-bad-handle:
>     - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#7711]) +2 similar issues
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-4/igt@vc4/vc4_mmap@mmap-bad-handle.html
> 
>   * igt@vc4/vc4_perfmon@create-perfmon-0:
>     - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#7711]) +2 similar issues
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-14/igt@vc4/vc4_perfmon@create-perfmon-0.html
> 
>   * igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
>     - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#7711]) +7 similar issues
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-1/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
>     - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#2575])
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-tglu-4/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html
> 
>   * igt@vc4/vc4_tiling@get-bad-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#7711]) +3 similar issues
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@vc4/vc4_tiling@get-bad-modifier.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-dg2:          [FAIL][290] ([i915#9027]) -> [PASS][291]
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-rkl:          [FAIL][292] ([i915#6268]) -> [PASS][293]
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile@vecs0:
>     - shard-mtlp:         [FAIL][294] ([i915#7816]) -> [PASS][295] +2 similar issues
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][296] ([i915#5784]) -> [PASS][297] +1 similar issue
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg1-15/igt@gem_eio@unwedge-stress.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-19/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_capture@pi@vcs0:
>     - shard-mtlp:         [FAIL][298] ([i915#4475]) -> [PASS][299]
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-3/igt@gem_exec_capture@pi@vcs0.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-2/igt@gem_exec_capture@pi@vcs0.html
> 
>   * igt@gem_exec_endless@dispatch@rcs0:
>     - shard-rkl:          [TIMEOUT][300] ([i915#3778]) -> [PASS][301]
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-2/igt@gem_exec_endless@dispatch@rcs0.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@gem_exec_endless@dispatch@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-rkl:          [FAIL][302] ([i915#2842]) -> [PASS][303] +1 similar issue
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-glk:          [FAIL][304] ([i915#2842]) -> [PASS][305]
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-glk6/igt@gem_exec_fair@basic-pace@rcs0.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fence@parallel@vcs0:
>     - shard-mtlp:         [DMESG-FAIL][306] ([i915#9121]) -> [PASS][307]
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-4/igt@gem_exec_fence@parallel@vcs0.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-3/igt@gem_exec_fence@parallel@vcs0.html
> 
>   * igt@gem_exec_fence@parallel@vecs0:
>     - shard-mtlp:         [FAIL][308] ([i915#8957]) -> [PASS][309] +2 similar issues
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-4/igt@gem_exec_fence@parallel@vecs0.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-3/igt@gem_exec_fence@parallel@vecs0.html
> 
>   * igt@gem_exec_params@no-blt:
>     - shard-dg2:          [SKIP][310] ([fdo#109283] / [i915#2575]) -> [PASS][311]
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_params@no-blt.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@gem_exec_params@no-blt.html
> 
>   * igt@gem_exec_schedule@preempt-engines@ccs0:
>     - shard-mtlp:         [FAIL][312] ([i915#9119]) -> [PASS][313] +4 similar issues
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-7/igt@gem_exec_schedule@preempt-engines@ccs0.html
> 
>   * igt@gem_spin_batch@user-each:
>     - shard-mtlp:         [DMESG-FAIL][314] ([i915#8962] / [i915#9121]) -> [PASS][315] +3 similar issues
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-4/igt@gem_spin_batch@user-each.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@gem_spin_batch@user-each.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-dg2:          [SKIP][316] ([i915#1397]) -> [PASS][317] +2 similar issues
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@dpms-non-lpsp:
>     - shard-rkl:          [SKIP][318] ([i915#1397]) -> [PASS][319] +2 similar issues
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-rkl-1/igt@i915_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@i915_pm_rpm@drm-resources-equal:
>     - shard-dg2:          [SKIP][320] ([i915#5174]) -> [PASS][321] +1 similar issue
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@i915_pm_rpm@drm-resources-equal.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@i915_pm_rpm@drm-resources-equal.html
> 
>   * igt@i915_selftest@perf@region:
>     - shard-dg2:          [FAIL][322] -> [PASS][323] +3 similar issues
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@i915_selftest@perf@region.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@i915_selftest@perf@region.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
>     - shard-dg2:          [SKIP][324] ([i915#2575] / [i915#5190]) -> [PASS][325]
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [FAIL][326] ([i915#2346]) -> [PASS][327]
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-mtlp:         [FAIL][328] ([i915#2346]) -> [PASS][329]
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@single-move@all-pipes:
>     - shard-mtlp:         [DMESG-WARN][330] ([i915#2017]) -> [PASS][331]
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-7/igt@kms_cursor_legacy@single-move@all-pipes.html
> 
>   * igt@kms_flip@flip-vs-panning-vs-hang@c-dp1:
>     - shard-apl:          [SKIP][332] ([fdo#109271]) -> [PASS][333] +1 similar issue
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-apl3/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-apl1/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html
> 
>   * igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1:
>     - shard-glk:          [SKIP][334] ([fdo#109271]) -> [PASS][335] +3 similar issues
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-glk1/igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-glk3/igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a4:
>     - shard-dg1:          [FAIL][336] ([fdo#103375]) -> [PASS][337] +3 similar issues
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg1-14/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a4.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a4.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][338] ([fdo#109315]) -> [PASS][339] +29 similar issues
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-12/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2:          [FAIL][340] ([i915#6880]) -> [PASS][341]
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-dg2:          [SKIP][342] ([i915#2575]) -> [PASS][343] +160 similar issues
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_getfb@getfb2-accept-ccs.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
>     - shard-apl:          [ABORT][344] ([i915#180]) -> [PASS][345]
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html
> 
>   * igt@perf@blocking-parameterized:
>     - shard-dg2:          [SKIP][346] ([i915#5608]) -> [PASS][347] +5 similar issues
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@perf@blocking-parameterized.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@perf@blocking-parameterized.html
> 
>   * igt@sysfs_heartbeat_interval@mixed@ccs0:
>     - shard-mtlp:         [ABORT][348] ([i915#8552]) -> [PASS][349]
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@ccs0.html
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@ccs0.html
> 
>   * igt@sysfs_heartbeat_interval@mixed@vecs0:
>     - shard-mtlp:         [FAIL][350] ([i915#1731]) -> [PASS][351]
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@vecs0.html
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg2:          [FAIL][352] ([i915#6121]) -> [SKIP][353] ([i915#7701])
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@device_reset@cold-reset-bound.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@device_reset@cold-reset-bound.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-dg2:          [FAIL][354] ([i915#6121] / [i915#9027]) -> [SKIP][355] ([i915#7701])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-12/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@drm_fdinfo@virtual-busy-hang:
>     - shard-dg2:          [SKIP][356] ([i915#5608]) -> [SKIP][357] ([i915#8414]) +1 similar issue
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang.html
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@drm_fdinfo@virtual-busy-hang.html
> 
>   * igt@drm_fdinfo@virtual-busy-hang-all:
>     - shard-dg2:          [SKIP][358] ([i915#8414]) -> [SKIP][359] ([i915#5608])
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@drm_fdinfo@virtual-busy-hang-all.html
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang-all.html
> 
>   * igt@feature_discovery@chamelium:
>     - shard-dg2:          [SKIP][360] ([i915#4854]) -> [SKIP][361] ([i915#2575])
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@feature_discovery@chamelium.html
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@feature_discovery@chamelium.html
> 
>   * igt@feature_discovery@display-2x:
>     - shard-dg2:          [SKIP][362] ([i915#1839]) -> [SKIP][363] ([i915#2575]) +1 similar issue
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@feature_discovery@display-2x.html
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@feature_discovery@display-2x.html
> 
>   * igt@feature_discovery@display-4x:
>     - shard-dg2:          [SKIP][364] ([i915#2575]) -> [SKIP][365] ([i915#1839])
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@feature_discovery@display-4x.html
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-12/igt@feature_discovery@display-4x.html
> 
>   * igt@feature_discovery@psr1:
>     - shard-dg2:          [SKIP][366] ([i915#658]) -> [SKIP][367] ([i915#2575]) +1 similar issue
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@feature_discovery@psr1.html
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@feature_discovery@psr1.html
> 
>   * igt@feature_discovery@psr2:
>     - shard-dg2:          [SKIP][368] ([i915#2575]) -> [SKIP][369] ([i915#658])
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@feature_discovery@psr2.html
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@feature_discovery@psr2.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-dg2:          [ABORT][370] ([i915#7461]) -> [SKIP][371] ([i915#2575])
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-dg2:          [SKIP][372] ([i915#2575]) -> [SKIP][373] ([i915#8555]) +1 similar issue
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_persistence@heartbeat-stop:
>     - shard-dg2:          [SKIP][374] ([i915#8555]) -> [SKIP][375] ([i915#2575])
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-stop.html
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html
> 
>   * igt@gem_exec_balancer@bonded-sync:
>     - shard-dg2:          [SKIP][376] ([i915#2575]) -> [SKIP][377] ([i915#4771]) +2 similar issues
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@gem_exec_balancer@bonded-sync.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg2:          [SKIP][378] ([i915#4812]) -> [SKIP][379] ([i915#2575]) +1 similar issue
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg2:          [SKIP][380] ([i915#2575]) -> [SKIP][381] ([i915#4036])
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@sliced:
>     - shard-dg2:          [SKIP][382] ([i915#2575]) -> [SKIP][383] ([i915#4812])
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_balancer@sliced.html
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@gem_exec_balancer@sliced.html
> 
>   * igt@gem_exec_fair@basic-sync:
>     - shard-dg2:          [SKIP][384] ([i915#3539]) -> [SKIP][385] ([i915#2575])
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@gem_exec_fair@basic-sync.html
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_exec_fair@basic-sync.html
> 
>   * igt@gem_exec_flush@basic-uc-pro-default:
>     - shard-dg2:          [SKIP][386] ([i915#2575]) -> [SKIP][387] ([i915#3539] / [i915#4852]) +4 similar issues
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@gem_exec_flush@basic-uc-pro-default.html
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - shard-dg2:          [SKIP][388] ([i915#2575]) -> [SKIP][389] ([i915#3539]) +1 similar issue
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_flush@basic-uc-prw-default.html
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>   * igt@gem_exec_flush@basic-wb-rw-before-default:
>     - shard-dg2:          [SKIP][390] ([i915#3539] / [i915#4852]) -> [SKIP][391] ([i915#2575]) +2 similar issues
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@gem_exec_flush@basic-wb-rw-before-default.html
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-before-default.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-dg2:          [SKIP][392] ([i915#2575]) -> [SKIP][393] ([i915#7697]) +1 similar issue
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_params@secure-non-master:
>     - shard-dg2:          [SKIP][394] ([fdo#112283]) -> [SKIP][395] ([i915#2575])
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@gem_exec_params@secure-non-master.html
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_exec_params@secure-non-master.html
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt:
>     - shard-dg2:          [SKIP][396] ([i915#3281]) -> [SKIP][397] ([i915#2575]) +7 similar issues
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_exec_reloc@basic-cpu-gtt.html
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt.html
> 
>   * igt@gem_exec_reloc@basic-cpu-noreloc:
>     - shard-dg2:          [SKIP][398] ([i915#2575]) -> [SKIP][399] ([i915#3281]) +8 similar issues
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-noreloc.html
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-noreloc.html
> 
>   * igt@gem_exec_schedule@reorder-wide:
>     - shard-dg2:          [SKIP][400] ([i915#2575]) -> [SKIP][401] ([i915#4537] / [i915#4812]) +2 similar issues
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@gem_exec_schedule@reorder-wide.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - shard-dg2:          [SKIP][402] ([i915#4537] / [i915#4812]) -> [SKIP][403] ([i915#2575])
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@gem_exec_schedule@semaphore-power.html
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_fenced_exec_thrash@2-spare-fences:
>     - shard-dg2:          [SKIP][404] ([i915#4860]) -> [SKIP][405] ([i915#2575]) +2 similar issues
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@gem_fenced_exec_thrash@2-spare-fences.html
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
>     - shard-dg2:          [SKIP][406] ([i915#2575]) -> [SKIP][407] ([i915#4860]) +2 similar issues
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-dg2:          [SKIP][408] ([i915#2575]) -> [SKIP][409] ([i915#8289])
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_media_fill@media-fill.html
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-xy:
>     - shard-dg2:          [SKIP][410] ([i915#4077]) -> [SKIP][411] ([i915#2575]) +11 similar issues
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
> 
>   * igt@gem_mmap_wc@copy:
>     - shard-dg2:          [SKIP][412] ([i915#4083]) -> [SKIP][413] ([i915#2575]) +8 similar issues
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_mmap_wc@copy.html
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_mmap_wc@copy.html
> 
>   * igt@gem_mmap_wc@write-wc-read-gtt:
>     - shard-dg2:          [SKIP][414] ([i915#2575]) -> [SKIP][415] ([i915#4083]) +3 similar issues
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_mmap_wc@write-wc-read-gtt.html
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@gem_mmap_wc@write-wc-read-gtt.html
> 
>   * igt@gem_partial_pwrite_pread@reads-uncached:
>     - shard-dg2:          [SKIP][416] ([i915#3282]) -> [SKIP][417] ([i915#2575]) +5 similar issues
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@gem_partial_pwrite_pread@reads-uncached.html
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-display:
>     - shard-dg2:          [SKIP][418] ([i915#2575]) -> [SKIP][419] ([i915#3282]) +1 similar issue
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-dg2:          [SKIP][420] ([i915#2575]) -> [SKIP][421] ([i915#4270]) +2 similar issues
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-dg2:          [SKIP][422] ([i915#4270]) -> [SKIP][423] ([i915#2575]) +1 similar issue
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>     - shard-dg2:          [SKIP][424] ([i915#5190]) -> [SKIP][425] ([i915#2575] / [i915#5190]) +11 similar issues
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-dg2:          [SKIP][426] ([i915#4079]) -> [SKIP][427] ([i915#2575])
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-dg2:          [SKIP][428] ([i915#2575]) -> [SKIP][429] ([i915#4079]) +1 similar issue
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_set_tiling_vs_gtt.html
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_tiling_max_stride:
>     - shard-dg2:          [SKIP][430] ([i915#2575]) -> [SKIP][431] ([i915#4077]) +9 similar issues
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_tiling_max_stride.html
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@gem_tiling_max_stride.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-dg2:          [SKIP][432] ([i915#2575]) -> [SKIP][433] ([i915#3297]) +2 similar issues
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-dg2:          [SKIP][434] ([i915#3297]) -> [SKIP][435] ([i915#2575]) +3 similar issues
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_userptr_blits@dmabuf-unsync.html
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-busy:
>     - shard-dg2:          [SKIP][436] ([i915#3297] / [i915#4880]) -> [SKIP][437] ([i915#2575])
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-dg2:          [SKIP][438] ([i915#2575]) -> [SKIP][439] ([i915#3297] / [i915#4880]) +1 similar issue
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
>    [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gen3_render_tiledx_blits:
>     - shard-dg2:          [SKIP][440] ([i915#2575]) -> [SKIP][441] ([fdo#109289]) +1 similar issue
>    [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gen3_render_tiledx_blits.html
>    [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-6/igt@gen3_render_tiledx_blits.html
> 
>   * igt@gen9_exec_parse@batch-invalid-length:
>     - shard-dg2:          [SKIP][442] ([i915#2575]) -> [SKIP][443] ([i915#2856]) +2 similar issues
>    [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gen9_exec_parse@batch-invalid-length.html
>    [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@gen9_exec_parse@batch-invalid-length.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - shard-dg2:          [SKIP][444] ([i915#2856]) -> [SKIP][445] ([i915#2575]) +2 similar issues
>    [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@gen9_exec_parse@valid-registers.html
>    [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_pm_backlight@basic-brightness:
>     - shard-dg2:          [SKIP][446] ([i915#2575]) -> [SKIP][447] ([i915#5354] / [i915#7561]) +2 similar issues
>    [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html
>    [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@i915_pm_backlight@basic-brightness.html
> 
>   * igt@i915_pm_backlight@fade-with-suspend:
>     - shard-dg2:          [SKIP][448] ([i915#5354] / [i915#7561]) -> [SKIP][449] ([i915#2575])
>    [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@i915_pm_backlight@fade-with-suspend.html
>    [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@i915_pm_backlight@fade-with-suspend.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg2:          [SKIP][450] ([i915#1397]) -> [SKIP][451] ([i915#5174])
>    [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
>    [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-dg2:          [SKIP][452] ([fdo#109506]) -> [SKIP][453] ([i915#5174])
>    [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
>    [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2:          [SKIP][454] ([i915#5174]) -> [SKIP][455] ([i915#1397])
>    [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>    [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-dg2:          [SKIP][456] ([i915#5174]) -> [SKIP][457] ([fdo#109506])
>    [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
>    [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-dg2:          [SKIP][458] ([i915#6621]) -> [SKIP][459] ([i915#2575]) +1 similar issue
>    [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@i915_pm_rps@min-max-config-idle.html
>    [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-snb:          [DMESG-WARN][460] ([i915#8841]) -> [ABORT][461] ([i915#4528] / [i915#8213] / [i915#8841])
>    [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-snb4/igt@i915_suspend@basic-s2idle-without-i915.html
>    [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-snb2/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2:          [SKIP][462] ([i915#2575] / [i915#5190]) -> [SKIP][463] ([i915#5190]) +8 similar issues
>    [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - shard-dg2:          [SKIP][464] ([i915#4212]) -> [SKIP][465] ([i915#2575]) +2 similar issues
>    [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html
>    [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          [SKIP][466] ([i915#2575] / [i915#5190]) -> [SKIP][467] ([i915#4215] / [i915#5190])
>    [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
>    [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-10/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg2:          [SKIP][468] ([i915#2575]) -> [SKIP][469] ([i915#4212]) +1 similar issue
>    [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
>    [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-1/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_async_flips@crc@pipe-a-edp-1:
>     - shard-mtlp:         [DMESG-FAIL][470] ([i915#8561]) -> [DMESG-FAIL][471] ([i915#1982] / [i915#8561])
>    [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-5/igt@kms_async_flips@crc@pipe-a-edp-1.html
>    [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-mtlp-6/igt@kms_async_flips@crc@pipe-a-edp-1.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-dg2:          [SKIP][472] ([i915#404]) -> [SKIP][473] ([i915#2575])
>    [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>    [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2:          [SKIP][474] ([fdo#111614]) -> [SKIP][47
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9596/index.html
