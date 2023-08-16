Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C1510E0C3
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 14:14:07 +0000 (UTC)
Date: Wed, 16 Aug 2023 16:14:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230816141403.6vxbhbkgpb6nkruz@kamilkon-desk1>
References: <20230809005014.3451790-1-vinay.belgaumkar@intel.com>
 <169158636526.10296.59369887767333576@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169158636526.10296.59369887767333576@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSAgZm9yIHRlc3Rz?=
 =?utf-8?q?/i915=5Fpm=5Ffreq=5Fapi=3A_Ignore_zero_register_value?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2023-08-09 at 13:06:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/i915_pm_freq_api: Ignore zero register value
> URL   : https://patchwork.freedesktop.org/series/122187/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7424_full -> IGTPW_9548_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9548_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9548_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9548_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@perf@region:
>     - shard-dg2:          [PASS][1] -> [FAIL][2] +3 similar issues
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@i915_selftest@perf@region.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@i915_selftest@perf@region.html
> 
>   * igt@kms_async_flips@test-time-stamp:
>     - shard-dg2:          NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_async_flips@test-time-stamp.html
> 

This is not related to tests/i915_pm_freq_api,
could you supress them and respin tests ?

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9548_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@drm_fdinfo@busy-idle-check-all@vcs1:
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8414]) +4 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-17/igt@drm_fdinfo@busy-idle-check-all@vcs1.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [PASS][5] -> [FAIL][6] ([i915#7742])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@drm_fdinfo@virtual-busy-idle-all:
>     - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#8414])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@drm_fdinfo@virtual-busy-idle-all.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#5325])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#8555])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-1/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-stop:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8555]) +1 similar issue
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-stop.html
> 
>   * igt@gem_ctx_persistence@idempotent:
>     - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-snb5/igt@gem_ctx_persistence@idempotent.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile@vecs0:
>     - shard-mtlp:         [PASS][12] -> [FAIL][13] ([i915#7816]) +2 similar issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg2:          [PASS][14] -> [FAIL][15] ([i915#5784])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-2/igt@gem_eio@reset-stress.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@bonded-false-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#4812])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-5/igt@gem_exec_balancer@bonded-false-hang.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#4812])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@sliced:
>     - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#4812])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-13/igt@gem_exec_balancer@sliced.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][19] ([i915#2842])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-glk3/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace:
>     - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#4473] / [i915#4771])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@gem_exec_fair@basic-pace.html
> 
>   * igt@gem_exec_flush@basic-uc-ro-default:
>     - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#3539] / [i915#4852])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html
> 
>   * igt@gem_exec_params@secure-non-master:
>     - shard-mtlp:         NOTRUN -> [SKIP][22] ([fdo#112283])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-7/igt@gem_exec_params@secure-non-master.html
> 
>   * igt@gem_exec_reloc@basic-range:
>     - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#3281]) +2 similar issues
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-8/igt@gem_exec_reloc@basic-range.html
> 
>   * igt@gem_exec_reloc@basic-wc-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#3281]) +4 similar issues
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-14/igt@gem_exec_reloc@basic-wc-cpu.html
> 
>   * igt@gem_exec_reloc@basic-wc-noreloc:
>     - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#3281])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-1/igt@gem_exec_reloc@basic-wc-noreloc.html
>     - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#3281])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-6/igt@gem_exec_reloc@basic-wc-noreloc.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][27] ([i915#7975] / [i915#8213])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
>     - shard-dg1:          [PASS][28] -> [ABORT][29] ([i915#7975] / [i915#8213])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-19/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#5775])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
>     - shard-dg1:          [PASS][32] -> [DMESG-WARN][33] ([i915#4391] / [i915#4423])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [PASS][34] -> [DMESG-WARN][35] ([i915#4936] / [i915#5493])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#4613])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@gem_lmem_swapping@verify-random.html
>     - shard-tglu:         NOTRUN -> [SKIP][37] ([i915#4613])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-8/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-xy:
>     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4077])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
> 
>   * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
>     - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4083]) +1 similar issue
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-1/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
>     - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4083])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-1/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
> 
>   * igt@gem_partial_pwrite_pread@reads:
>     - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3282]) +1 similar issue
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-2/igt@gem_partial_pwrite_pread@reads.html
>     - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#3282])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
>     - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#3282]) +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4270]) +1 similar issue
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
>     - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4270])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
>     - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#4270])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#4270]) +1 similar issue
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4270])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#5190]) +3 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#8428])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-1/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_tiled_wb:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4077])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-5/igt@gem_tiled_wb.html
> 
>   * igt@gen7_exec_parse@oacontrol-tracking:
>     - shard-mtlp:         NOTRUN -> [SKIP][52] ([fdo#109289])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-7/igt@gen7_exec_parse@oacontrol-tracking.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [PASS][53] -> [ABORT][54] ([i915#5566])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-glk8/igt@gen9_exec_parse@allowed-all.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-glk1/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-apl:          [PASS][55] -> [ABORT][56] ([i915#5566])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-apl6/igt@gen9_exec_parse@allowed-single.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-apl2/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@batch-invalid-length:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#2856]) +1 similar issue
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-5/igt@gen9_exec_parse@batch-invalid-length.html
>     - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#2527]) +1 similar issue
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@gen9_exec_parse@batch-invalid-length.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#2527])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-17/igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@i915_hangman@gt-engine-error@vcs0:
>     - shard-mtlp:         [PASS][60] -> [FAIL][61] ([i915#7069])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-3/igt@i915_hangman@gt-engine-error@vcs0.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-1/igt@i915_hangman@gt-engine-error@vcs0.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-mtlp:         NOTRUN -> [ABORT][62] ([i915#8489] / [i915#8668])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api@gt0:
>     - shard-mtlp:         [PASS][63] -> [FAIL][64] ([i915#8670])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-6/igt@i915_pm_freq_api@freq-basic-api@gt0.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-2/igt@i915_pm_freq_api@freq-basic-api@gt0.html
> 
>   * igt@i915_pm_lpsp@screens-disabled:
>     - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#1902])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-5/igt@i915_pm_lpsp@screens-disabled.html
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#8403])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
>     - shard-dg2:          NOTRUN -> [SKIP][67] ([fdo#109289])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-11/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>     - shard-dg1:          [PASS][68] -> [FAIL][69] ([i915#3591])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>     - shard-mtlp:         [PASS][70] -> [ABORT][71] ([i915#7077] / [i915#7977] / [i915#8668])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-1/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-1/igt@i915_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@i915_pm_rpm@dpms-lpsp:
>     - shard-rkl:          [PASS][72] -> [SKIP][73] ([i915#1397]) +2 similar issues
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@i915_pm_rpm@dpms-lpsp.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#1397])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp:
>     - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#1397])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-2/igt@i915_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@pc8-residency:
>     - shard-dg2:          NOTRUN -> [SKIP][76] ([fdo#109506])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-2/igt@i915_pm_rpm@pc8-residency.html
>     - shard-rkl:          NOTRUN -> [SKIP][77] ([fdo#109506])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-6/igt@i915_pm_rpm@pc8-residency.html
> 
>   * igt@i915_pm_rpm@system-suspend-execbuf:
>     - shard-dg2:          [PASS][78] -> [FAIL][79] ([fdo#103375])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@i915_pm_rpm@system-suspend-execbuf.html
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-11/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>   * igt@i915_pm_rps@min-max-config-loaded:
>     - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#6621])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html
> 
>   * igt@i915_pm_rps@thresholds-idle-park@gt0:
>     - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#8925]) +1 similar issue
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-6/igt@i915_pm_rps@thresholds-idle-park@gt0.html
>     - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#8925])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-1/igt@i915_pm_rps@thresholds-idle-park@gt0.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4077])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-17/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][84] ([i915#8841]) +2 similar issues
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-snb2/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_addfb_basic@clobberred-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4212])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-5/igt@kms_addfb_basic@clobberred-modifier.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#8502]) +3 similar issues
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-rc_ccs-cc:
>     - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#8502] / [i915#8709]) +11 similar issues
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-rc_ccs-cc.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#8502]) +7 similar issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html
> 
>   * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [FAIL][89] ([i915#8247]) +3 similar issues
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-3/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [FAIL][90] ([i915#8247]) +3 similar issues
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-13/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_async_flips@crc@pipe-b-vga-1:
>     - shard-snb:          NOTRUN -> [FAIL][91] ([i915#8247]) +1 similar issue
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-snb2/igt@kms_async_flips@crc@pipe-b-vga-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#1769] / [i915#3555])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-transition:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#2575]) +26 similar issues
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_atomic_transition@plane-all-transition.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4538] / [i915#5286]) +2 similar issues
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-mtlp:         [PASS][95] -> [FAIL][96] ([i915#5138])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-2/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][97] ([fdo#111614])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-1/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#3638])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-18/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][99] ([fdo#111614] / [i915#3638])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         [PASS][100] -> [FAIL][101] ([i915#3743])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][102] ([fdo#111615]) +1 similar issue
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4538] / [i915#5190])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#4538]) +2 similar issues
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
>     - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#5354] / [i915#6095]) +1 similar issue
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-2/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#3886] / [i915#6095])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +3 similar issues
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-19/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc:
>     - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#5354]) +20 similar issues
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-10/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc.html
>     - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#5354] / [i915#6095]) +4 similar issues
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
>     - shard-glk:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-glk2/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>     - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#3689] / [i915#3886] / [i915#5354]) +5 similar issues
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-5/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#3734] / [i915#5354] / [i915#6095])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-7/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#3689] / [i915#5354] / [i915#6095]) +5 similar issues
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-16/igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#3689] / [i915#5354]) +5 similar issues
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:
>     - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#5354] / [i915#6095]) +6 similar issues
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-15/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#6095]) +8 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-7/igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#5354]) +5 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-6/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2:          NOTRUN -> [SKIP][118] ([fdo#111827])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-5/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-dg1:          NOTRUN -> [SKIP][119] ([fdo#111827])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-19/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#7828]) +2 similar issues
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-fast.html
>     - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#7828]) +1 similar issue
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#7828]) +1 similar issue
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>     - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#7828]) +1 similar issue
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>     - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#7828])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_color@deep-color:
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#3555])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-6/igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][126] ([i915#7173])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-11/igt@kms_content_protection@legacy@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#7118]) +2 similar issues
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-2/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#7118])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-2/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#3555])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-13/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#3359])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4103] / [i915#4213])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#4103])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>     - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#4103]) +1 similar issue
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>     - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#4103] / [i915#4213])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([fdo#109274] / [i915#5354]) +2 similar issues
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>     - shard-rkl:          NOTRUN -> [SKIP][136] ([fdo#111825]) +1 similar issue
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#3546]) +1 similar issue
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-apl:          [PASS][138] -> [FAIL][139] ([i915#2346])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#4213])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#8588])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-1/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#8588])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-2/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#8588])
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-4/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#3555]) +4 similar issues
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-dg2:          NOTRUN -> [SKIP][145] ([fdo#109274]) +1 similar issue
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([fdo#109274] / [i915#3637])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-3/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#3637]) +1 similar issue
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][148] -> [FAIL][149] ([i915#2122])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-glk1/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-hdmi-a4:
>     - shard-dg1:          [PASS][150] -> [DMESG-WARN][151] ([i915#4423])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-18/igt@kms_flip@flip-vs-suspend@c-hdmi-a4.html
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-18/igt@kms_flip@flip-vs-suspend@c-hdmi-a4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#2587] / [i915#2672]) +1 similar issue
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][153] ([fdo#109315]) +1 similar issue
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#2672])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
>     - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#2587] / [i915#2672])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#2672])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#2672]) +1 similar issue
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>     - shard-dg2:          [PASS][158] -> [FAIL][159] ([i915#6880])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#8708]) +7 similar issues
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
>     - shard-dg1:          NOTRUN -> [SKIP][161] ([fdo#111825]) +10 similar issues
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#8708])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#1825]) +6 similar issues
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-dg2:          [PASS][164] -> [SKIP][165] ([fdo#109315]) +4 similar issues
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#8708]) +1 similar issue
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
>     - shard-rkl:          NOTRUN -> [SKIP][167] ([fdo#111825] / [i915#1825]) +7 similar issues
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#3458]) +7 similar issues
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#3458]) +5 similar issues
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#3023]) +3 similar issues
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-tglu:         NOTRUN -> [SKIP][171] ([fdo#109280]) +2 similar issues
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3555] / [i915#8228])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#3555] / [i915#8228])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html
>     - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#3555] / [i915#8228])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-3/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#8806])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@kms_plane_multiple@tiling-y.html
>     - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#8806])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-11/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [FAIL][177] ([i915#8292])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#5176]) +7 similar issues
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#5176]) +1 similar issue
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#5176]) +15 similar issues
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-16/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#5235]) +11 similar issues
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4:
>     - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#5235]) +11 similar issues
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#5235]) +1 similar issue
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#5235]) +3 similar issues
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [SKIP][185] ([fdo#109271]) +110 similar issues
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-glk1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#6524] / [i915#6805])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-2/igt@kms_prime@basic-crc-hybrid.html
>     - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#6524])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html
>     - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#6524])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-8/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area:
>     - shard-dg1:          NOTRUN -> [SKIP][189] ([fdo#111068] / [i915#658])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-15/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-glk:          NOTRUN -> [SKIP][190] ([fdo#109271] / [i915#658])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-glk9/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@no_drrs:
>     - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#1072]) +2 similar issues
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_psr@no_drrs.html
> 
>   * igt@kms_psr@primary_render:
>     - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#1072])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@kms_psr@primary_render.html
>     - shard-tglu:         NOTRUN -> [SKIP][193] ([fdo#110189]) +3 similar issues
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-4/igt@kms_psr@primary_render.html
> 
>   * igt@kms_psr@psr2_sprite_mmap_cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#1072]) +2 similar issues
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-19/igt@kms_psr@psr2_sprite_mmap_cpu.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#5461] / [i915#658])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>     - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#5461] / [i915#658])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#5461] / [i915#658])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-11/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#4235]) +1 similar issue
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_selftest@drm_format:
>     - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#8661])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-5/igt@kms_selftest@drm_format.html
>     - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#8661])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@kms_selftest@drm_format.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
>     - shard-snb:          NOTRUN -> [FAIL][201] ([i915#5465]) +1 similar issue
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#4098])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-4/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#8823])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_vblank@pipe-c-wait-busy:
>     - shard-dg2:          [PASS][204] -> [SKIP][205] ([i915#2575]) +41 similar issues
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-8/igt@kms_vblank@pipe-c-wait-busy.html
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_vblank@pipe-c-wait-busy.html
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#4070] / [i915#533] / [i915#6768])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-7/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#2437])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-glk:          NOTRUN -> [SKIP][208] ([fdo#109271] / [i915#2437])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-glk4/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@perf@enable-disable:
>     - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#5608]) +2 similar issues
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@perf@enable-disable.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#2434])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-5/igt@perf@mi-rpc.html
>     - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#2434])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@perf@mi-rpc.html
> 
>   * igt@perf_pmu@busy-double-start@vcs1:
>     - shard-dg1:          [PASS][212] -> [FAIL][213] ([i915#4349]) +1 similar issue
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-18/igt@perf_pmu@busy-double-start@vcs1.html
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-16/igt@perf_pmu@busy-double-start@vcs1.html
> 
>   * igt@perf_pmu@interrupts:
>     - shard-dg2:          [PASS][214] -> [SKIP][215] ([i915#5608]) +1 similar issue
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-6/igt@perf_pmu@interrupts.html
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@perf_pmu@interrupts.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#3708])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-13/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#3708] / [i915#4077])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-11/igt@prime_vgem@coherency-gtt.html
>     - shard-rkl:          NOTRUN -> [SKIP][218] ([fdo#109295] / [fdo#111656] / [i915#3708])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-6/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@sysfs_timeslice_duration@idempotent@vcs0:
>     - shard-snb:          NOTRUN -> [SKIP][219] ([fdo#109271]) +180 similar issues
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-snb2/igt@sysfs_timeslice_duration@idempotent@vcs0.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-tglu:         NOTRUN -> [SKIP][220] ([fdo#109307])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-8/igt@tools_test@sysfs_l3_parity.html
> 
>   * igt@v3d/v3d_perfmon@get-values-valid-perfmon:
>     - shard-rkl:          NOTRUN -> [SKIP][221] ([fdo#109315]) +3 similar issues
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-4/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html
>     - shard-tglu:         NOTRUN -> [SKIP][222] ([fdo#109315] / [i915#2575]) +1 similar issue
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-6/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html
> 
>   * igt@v3d/v3d_wait_bo@used-bo:
>     - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#2575]) +4 similar issues
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@v3d/v3d_wait_bo@used-bo.html
>     - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#2575])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-17/igt@v3d/v3d_wait_bo@used-bo.html
> 
>   * igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:
>     - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#7711]) +1 similar issue
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-2/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice:
>     - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#7711]) +2 similar issues
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-18/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice.html
> 
>   * igt@vc4/vc4_tiling@set-bad-flags:
>     - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#7711])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-3/igt@vc4/vc4_tiling@set-bad-flags.html
>     - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#7711])
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-2/igt@vc4/vc4_tiling@set-bad-flags.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@unaligned-write:
>     - shard-mtlp:         [DMESG-WARN][229] ([i915#2017]) -> [PASS][230]
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-5/igt@fbdev@unaligned-write.html
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@fbdev@unaligned-write.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-mtlp:         [FAIL][231] ([i915#6121]) -> [PASS][232]
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-6/igt@gem_ctx_exec@basic-nohangcheck.html
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@engines-hang@vcs0:
>     - shard-mtlp:         [FAIL][233] ([i915#2410]) -> [PASS][234] +3 similar issues
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-4/igt@gem_ctx_persistence@engines-hang@vcs0.html
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-5/igt@gem_ctx_persistence@engines-hang@vcs0.html
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - shard-mtlp:         [ABORT][235] ([i915#7941]) -> [PASS][236]
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-3/igt@gem_eio@in-flight-contexts-10ms.html
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-1/igt@gem_eio@in-flight-contexts-10ms.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][237] ([i915#5784]) -> [PASS][238]
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-18/igt@gem_eio@unwedge-stress.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-17/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-rkl:          [FAIL][239] ([i915#2842]) -> [PASS][240] +1 similar issue
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-glk:          [FAIL][241] ([i915#2842]) -> [PASS][242] +2 similar issues
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@i915_hangman@detector@vcs0:
>     - shard-mtlp:         [FAIL][243] ([i915#8456]) -> [PASS][244] +2 similar issues
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-4/igt@i915_hangman@detector@vcs0.html
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html
> 
>   * igt@i915_hangman@gt-engine-hang@vcs0:
>     - shard-mtlp:         [FAIL][245] ([i915#7069]) -> [PASS][246]
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-8/igt@i915_hangman@gt-engine-hang@vcs0.html
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-5/igt@i915_hangman@gt-engine-hang@vcs0.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-tglu:         [FAIL][247] ([i915#3989] / [i915#454]) -> [PASS][248]
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-3/igt@i915_pm_dc@dc6-dpms.html
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-10/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_rc6_residency@rc6-accuracy:
>     - shard-dg2:          [FAIL][249] -> [PASS][250] +1 similar issue
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-6/igt@i915_pm_rc6_residency@rc6-accuracy.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>     - shard-tglu:         [WARN][251] ([i915#2681]) -> [PASS][252]
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>     - shard-dg1:          [FAIL][253] ([i915#3591]) -> [PASS][254]
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
> 
>   * igt@i915_pm_rpm@dpms-non-lpsp:
>     - shard-rkl:          [SKIP][255] ([i915#1397]) -> [PASS][256] +1 similar issue
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-6/igt@i915_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress@smem0:
>     - shard-dg1:          [FAIL][257] ([i915#7940]) -> [PASS][258] +1 similar issue
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-17/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress:
>     - shard-tglu:         [FAIL][259] ([i915#7940]) -> [PASS][260]
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-6/igt@i915_pm_rpm@modeset-lpsp-stress.html
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-9/igt@i915_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2:          [SKIP][261] ([i915#1397]) -> [PASS][262] +1 similar issue
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-tglu:         [INCOMPLETE][263] ([i915#8320]) -> [PASS][264]
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-9/igt@i915_pm_rps@reset.html
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-6/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_selftest@live@requests:
>     - shard-mtlp:         [DMESG-FAIL][265] ([i915#8497]) -> [PASS][266]
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-7/igt@i915_selftest@live@requests.html
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-8/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_selftest@live@slpc:
>     - shard-mtlp:         [DMESG-WARN][267] ([i915#6367]) -> [PASS][268]
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-7/igt@i915_selftest@live@slpc.html
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-8/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-rkl:          [FAIL][269] ([fdo#103375]) -> [PASS][270]
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [FAIL][271] ([i915#5138]) -> [PASS][272] +1 similar issue
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-mtlp:         [FAIL][273] ([i915#3743]) -> [PASS][274] +2 similar issues
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [FAIL][275] ([i915#2346]) -> [PASS][276]
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-mtlp:         [FAIL][277] ([i915#2346]) -> [PASS][278]
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
>     - shard-dg2:          [FAIL][279] ([fdo#103375]) -> [PASS][280] +1 similar issue
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-5/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
>     - shard-dg2:          [FAIL][281] ([i915#6880]) -> [PASS][282] +2 similar issues
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglu:         [SKIP][283] ([i915#433]) -> [PASS][284]
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-7/igt@kms_hdmi_inject@inject-audio.html
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-apl:          [FAIL][285] ([IGT#2]) -> [PASS][286]
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-apl4/igt@kms_sysfs_edid_timing.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-apl6/igt@kms_sysfs_edid_timing.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [FAIL][287] ([i915#4349]) -> [PASS][288] +3 similar issues
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-1/igt@perf_pmu@busy-double-start@vecs1.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all@rcs0:
>     - shard-dg2:          [FAIL][289] ([i915#5234]) -> [PASS][290]
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-10/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>     - shard-mtlp:         [FAIL][291] ([i915#5234]) -> [PASS][292]
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
> 
>   * igt@sysfs_timeslice_duration@timeout@vecs0:
>     - shard-mtlp:         [ABORT][293] ([i915#8521] / [i915#8865]) -> [PASS][294]
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-3/igt@sysfs_timeslice_duration@timeout@vecs0.html
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-2/igt@sysfs_timeslice_duration@timeout@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          [SKIP][295] ([i915#8411]) -> [SKIP][296] ([i915#2575])
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-dg2:          [SKIP][297] ([i915#280]) -> [SKIP][298] ([i915#2575])
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-10/igt@gem_ctx_sseu@engines.html
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-dg2:          [SKIP][299] ([i915#3539] / [i915#4852]) -> [SKIP][300] ([i915#2575]) +1 similar issue
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-3/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_media_vme:
>     - shard-dg2:          [SKIP][301] ([i915#284]) -> [SKIP][302] ([i915#2575])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-3/igt@gem_media_vme.html
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_wc@coherency:
>     - shard-dg2:          [SKIP][303] ([i915#4083]) -> [SKIP][304] ([i915#2575])
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@gem_mmap_wc@coherency.html
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_mmap_wc@coherency.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-dg2:          [SKIP][305] ([i915#4270]) -> [SKIP][306] ([i915#2575])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_render_copy@yf-tiled:
>     - shard-dg2:          [SKIP][307] ([i915#5190]) -> [SKIP][308] ([i915#2575] / [i915#5190]) +2 similar issues
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@gem_render_copy@yf-tiled.html
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_render_copy@yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-dg2:          [SKIP][309] ([i915#4079]) -> [SKIP][310] ([i915#2575])
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-10/igt@gem_set_tiling_vs_pwrite.html
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_tiled_blits@basic:
>     - shard-dg2:          [SKIP][311] ([i915#4077]) -> [SKIP][312] ([i915#2575])
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-8/igt@gem_tiled_blits@basic.html
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-dg2:          [SKIP][313] ([i915#3297]) -> [SKIP][314] ([i915#2575])
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap-after-close.html
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gen3_mixed_blits:
>     - shard-dg2:          [SKIP][315] ([fdo#109289]) -> [SKIP][316] ([i915#2575])
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-1/igt@gen3_mixed_blits.html
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gen3_mixed_blits.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-dg2:          [SKIP][317] ([i915#2856]) -> [SKIP][318] ([i915#2575]) +1 similar issue
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@gen9_exec_parse@allowed-single.html
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
>     - shard-tglu:         [WARN][319] ([i915#2681]) -> [FAIL][320] ([i915#2681] / [i915#3591])
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
> 
>   * igt@i915_pm_rpm@i2c:
>     - shard-dg1:          [DMESG-WARN][321] ([i915#4391]) -> [DMESG-WARN][322] ([i915#4391] / [i915#4423])
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-19/igt@i915_pm_rpm@i2c.html
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-17/igt@i915_pm_rpm@i2c.html
> 
>   * igt@kms_async_flips@crc@pipe-a-edp-1:
>     - shard-mtlp:         [DMESG-FAIL][323] ([i915#1982] / [i915#8561]) -> [DMESG-FAIL][324] ([i915#8561])
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-4/igt@kms_async_flips@crc@pipe-a-edp-1.html
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-mtlp-8/igt@kms_async_flips@crc@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg1:          [SKIP][325] ([i915#4538] / [i915#5286]) -> [SKIP][326] ([i915#4423] / [i915#4538] / [i915#5286])
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-dg2:          [SKIP][327] ([fdo#111614]) -> [SKIP][328] ([fdo#109315]) +1 similar issue
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>     - shard-dg2:          [SKIP][329] ([i915#5190]) -> [SKIP][330] ([fdo#109315] / [i915#5190]) +2 similar issues
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc:
>     - shard-dg2:          [SKIP][331] ([i915#5354]) -> [SKIP][332] ([i915#2575]) +1 similar issue
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-3/igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc.html
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-dg2:          [SKIP][333] ([i915#3689] / [i915#3886] / [i915#5354]) -> [SKIP][334] ([i915#2575]) +2 similar issues
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-3/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs:
>     - shard-dg2:          [SKIP][335] ([i915#3689] / [i915#5354]) -> [SKIP][336] ([i915#2575]) +1 similar issue
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-1/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs.html
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2:          [SKIP][337] ([fdo#111827]) -> [SKIP][338] ([i915#2575])
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-1/igt@kms_chamelium_color@ctm-blue-to-red.html
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-dg2:          [SKIP][339] ([i915#7828]) -> [SKIP][340] ([i915#2575]) +1 similar issue
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-6/igt@kms_chamelium_frames@vga-frame-dump.html
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_content_protection@mei_interface:
>     - shard-dg1:          [SKIP][341] ([i915#7116]) -> [SKIP][342] ([fdo#109300])
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-17/igt@kms_content_protection@mei_interface.html
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-15/igt@kms_content_protection@mei_interface.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2:          [SKIP][343] ([i915#3359]) -> [SKIP][344] ([i915#2575])
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2:          [SKIP][345] ([i915#4103] / [i915#4213]) -> [SKIP][346] ([i915#2575])
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          [SKIP][347] ([i915#3955]) -> [SKIP][348] ([fdo#110189] / [i915#3955]) +1 similar issue
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-dg2:          [SKIP][349] ([fdo#109274]) -> [SKIP][350] ([i915#2575]) +3 similar issues
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
>     - shard-dg2:          [SKIP][351] ([i915#8708]) -> [SKIP][352] ([fdo#109315]) +3 similar issues
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][353] ([i915#3458]) -> [SKIP][354] ([fdo#109315]) +1 similar issue
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-dg2:          [SKIP][355] ([i915#5354]) -> [SKIP][356] ([fdo#109315]) +5 similar issues
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-dg2:          [SKIP][357] ([i915#6301]) -> [SKIP][358] ([i915#2575])
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-6/igt@kms_panel_fitting@legacy.html
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_psr@psr2_primary_render:
>     - shard-dg2:          [SKIP][359] ([i915#1072]) -> [SKIP][360] ([fdo#109315]) +2 similar issues
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-2/igt@kms_psr@psr2_primary_render.html
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_psr@psr2_primary_render.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - shard-dg1:          [SKIP][361] ([i915#1072]) -> [SKIP][362] ([i915#1072] / [i915#4078])
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-17/igt@kms_psr@sprite_plane_onoff.html
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg1-18/igt@kms_psr@sprite_plane_onoff.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2:          [SKIP][363] ([i915#3555]) -> [SKIP][364] ([i915#2575])
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-1/igt@kms_vrr@flip-dpms.html
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/shard-dg2-8/igt@kms_vrr@flip-dpms.html
> 
>   
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
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
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
>   [i915#5775]: https://gitlab.freedesktop.org/drm/intel/issues/5775
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
>   [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
>   [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#7977]: https://gitlab.freedesktop.org/drm/intel/issues/7977
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8320]: https://gitlab.freedesktop.org/drm/intel/issues/8320
>   [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8456]: https://gitlab.freedesktop.org/drm/intel/issues/8456
>   [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
>   [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
>   [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
>   [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8561]: https://gitlab.freedesktop.org/drm/intel/issues/8561
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8670]: https://gitlab.freedesktop.org/drm/intel/issues/8670
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
>   [i915#8823]: https://gitlab.freedesktop.org/drm/intel/issues/8823
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
>   [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865
>   [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7424 -> IGTPW_9548
> 
>   CI-20190529: 20190529
>   CI_DRM_13492: 525b387a224ced0a360fcbf92794392999de7208 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9548: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/index.html
>   IGT_7424: f12c2533941c9dfce43f455a02b7986605692b29 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9548/index.html
