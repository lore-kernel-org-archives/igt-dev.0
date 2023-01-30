Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3916110E0EA
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jan 2023 12:28:25 +0000 (UTC)
Date: Mon, 30 Jan 2023 13:28:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230130122820.tf44eeth2jvuirih@kamilkon-desk1>
References: <20230127111241.3624629-1-tvrtko.ursulin@linux.intel.com>
 <167483003299.18991.7450789372596347516@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <167483003299.18991.7450789372596347516@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogIGZhaWx1cmUgZm9yIEFzc29y?=
 =?utf-8?q?ted_intel=5Fgpu=5Ftop_improvements?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-01-27 at 14:33:52 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Assorted intel_gpu_top improvements
> URL   : https://patchwork.freedesktop.org/series/113427/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7138_full -> IGTPW_8410_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8410_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8410_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8410_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-glk7/igt@gen9_exec_parse@allowed-all.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-glk9/igt@gen9_exec_parse@allowed-all.html
> 

These is unrelated,

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@gem_ctx_freq@sysfs:
>     - {shard-dg1}:        [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-dg1-14/igt@gem_ctx_freq@sysfs.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-dg1-13/igt@gem_ctx_freq@sysfs.html
> 
>   * igt@kms_prime@d3hot:
>     - {shard-rkl}:        [SKIP][5] ([i915#6524]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-4/igt@kms_prime@d3hot.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-5/igt@kms_prime@d3hot.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8410_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_fair@basic-none@rcs0:
>     - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842]) +2 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-glk:          NOTRUN -> [SKIP][9] ([fdo#109271]) +22 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-glk8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>     - shard-glk:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#3886]) +1 similar issue
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-glk9/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2122])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_bad_reloc@negative-reloc-lut:
>     - {shard-rkl}:        [SKIP][13] ([i915#3281]) -> [PASS][14] +2 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hang@blt:
>     - {shard-rkl}:        [SKIP][15] ([i915#6252]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-4/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
> 
>   * igt@gem_exec_endless@dispatch@bcs0:
>     - {shard-rkl}:        [SKIP][17] ([i915#6247]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-4/igt@gem_exec_endless@dispatch@bcs0.html
> 
>   * igt@gem_exec_fence@syncobj-timeline-signal:
>     - {shard-rkl}:        [SKIP][19] ([fdo#109315]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-5/igt@gem_exec_fence@syncobj-timeline-signal.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-3/igt@gem_exec_fence@syncobj-timeline-signal.html
> 
>   * igt@gem_pwrite@basic-self:
>     - {shard-rkl}:        [SKIP][21] ([i915#3282]) -> [PASS][22] +1 similar issue
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-4/igt@gem_pwrite@basic-self.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-5/igt@gem_pwrite@basic-self.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - {shard-rkl}:        [SKIP][23] ([i915#2527]) -> [PASS][24] +2 similar issues
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
>     - {shard-dg1}:        [SKIP][25] ([i915#1397]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-dg1-13/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-dg1-14/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
>     - {shard-tglu}:       [SKIP][27] ([i915#1397]) -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-tglu-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-tglu-4/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
>     - {shard-rkl}:        [SKIP][29] ([i915#1845] / [i915#4098]) -> [PASS][30] +5 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
>     - shard-glk:          [FAIL][31] ([i915#2346]) -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
>     - {shard-tglu}:       [SKIP][33] ([i915#1849]) -> [PASS][34] +1 similar issue
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - {shard-rkl}:        [SKIP][35] ([i915#1849] / [i915#4098]) -> [PASS][36] +3 similar issues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_psr@cursor_mmap_gtt:
>     - {shard-rkl}:        [SKIP][37] ([i915#1072]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-1/igt@kms_psr@cursor_mmap_gtt.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-6/igt@kms_psr@cursor_mmap_gtt.html
> 
>   * igt@kms_vblank@pipe-b-wait-forked-busy:
>     - {shard-tglu}:       [SKIP][39] ([i915#7651]) -> [PASS][40] +2 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-tglu-6/igt@kms_vblank@pipe-b-wait-forked-busy.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-tglu-1/igt@kms_vblank@pipe-b-wait-forked-busy.html
> 
>   * igt@perf@stress-open-close:
>     - shard-glk:          [ABORT][41] ([i915#5213]) -> [PASS][42]
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-glk3/igt@perf@stress-open-close.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-glk3/igt@perf@stress-open-close.html
> 
>   * igt@perf_pmu@idle@rcs0:
>     - {shard-rkl}:        [FAIL][43] ([i915#4349]) -> [PASS][44] +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-1/igt@perf_pmu@idle@rcs0.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-3/igt@perf_pmu@idle@rcs0.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - {shard-rkl}:        [SKIP][45] ([fdo#109295] / [fdo#111656] / [i915#3708]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-1/igt@prime_vgem@coherency-gtt.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-5/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@syncobj_timeline@single-wait-all-for-submit-available-signaled:
>     - {shard-rkl}:        [SKIP][47] ([i915#2575]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7138/shard-rkl-5/igt@syncobj_timeline@single-wait-all-for-submit-available-signaled.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/shard-rkl-2/igt@syncobj_timeline@single-wait-all-for-submit-available-signaled.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
>   [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
>   [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
>   [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
>   [i915#5775]: https://gitlab.freedesktop.org/drm/intel/issues/5775
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
>   [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
>   [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
>   [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
>   [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
>   [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
>   [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
>   [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
>   [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
>   [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
>   [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7138 -> IGTPW_8410
> 
>   CI-20190529: 20190529
>   CI_DRM_12654: a2c772f5e02e24678456b5e66384de742110e1a2 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8410: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/index.html
>   IGT_7138: deb0f27cf03856eb699cd3d7c94b8be86a974fb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8410/index.html
