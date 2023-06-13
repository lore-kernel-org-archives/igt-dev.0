Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC7910E0DF
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 16:39:04 +0000 (UTC)
Date: Tue, 13 Jun 2023 18:38:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230613163859.amw6euoyvbrkpq3g@kamilkon-desk1>
References: <20230612171908.29906-1-kamil.konieczny@linux.intel.com>
 <168662667535.21694.8655974543270924548@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168662667535.21694.8655974543270924548@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaWd0X2Nv?=
 =?utf-8?q?re=3A_Avoid_exit=5Fsubtest_in_subthread?=
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

regression below is not related to change in igt_core,
could you supress them and respin tests ?

Regards,
Kamil

On 2023-06-13 at 03:24:35 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: igt_core: Avoid exit_subtest in subthread
> URL   : https://patchwork.freedesktop.org/series/119214/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13263_full -> IGTPW_9151_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9151_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9151_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/index.html
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9151_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@fbdev@unaligned-write:
>     - shard-apl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-apl6/igt@fbdev@unaligned-write.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-apl3/igt@fbdev@unaligned-write.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9151_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_barrier_race@remote-request@rcs0:
>     - shard-glk:          [PASS][3] -> [ABORT][4] ([i915#7461] / [i915#8211])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-glk4/igt@gem_barrier_race@remote-request@rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-glk3/igt@gem_barrier_race@remote-request@rcs0.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@vcs0:
>     - shard-apl:          [PASS][5] -> [ABORT][6] ([i915#180])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-apl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-apl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842]) +3 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
>     - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#2842])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_schedule@wide@rcs0:
>     - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#6659])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-glk6/igt@gem_exec_schedule@wide@rcs0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-glk9/igt@gem_exec_schedule@wide@rcs0.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271]) +20 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [PASS][14] -> [INCOMPLETE][15] ([i915#7790])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-snb6/igt@i915_pm_rps@reset.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-snb6/igt@i915_pm_rps@reset.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#3886])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-apl4/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html
>     - shard-glk:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#3886])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-glk5/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-snb:          NOTRUN -> [SKIP][18] ([fdo#109271]) +12 similar issues
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-glk:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#4579]) +1 similar issue
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-glk6/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-b-vga-1:
>     - shard-snb:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4579]) +9 similar issues
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-snb5/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-b-vga-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-dp-1:
>     - shard-apl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4579]) +2 similar issues
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-apl6/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-dp-1.html
> 
>   * igt@kms_psr@psr2_sprite_plane_onoff:
>     - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271]) +73 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-apl2/igt@kms_psr@psr2_sprite_plane_onoff.html
> 
>   * igt@kms_setmode@basic@pipe-a-vga-1:
>     - shard-snb:          NOTRUN -> [FAIL][23] ([i915#5465]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-snb4/igt@kms_setmode@basic@pipe-a-vga-1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - {shard-rkl}:        [ABORT][24] ([i915#5507]) -> [PASS][25]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-rkl-1/igt@device_reset@unbind-reset-rebind.html
>     - shard-apl:          [ABORT][26] ([i915#5507]) -> [PASS][27]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-apl3/igt@device_reset@unbind-reset-rebind.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-apl2/igt@device_reset@unbind-reset-rebind.html
>     - {shard-tglu}:       [ABORT][28] ([i915#5507]) -> [PASS][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-tglu-8/igt@device_reset@unbind-reset-rebind.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-tglu-6/igt@device_reset@unbind-reset-rebind.html
>     - shard-glk:          [ABORT][30] ([i915#5507]) -> [PASS][31]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-glk4/igt@device_reset@unbind-reset-rebind.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-glk3/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          [FAIL][32] ([i915#2846]) -> [PASS][33]
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-glk1/igt@gem_exec_fair@basic-deadline.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-glk1/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][34] ([i915#2842]) -> [PASS][35]
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - {shard-rkl}:        [FAIL][36] ([i915#2842]) -> [PASS][37] +1 similar issue
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>     - shard-glk:          [FAIL][38] ([i915#2842]) -> [PASS][39]
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>     - {shard-dg1}:        [FAIL][40] ([i915#3591]) -> [PASS][41]
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - {shard-rkl}:        [SKIP][42] ([i915#1397]) -> [PASS][43]
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-rkl-2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - {shard-rkl}:        [FAIL][44] ([i915#3743]) -> [PASS][45]
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-rkl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [FAIL][46] ([i915#2346]) -> [PASS][47]
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - {shard-rkl}:        [INCOMPLETE][48] ([i915#8011]) -> [PASS][49]
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-rkl-7/igt@kms_cursor_legacy@forked-move@pipe-b.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-rkl-4/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [ABORT][50] ([i915#180]) -> [PASS][51] +1 similar issue
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13263/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
>   [i915#5507]: https://gitlab.freedesktop.org/drm/intel/issues/5507
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6659]: https://gitlab.freedesktop.org/drm/intel/issues/6659
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
>   [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7326 -> IGTPW_9151
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_13263: b6601e67405b0d81a1ddd8fb70a99b71ef2e1378 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9151: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/index.html
>   IGT_7326: 02c2cf17628b6203d6105d4a91dfe8a101d482ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9151/index.html
