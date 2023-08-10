Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F0A10E5E8
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 19:19:01 +0000 (UTC)
Date: Thu, 10 Aug 2023 21:18:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230810191855.3pbzk4cev2qspw66@kamilkon-desk1>
References: <20230808210437.977482-1-adrian.larumbe@collabora.com>
 <169157974504.10294.17739358630912061996@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169157974504.10294.17739358630912061996@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_gputop=3A_fix_region_array_max_iterati?=
 =?utf-8?q?on_index_loop_bug?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below issues are unrelated to changes in tools,

Regards,
Kamil

On 2023-08-09 at 11:15:45 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] gputop: fix region array max iteration index loop bug
> URL   : https://patchwork.freedesktop.org/series/122180/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7424_full -> IGTPW_9546_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9546_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9546_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/index.html
> 
> Participating hosts (9 -> 10)
> ------------------------------
> 
>   Additional (1): shard-rkl0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9546_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_create@hog-create@smem0:
>     - shard-mtlp:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-5/igt@gem_create@hog-create@smem0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-4/igt@gem_create@hog-create@smem0.html
> 
>   * igt@kms_hdr@static-swap@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@kms_hdr@static-swap@pipe-a-dp-4.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9546_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@drm_fdinfo@busy-idle-check-all@vcs1:
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8414]) +4 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-19/igt@drm_fdinfo@busy-idle-check-all@vcs1.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#5325])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ctx_persistence@engines-hang@vcs1:
>     - shard-mtlp:         [PASS][6] -> [ABORT][7] ([i915#8865])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-4/igt@gem_ctx_persistence@engines-hang@vcs1.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-4/igt@gem_ctx_persistence@engines-hang@vcs1.html
> 
>   * igt@gem_ctx_persistence@engines-hostile@vcs0:
>     - shard-mtlp:         [PASS][8] -> [FAIL][9] ([i915#2410]) +3 similar issues
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-5/igt@gem_ctx_persistence@engines-hostile@vcs0.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-6/igt@gem_ctx_persistence@engines-hostile@vcs0.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#8555])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-8/igt@gem_ctx_persistence@hang.html
>     - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8555])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-2/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_persistence@idempotent:
>     - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1099])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-snb5/igt@gem_ctx_persistence@idempotent.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][13] ([i915#8841]) +3 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-snb1/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_balancer@bonded-false-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#4812])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-2/igt@gem_exec_balancer@bonded-false-hang.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#4812])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-10/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@sliced:
>     - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#4812])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-19/igt@gem_exec_balancer@sliced.html
> 
>   * igt@gem_exec_capture@pi@vcs0:
>     - shard-mtlp:         [PASS][17] -> [FAIL][18] ([i915#4475])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-8/igt@gem_exec_capture@pi@vcs0.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-8/igt@gem_exec_capture@pi@vcs0.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-rkl:          [PASS][19] -> [FAIL][20] ([i915#2846])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][21] ([i915#2842])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#2842])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_flush@basic-uc-ro-default:
>     - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#3539] / [i915#4852])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-8/igt@gem_exec_flush@basic-uc-ro-default.html
> 
>   * igt@gem_exec_params@secure-non-master:
>     - shard-mtlp:         NOTRUN -> [SKIP][25] ([fdo#112283])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-5/igt@gem_exec_params@secure-non-master.html
> 
>   * igt@gem_exec_reloc@basic-range:
>     - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#3281]) +2 similar issues
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-8/igt@gem_exec_reloc@basic-range.html
> 
>   * igt@gem_exec_reloc@basic-scanout@rcs0:
>     - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-apl2/igt@gem_exec_reloc@basic-scanout@rcs0.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-apl6/igt@gem_exec_reloc@basic-scanout@rcs0.html
> 
>   * igt@gem_exec_reloc@basic-wc-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#3281]) +4 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-13/igt@gem_exec_reloc@basic-wc-cpu.html
> 
>   * igt@gem_exec_reloc@basic-wc-noreloc:
>     - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#3281])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-1/igt@gem_exec_reloc@basic-wc-noreloc.html
>     - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#3281])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@gem_exec_reloc@basic-wc-noreloc.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-glk6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][33] ([i915#5493])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#4613])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-7/igt@gem_lmem_swapping@verify-random.html
>     - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#4613])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-6/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap_gtt@basic-write-read-distinct:
>     - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4077])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-5/igt@gem_mmap_gtt@basic-write-read-distinct.html
> 
>   * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
>     - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4083]) +1 similar issue
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-10/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
>     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4083])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-2/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
> 
>   * igt@gem_partial_pwrite_pread@reads:
>     - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3282]) +1 similar issue
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-1/igt@gem_partial_pwrite_pread@reads.html
>     - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#3282])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@gem_partial_pwrite_pread@reads.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
>     - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3282])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
>     - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#3282]) +1 similar issue
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-3/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4270]) +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
>     - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#4270])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
>     - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#4270])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4270]) +1 similar issue
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-16/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4270])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#5190]) +3 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#8428])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-1/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_userptr_blits@nohangcheck:
>     - shard-mtlp:         [PASS][50] -> [FAIL][51] ([i915#6268])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-4/igt@gem_userptr_blits@nohangcheck.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-6/igt@gem_userptr_blits@nohangcheck.html
> 
>   * igt@gen7_exec_parse@oacontrol-tracking:
>     - shard-mtlp:         NOTRUN -> [SKIP][52] ([fdo#109289]) +1 similar issue
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-1/igt@gen7_exec_parse@oacontrol-tracking.html
> 
>   * igt@gen9_exec_parse@batch-invalid-length:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#2856]) +1 similar issue
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@gen9_exec_parse@batch-invalid-length.html
>     - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#2527]) +1 similar issue
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@gen9_exec_parse@batch-invalid-length.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#2527])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-14/igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@i915_hangman@engine-engine-hang@vcs0:
>     - shard-mtlp:         [PASS][56] -> [FAIL][57] ([i915#7069])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-2/igt@i915_hangman@engine-engine-hang@vcs0.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-8/igt@i915_hangman@engine-engine-hang@vcs0.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-tglu:         [PASS][58] -> [SKIP][59] ([i915#4281])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-2/igt@i915_pm_dc@dc9-dpms.html
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-6/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api@gt0:
>     - shard-mtlp:         [PASS][60] -> [FAIL][61] ([i915#8670])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-6/igt@i915_pm_freq_api@freq-basic-api@gt0.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-2/igt@i915_pm_freq_api@freq-basic-api@gt0.html
> 
>   * igt@i915_pm_lpsp@screens-disabled:
>     - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#1902])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@i915_pm_lpsp@screens-disabled.html
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-dg2:          NOTRUN -> [SKIP][63] ([fdo#109289])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#1397])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-17/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
>     - shard-dg1:          [PASS][65] -> [FAIL][66] ([i915#7940]) +1 similar issue
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-rkl:          [PASS][67] -> [SKIP][68] ([i915#1397]) +1 similar issue
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp:
>     - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#1397])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-6/igt@i915_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@pc8-residency:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([fdo#109506])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@i915_pm_rpm@pc8-residency.html
>     - shard-rkl:          NOTRUN -> [SKIP][71] ([fdo#109506])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@i915_pm_rpm@pc8-residency.html
> 
>   * igt@i915_pm_rps@min-max-config-loaded:
>     - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#6621])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-19/igt@i915_pm_rps@min-max-config-loaded.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-dg1:          [PASS][73] -> [FAIL][74] ([i915#8229])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-19/igt@i915_pm_rps@reset.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-16/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_pm_rps@thresholds-idle-park@gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#8925])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-8/igt@i915_pm_rps@thresholds-idle-park@gt0.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - shard-apl:          [PASS][76] -> [DMESG-FAIL][77] ([i915#5334])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-apl3/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-dg2:          [PASS][78] -> [FAIL][79] ([fdo#103375]) +2 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-1/igt@i915_suspend@basic-s3-without-i915.html
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-5/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4077])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-14/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
>     - shard-mtlp:         [PASS][81] -> [FAIL][82] ([i915#2521])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc:
>     - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#8709]) +11 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc.html
> 
>   * igt@kms_async_flips@crc@pipe-b-vga-1:
>     - shard-snb:          NOTRUN -> [FAIL][84] ([i915#8247]) +1 similar issue
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-snb2/igt@kms_async_flips@crc@pipe-b-vga-1.html
> 
>   * igt@kms_async_flips@crc@pipe-d-dp-4:
>     - shard-dg2:          NOTRUN -> [FAIL][85] ([i915#8247]) +3 similar issues
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@kms_async_flips@crc@pipe-d-dp-4.html
> 
>   * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][86] ([i915#8247]) +3 similar issues
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-18/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#1769] / [i915#3555])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>     - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#1769] / [i915#3555])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>     - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#1769] / [i915#3555])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4538] / [i915#5286]) +2 similar issues
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][91] ([fdo#111614])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-5/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3638])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-17/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][93] ([fdo#111614] / [i915#3638])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][94] ([fdo#111615]) +1 similar issue
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4538] / [i915#5190])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4538]) +2 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
>     - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#5354] / [i915#6095]) +1 similar issue
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-9/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#3886] / [i915#6095])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +3 similar issues
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-16/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc:
>     - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#5354]) +19 similar issues
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc.html
>     - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#5354] / [i915#6095]) +4 similar issues
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>     - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3689] / [i915#3886] / [i915#5354]) +3 similar issues
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#3886]) +3 similar issues
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-glk8/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3689] / [i915#5354] / [i915#6095]) +5 similar issues
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-19/igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3689] / [i915#5354]) +4 similar issues
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-8/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:
>     - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#5354] / [i915#6095]) +6 similar issues
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-16/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#6095]) +8 similar issues
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-2/igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#5354]) +4 similar issues
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4087]) +3 similar issues
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-8/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2:          NOTRUN -> [SKIP][110] ([fdo#111827])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-dg1:          NOTRUN -> [SKIP][111] ([fdo#111827])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-18/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#7828]) +2 similar issues
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-18/igt@kms_chamelium_frames@dp-crc-fast.html
>     - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#7828]) +1 similar issue
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-7/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#7828])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>     - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#7828])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>     - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#7828])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_color@deep-color:
>     - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#3555])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-7/igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][118] ([i915#7173])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#7118]) +1 similar issue
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-1/igt@kms_content_protection@uevent.html
>     - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#7118])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#3555]) +3 similar issues
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#3555])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-16/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-a-edp-1:
>     - shard-mtlp:         [PASS][123] -> [DMESG-WARN][124] ([i915#2017])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-a-edp-1.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-a-edp-1.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3359])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4103] / [i915#4213]) +1 similar issue
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4103] / [i915#4213])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#4103]) +1 similar issue
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>     - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#4103]) +1 similar issue
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][130] ([fdo#109274] / [i915#5354]) +2 similar issues
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>     - shard-rkl:          NOTRUN -> [SKIP][131] ([fdo#111825])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#3546]) +1 similar issue
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-mtlp:         [PASS][133] -> [FAIL][134] ([i915#2346])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-apl:          [PASS][135] -> [FAIL][136] ([i915#2346]) +1 similar issue
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#4213])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#8588])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-4/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#8588])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-2/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([fdo#109274])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-1/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-tglu:         NOTRUN -> [SKIP][141] ([fdo#109274] / [i915#3637])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-3/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#3637]) +1 similar issue
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#2587] / [i915#2672]) +1 similar issue
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#2672])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
>     - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#2672])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#2587] / [i915#2672])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#8708]) +7 similar issues
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
>     - shard-dg1:          NOTRUN -> [SKIP][148] ([fdo#111825]) +10 similar issues
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#8708])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#1825]) +6 similar issues
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#8708])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
>     - shard-rkl:          NOTRUN -> [SKIP][152] ([fdo#111825] / [i915#1825]) +7 similar issues
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#3458]) +7 similar issues
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#3458]) +5 similar issues
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3023]) +3 similar issues
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-tglu:         NOTRUN -> [SKIP][156] ([fdo#109280]) +2 similar issues
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#3555] / [i915#8228])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html
>     - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3555] / [i915#8228])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html
>     - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#3555] / [i915#8228])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-7/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#8806])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#5176]) +7 similar issues
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#5176]) +23 similar issues
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#5176]) +5 similar issues
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#5235]) +3 similar issues
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#5235]) +11 similar issues
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#5235]) +19 similar issues
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#5235]) +3 similar issues
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [SKIP][168] ([fdo#109271]) +110 similar issues
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-glk5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#6524] / [i915#6805])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html
>     - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#6524])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html
>     - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#6524])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-4/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-glk:          NOTRUN -> [SKIP][172] ([fdo#109271] / [i915#658]) +1 similar issue
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-glk8/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area:
>     - shard-dg1:          NOTRUN -> [SKIP][173] ([fdo#111068] / [i915#658])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-17/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@no_drrs:
>     - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#1072]) +2 similar issues
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@kms_psr@no_drrs.html
> 
>   * igt@kms_psr@primary_render:
>     - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#1072])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-4/igt@kms_psr@primary_render.html
>     - shard-tglu:         NOTRUN -> [SKIP][176] ([fdo#110189]) +3 similar issues
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-7/igt@kms_psr@primary_render.html
> 
>   * igt@kms_psr@psr2_sprite_mmap_cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#1072]) +2 similar issues
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-17/igt@kms_psr@psr2_sprite_mmap_cpu.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#5461] / [i915#658])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>     - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#5461] / [i915#658])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#5461] / [i915#658])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#4235]) +1 similar issue
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_selftest@drm_format:
>     - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#8661])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-8/igt@kms_selftest@drm_format.html
>     - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#8661])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-2/igt@kms_selftest@drm_format.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#3555] / [i915#4098])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-1/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#8823])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_vblank@pipe-b-wait-busy-hang:
>     - shard-apl:          [PASS][186] -> [SKIP][187] ([fdo#109271])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-apl3/igt@kms_vblank@pipe-b-wait-busy-hang.html
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-apl2/igt@kms_vblank@pipe-b-wait-busy-hang.html
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#4070] / [i915#533] / [i915#6768])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-6/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#2437])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-5/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-glk:          NOTRUN -> [SKIP][190] ([fdo#109271] / [i915#2437])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-glk1/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#2434])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-5/igt@perf@mi-rpc.html
>     - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#2434])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-5/igt@perf@mi-rpc.html
> 
>   * igt@perf_pmu@all-busy-idle-check-all:
>     - shard-dg2:          [PASS][193] -> [FAIL][194] ([i915#5234])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-3/igt@perf_pmu@all-busy-idle-check-all.html
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@perf_pmu@all-busy-idle-check-all.html
>     - shard-dg1:          [PASS][195] -> [FAIL][196] ([i915#5234])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-19/igt@perf_pmu@all-busy-idle-check-all.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-14/igt@perf_pmu@all-busy-idle-check-all.html
>     - shard-mtlp:         [PASS][197] -> [FAIL][198] ([i915#5234])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-3/igt@perf_pmu@all-busy-idle-check-all.html
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-3/igt@perf_pmu@all-busy-idle-check-all.html
> 
>   * igt@perf_pmu@semaphore-busy@vcs1:
>     - shard-dg1:          [PASS][199] -> [FAIL][200] ([i915#4349]) +2 similar issues
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-19/igt@perf_pmu@semaphore-busy@vcs1.html
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#3708])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-15/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#3708] / [i915#4077])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-3/igt@prime_vgem@coherency-gtt.html
>     - shard-rkl:          NOTRUN -> [SKIP][203] ([fdo#109295] / [fdo#111656] / [i915#3708])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-7/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@sysfs_timeslice_duration@idempotent@vcs0:
>     - shard-snb:          NOTRUN -> [SKIP][204] ([fdo#109271]) +177 similar issues
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-snb5/igt@sysfs_timeslice_duration@idempotent@vcs0.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#4818])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html
>     - shard-rkl:          NOTRUN -> [SKIP][206] ([fdo#109307])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html
>     - shard-tglu:         NOTRUN -> [SKIP][207] ([fdo#109307])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-2/igt@tools_test@sysfs_l3_parity.html
> 
>   * igt@v3d/v3d_perfmon@create-perfmon-invalid-counters:
>     - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#2575]) +4 similar issues
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@v3d/v3d_perfmon@create-perfmon-invalid-counters.html
> 
>   * igt@v3d/v3d_perfmon@get-values-valid-perfmon:
>     - shard-rkl:          NOTRUN -> [SKIP][209] ([fdo#109315]) +3 similar issues
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-4/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html
>     - shard-tglu:         NOTRUN -> [SKIP][210] ([fdo#109315] / [i915#2575]) +1 similar issue
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-7/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html
> 
>   * igt@v3d/v3d_wait_bo@used-bo:
>     - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#2575]) +3 similar issues
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-3/igt@v3d/v3d_wait_bo@used-bo.html
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#2575])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-14/igt@v3d/v3d_wait_bo@used-bo.html
> 
>   * igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:
>     - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#7711]) +1 similar issue
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-7/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice:
>     - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#7711]) +2 similar issues
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-13/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice.html
> 
>   * igt@vc4/vc4_tiling@set-bad-flags:
>     - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#7711])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-1/igt@vc4/vc4_tiling@set-bad-flags.html
>     - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#7711])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-7/igt@vc4/vc4_tiling@set-bad-flags.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-check-all@rcs0:
>     - shard-rkl:          [FAIL][217] ([i915#7742]) -> [PASS][218]
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html
> 
>   * igt@fbdev@unaligned-write:
>     - shard-mtlp:         [DMESG-WARN][219] ([i915#2017]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-5/igt@fbdev@unaligned-write.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-8/igt@fbdev@unaligned-write.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-mtlp:         [FAIL][221] ([i915#6121]) -> [PASS][222]
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-6/igt@gem_ctx_exec@basic-nohangcheck.html
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-7/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
>     - shard-mtlp:         [FAIL][223] ([i915#2410]) -> [PASS][224] +2 similar issues
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-1/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-4/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - shard-mtlp:         [ABORT][225] ([i915#7941]) -> [PASS][226]
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-3/igt@gem_eio@in-flight-contexts-10ms.html
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-5/igt@gem_eio@in-flight-contexts-10ms.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-rkl:          [FAIL][227] ([i915#2842]) -> [PASS][228]
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-7/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][229] ([i915#2842]) -> [PASS][230]
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglu:         [FAIL][231] ([i915#2842]) -> [PASS][232]
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vcs0:
>     - shard-glk:          [FAIL][233] ([i915#2842]) -> [PASS][234] +1 similar issue
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-glk1/igt@gem_exec_fair@basic-pace@vcs0.html
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-glk8/igt@gem_exec_fair@basic-pace@vcs0.html
> 
>   * igt@i915_hangman@detector@vcs0:
>     - shard-mtlp:         [FAIL][235] ([i915#8456]) -> [PASS][236] +2 similar issues
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-4/igt@i915_hangman@detector@vcs0.html
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html
> 
>   * igt@i915_hangman@gt-engine-hang@vcs0:
>     - shard-mtlp:         [FAIL][237] ([i915#7069]) -> [PASS][238]
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-8/igt@i915_hangman@gt-engine-hang@vcs0.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-7/igt@i915_hangman@gt-engine-hang@vcs0.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          [DMESG-WARN][239] ([i915#7061] / [i915#8617]) -> [PASS][240]
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-5/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-untiled:
>     - shard-mtlp:         [FAIL][241] ([i915#8691]) -> [PASS][242]
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-3/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-tglu:         [FAIL][243] ([i915#3989] / [i915#454]) -> [PASS][244]
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-3/igt@i915_pm_dc@dc6-dpms.html
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-9/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_rc6_residency@rc6-accuracy:
>     - shard-dg2:          [FAIL][245] -> [PASS][246] +1 similar issue
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@i915_pm_rc6_residency@rc6-accuracy.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>     - shard-dg1:          [FAIL][247] ([i915#3591]) -> [PASS][248]
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
> 
>   * igt@i915_pm_rpm@dpms-non-lpsp:
>     - shard-rkl:          [SKIP][249] ([i915#1397]) -> [PASS][250]
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-1/igt@i915_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress@smem0:
>     - shard-dg1:          [FAIL][251] ([i915#7940]) -> [PASS][252] +1 similar issue
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress:
>     - shard-tglu:         [FAIL][253] ([i915#7940]) -> [PASS][254]
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-6/igt@i915_pm_rpm@modeset-lpsp-stress.html
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-4/igt@i915_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2:          [SKIP][255] ([i915#1397]) -> [PASS][256] +2 similar issues
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-dg1:          [SKIP][257] ([i915#1397]) -> [PASS][258]
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-13/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-tglu:         [INCOMPLETE][259] ([i915#8320]) -> [PASS][260]
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-9/igt@i915_pm_rps@reset.html
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-2/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-rkl:          [FAIL][261] ([fdo#103375]) -> [PASS][262]
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-mtlp:         [FAIL][263] ([i915#3743]) -> [PASS][264] +1 similar issue
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [FAIL][265] ([i915#5138]) -> [PASS][266]
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [FAIL][267] ([i915#2346]) -> [PASS][268]
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-mtlp:         [FAIL][269] ([i915#2346]) -> [PASS][270]
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
>     - shard-dg2:          [FAIL][271] ([fdo#103375]) -> [PASS][272] +4 similar issues
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
>     - shard-dg2:          [FAIL][273] ([i915#6880]) -> [PASS][274] +1 similar issue
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglu:         [SKIP][275] ([i915#433]) -> [PASS][276]
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-7/igt@kms_hdmi_inject@inject-audio.html
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
>     - shard-mtlp:         [FAIL][277] ([i915#1623]) -> [PASS][278] +1 similar issue
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-apl:          [FAIL][279] ([IGT#2]) -> [PASS][280]
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-apl4/igt@kms_sysfs_edid_timing.html
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-apl2/igt@kms_sysfs_edid_timing.html
> 
>   * igt@perf@enable-disable@0-rcs0:
>     - shard-dg2:          [FAIL][281] ([i915#8724]) -> [PASS][282]
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-6/igt@perf@enable-disable@0-rcs0.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [FAIL][283] ([i915#4349]) -> [PASS][284] +3 similar issues
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-1/igt@perf_pmu@busy-double-start@vecs1.html
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all@rcs0:
>     - shard-dg2:          [FAIL][285] ([i915#5234]) -> [PASS][286]
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-10/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>     - shard-mtlp:         [FAIL][287] ([i915#5234]) -> [PASS][288]
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_whisper@basic-contexts-forked-all:
>     - shard-mtlp:         [TIMEOUT][289] ([i915#7392] / [i915#8628]) -> [ABORT][290] ([i915#7392] / [i915#8131])
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-forked-all.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>     - shard-tglu:         [WARN][291] ([i915#2681]) -> [FAIL][292] ([i915#2681] / [i915#3591])
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> 
>   * igt@i915_pm_rpm@i2c:
>     - shard-dg1:          [DMESG-WARN][293] ([i915#4391]) -> [DMESG-WARN][294] ([i915#4391] / [i915#4423])
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-19/igt@i915_pm_rpm@i2c.html
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-14/igt@i915_pm_rpm@i2c.html
> 
>   * igt@kms_content_protection@content_type_change:
>     - shard-dg2:          [SKIP][295] ([i915#7118]) -> [SKIP][296] ([i915#7118] / [i915#7162])
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg2-6/igt@kms_content_protection@content_type_change.html
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg2-11/igt@kms_content_protection@content_type_change.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          [SKIP][297] ([i915#3955]) -> [SKIP][298] ([fdo#110189] / [i915#3955])
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_psr@cursor_plane_move:
>     - shard-dg1:          [SKIP][299] ([i915#1072] / [i915#4078]) -> [SKIP][300] ([i915#1072])
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7424/shard-dg1-18/igt@kms_psr@cursor_plane_move.html
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/shard-dg1-15/igt@kms_psr@cursor_plane_move.html
> 
>   
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
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
>   [i915#1623]: https://gitlab.freedesktop.org/drm/intel/issues/1623
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
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
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
>   [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
>   [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
>   [i915#8131]: https://gitlab.freedesktop.org/drm/intel/issues/8131
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8229]: https://gitlab.freedesktop.org/drm/intel/issues/8229
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8320]: https://gitlab.freedesktop.org/drm/intel/issues/8320
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8456]: https://gitlab.freedesktop.org/drm/intel/issues/8456
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8617]: https://gitlab.freedesktop.org/drm/intel/issues/8617
>   [i915#8628]: https://gitlab.freedesktop.org/drm/intel/issues/8628
>   [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
>   [i915#8670]: https://gitlab.freedesktop.org/drm/intel/issues/8670
>   [i915#8691]: https://gitlab.freedesktop.org/drm/intel/issues/8691
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8724]: https://gitlab.freedesktop.org/drm/intel/issues/8724
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
>   * IGT: IGT_7424 -> IGTPW_9546
> 
>   CI-20190529: 20190529
>   CI_DRM_13492: 525b387a224ced0a360fcbf92794392999de7208 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9546: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/index.html
>   IGT_7424: f12c2533941c9dfce43f455a02b7986605692b29 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9546/index.html
