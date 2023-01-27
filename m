Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405C610E453
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jan 2023 11:04:50 +0000 (UTC)
Date: Fri, 27 Jan 2023 13:01:46 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org,
 Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Message-ID: <Y9OvGk0pNYY36lFe@platvala-desk.ger.corp.intel.com>
References: <20230126105338.419418-1-petri.latvala@intel.com>
 <167475522213.540.7845881763002111987@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167475522213.540.7845881763002111987@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Using_=27abort=27_as_test_result_instead_of_a_separate_test?=
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

On Thu, Jan 26, 2023 at 05:47:02PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Using 'abort' as test result instead of a separate test
> URL   : https://patchwork.freedesktop.org/series/113380/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7137_full -> IGTPW_8405_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8405_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8405_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8405_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@perf@stress-open-close:
>     - shard-glk:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-glk1/igt@perf@stress-open-close.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-glk1/igt@perf@stress-open-close.html


These regressions are related to the change, but they are existing
issues in a different result. Although this one doesn't have a bug
filed, just the generic "aborted" bug report. Please file a new bug
about this.

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@gem_exec_suspend@basic-s4-devices@smem:
>     - {shard-rkl}:        [PASS][3] -> [ABORT][4] +1 similar issue
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices@smem.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-2/igt@gem_exec_suspend@basic-s4-devices@smem.html

This basic-s4-devices@smem abort should be mapped to
https://gitlab.freedesktop.org/drm/intel/-/issues/3810


-- 
Petri Latvala



> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8405_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_fair@basic-pace@vcs0:
>     - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2842]) +1 similar issue
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-glk7/igt@gem_exec_fair@basic-pace@vcs0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-check-all@rcs0:
>     - {shard-rkl}:        [FAIL][7] ([i915#7742]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-3/igt@drm_fdinfo@most-busy-check-all@rcs0.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html
> 
>   * igt@fbdev@info:
>     - {shard-rkl}:        [SKIP][9] ([i915#2582]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-5/igt@fbdev@info.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-6/igt@fbdev@info.html
> 
>   * igt@fbdev@unaligned-write:
>     - {shard-tglu}:       [SKIP][11] ([i915#2582]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-tglu-6/igt@fbdev@unaligned-write.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-tglu-5/igt@fbdev@unaligned-write.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hang@blt:
>     - {shard-rkl}:        [SKIP][13] ([i915#6252]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-3/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - {shard-rkl}:        [FAIL][15] ([fdo#103375]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-5/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - {shard-rkl}:        [FAIL][17] ([i915#2842]) -> [PASS][18] +1 similar issue
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_reloc@basic-write-read-noreloc:
>     - {shard-rkl}:        [SKIP][19] ([i915#3281]) -> [PASS][20] +14 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-noreloc.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - {shard-rkl}:        [SKIP][21] ([i915#7276]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_exec_whisper@basic-fds-priority-all:
>     - {shard-rkl}:        [INCOMPLETE][23] -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-4/igt@gem_exec_whisper@basic-fds-priority-all.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-3/igt@gem_exec_whisper@basic-fds-priority-all.html
> 
>   * igt@gem_mmap_gtt@coherency:
>     - {shard-rkl}:        [SKIP][25] ([fdo#111656]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-1/igt@gem_mmap_gtt@coherency.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-5/igt@gem_mmap_gtt@coherency.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - {shard-rkl}:        [SKIP][27] ([i915#3282]) -> [PASS][28] +6 similar issues
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - {shard-rkl}:        [SKIP][29] ([i915#2527]) -> [PASS][30] +4 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
>     - {shard-dg1}:        [SKIP][31] ([i915#1397]) -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-dg1-12/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-dg1-14/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - {shard-tglu}:       [SKIP][33] ([i915#7651]) -> [PASS][34] +3 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-tglu-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-tglu-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
>     - shard-glk:          [FAIL][35] ([i915#79]) -> [PASS][36]
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
>     - {shard-rkl}:        [SKIP][37] ([i915#1849] / [i915#4098]) -> [PASS][38] +2 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - {shard-rkl}:        [SKIP][39] ([i915#1072]) -> [PASS][40]
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-3/igt@kms_psr@primary_page_flip.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-6/igt@kms_psr@primary_page_flip.html
> 
>   * igt@kms_vblank@pipe-b-wait-idle-hang:
>     - {shard-rkl}:        [SKIP][41] ([i915#1845] / [i915#4098]) -> [PASS][42] +5 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-4/igt@kms_vblank@pipe-b-wait-idle-hang.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-6/igt@kms_vblank@pipe-b-wait-idle-hang.html
> 
>   * igt@kms_vblank@pipe-d-query-idle:
>     - {shard-tglu}:       [SKIP][43] ([i915#1845] / [i915#7651]) -> [PASS][44] +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-tglu-6/igt@kms_vblank@pipe-d-query-idle.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-tglu-2/igt@kms_vblank@pipe-d-query-idle.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - {shard-rkl}:        [SKIP][45] ([i915#2436]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-3/igt@perf@gen8-unprivileged-single-ctx-counters.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@perf@polling-small-buf:
>     - {shard-rkl}:        [FAIL][47] ([i915#1722]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-3/igt@perf@polling-small-buf.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-5/igt@perf@polling-small-buf.html
> 
>   * igt@prime_vgem@basic-write:
>     - {shard-rkl}:        [SKIP][49] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7137/shard-rkl-3/igt@prime_vgem@basic-write.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/shard-rkl-5/igt@prime_vgem@basic-write.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
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
>   [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
>   [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
>   [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
>   [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
>   [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
>   [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
>   [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
>   [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
>   [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
>   [i915#6463]: https://gitlab.freedesktop.org/drm/intel/issues/6463
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
>   [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
>   [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
>   [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
>   [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7137 -> IGTPW_8405
> 
>   CI-20190529: 20190529
>   CI_DRM_12640: cc7783f223ac644092bb8788f0750fc5c68aa00e @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8405: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/index.html
>   IGT_7137: 5f7ea985ac0828bec5e1bbc101b7931bd7fb62e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8405/index.html
