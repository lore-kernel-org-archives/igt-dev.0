Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB9810E76F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 21:17:15 +0000 (UTC)
Date: Thu, 25 May 2023 23:17:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230525211709.l4ylj7wuylvjjw3f@kamilkon-desk1>
References: <20230524150403.31460-1-kamil.konieczny@linux.intel.com>
 <168499212583.5914.13928450474351532324@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168499212583.5914.13928450474351532324@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fcore=3A_add_helper_for_srandom_seed_initialization?=
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

On 2023-05-25 at 05:22:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: add helper for srandom seed initialization
> URL   : https://patchwork.freedesktop.org/series/118307/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13185_full -> IGTPW_9031_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9031_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9031_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/index.html
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9031_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-snb:          [PASS][1] -> [ABORT][2]

This is unrelated to change in lib (as the function is not used now).

Regards,
Kamil

>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9031_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#2842])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2842])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#644])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
>     - shard-apl:          NOTRUN -> [SKIP][9] ([fdo#109271]) +8 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-apl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-apl:          NOTRUN -> [SKIP][10] ([IGT#6] / [fdo#109271]) +6 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-apl4/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271]) +21 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1:
>     - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#4579]) +14 similar issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-snb1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4579])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-apl4/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - {shard-rkl}:        [FAIL][14] ([i915#7742]) -> [PASS][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - {shard-rkl}:        [FAIL][16] ([i915#2842]) -> [PASS][17]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-rkl-1/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-rkl-2/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_ppgtt@blt-vs-render-ctxn:
>     - shard-snb:          [FAIL][18] ([i915#4998] / [i915#8295]) -> [PASS][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-snb6/igt@gem_ppgtt@blt-vs-render-ctxn.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-snb5/igt@gem_ppgtt@blt-vs-render-ctxn.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-apl:          [ABORT][20] ([i915#5566]) -> [PASS][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-apl6/igt@gen9_exec_parse@allowed-all.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-apl4/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - {shard-tglu}:       [SKIP][22] ([i915#4281]) -> [PASS][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-tglu-7/igt@i915_pm_dc@dc9-dpms.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-tglu-9/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>     - {shard-dg1}:        [FAIL][24] ([i915#3591]) -> [PASS][25]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp:
>     - {shard-rkl}:        [SKIP][26] ([i915#1397]) -> [PASS][27]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-rkl-4/igt@i915_pm_rpm@modeset-lpsp.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-apl:          [FAIL][28] ([IGT#6] / [i915#2346]) -> [PASS][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [FAIL][30] ([IGT#6] / [i915#4767]) -> [PASS][31]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@plain-flip-ts-check@b-hdmi-a1:
>     - shard-glk:          [FAIL][32] ([i915#2122]) -> [PASS][33]
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-glk5/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-glk3/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - {shard-dg1}:        [FAIL][34] ([IGT#2] / [IGT#6] / [i915#6493]) -> [PASS][35]
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-dg1-17/igt@kms_sysfs_edid_timing.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-dg1-17/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_vblank@pipe-c-ts-continuation-suspend:
>     - {shard-tglu}:       [ABORT][36] ([i915#5122] / [i915#8213]) -> [PASS][37]
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-tglu-7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-tglu-8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
> 
>   * igt@perf_pmu@all-busy-idle-check-all:
>     - {shard-dg1}:        [FAIL][38] ([i915#5234]) -> [PASS][39]
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-dg1-17/igt@perf_pmu@all-busy-idle-check-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@mei_interface:
>     - shard-apl:          [SKIP][40] ([IGT#6] / [fdo#109271] / [i915#4579]) -> [SKIP][41] ([IGT#6] / [fdo#109271])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-apl7/igt@kms_content_protection@mei_interface.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-apl2/igt@kms_content_protection@mei_interface.html
>     - shard-snb:          [SKIP][42] ([fdo#109271] / [i915#4579]) -> [SKIP][43] ([fdo#109271])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-snb2/igt@kms_content_protection@mei_interface.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-snb2/igt@kms_content_protection@mei_interface.html
>     - shard-glk:          [SKIP][44] ([IGT#6] / [fdo#109271] / [i915#4579]) -> [SKIP][45] ([IGT#6] / [fdo#109271])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13185/shard-glk1/igt@kms_content_protection@mei_interface.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/shard-glk3/igt@kms_content_protection@mei_interface.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4998]: https://gitlab.freedesktop.org/drm/intel/issues/4998
>   [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
>   [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
>   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8234]: https://gitlab.freedesktop.org/drm/intel/issues/8234
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8295]: https://gitlab.freedesktop.org/drm/intel/issues/8295
>   [i915#8304]: https://gitlab.freedesktop.org/drm/intel/issues/8304
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7302 -> IGTPW_9031
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_13185: e9b0234536d53adca81a81bc1f58611a0f5209d1 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9031: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/index.html
>   IGT_7302: de4b71f2c13f6fdcae15a4c3fac7fbe5f5737685 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9031/index.html
