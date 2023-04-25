Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E077210E254
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 08:31:19 +0000 (UTC)
Date: Tue, 25 Apr 2023 10:31:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230425083114.64hcan5pupadcfdh@kamilkon-desk1>
References: <20230227142748.28811-1-kamil.konieczny@linux.intel.com>
 <168209155839.5828.9453379766556531315@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168209155839.5828.9453379766556531315@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_check_disk_limit_at_dumping_kmsg_=28rev5=29?=
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

below change is not related to igt_runner,
could you supress them and respin tests ?

Regards,
Kamil
 
On 2023-04-21 at 15:39:18 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: check disk limit at dumping kmsg (rev5)
> URL   : https://patchwork.freedesktop.org/series/114353/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13038_full -> IGTPW_8837_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8837_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8837_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/index.html
> 
> Participating hosts (8 -> 7)
> ------------------------------
> 
>   Missing    (1): shard-rkl0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8837_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload-no-display:
>     - shard-snb:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-snb7/igt@i915_module_load@reload-no-display.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-snb1/igt@i915_module_load@reload-no-display.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@lic@pipe-a-dp-1:
>     - shard-apl:          [TIMEOUT][3] ([i915#7173]) -> [TIMEOUT][4] +3 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-apl7/igt@kms_content_protection@lic@pipe-a-dp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-apl2/igt@kms_content_protection@lic@pipe-a-dp-1.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - {shard-dg1}:        NOTRUN -> [ABORT][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-dg1-14/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - {shard-rkl}:        [PASS][6] -> [ABORT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-rkl-7/igt@kms_rotation_crc@multiplane-rotation.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-rkl-1/igt@kms_rotation_crc@multiplane-rotation.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8837_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#2842])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][10] ([fdo#109271]) +49 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-glk4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-glk:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#3323])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-apl:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#658]) +1 similar issue
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-apl2/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
>     - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#3886]) +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-apl3/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2346])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271]) +34 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-apl4/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-snb:          NOTRUN -> [SKIP][17] ([fdo#109271]) +34 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-glk:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#658])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-glk9/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - {shard-rkl}:        [FAIL][19] ([i915#7742]) -> [PASS][20] +1 similar issue
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@gem_eio@hibernate:
>     - {shard-dg1}:        [ABORT][21] ([i915#7975]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-dg1-14/igt@gem_eio@hibernate.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-dg1-17/igt@gem_eio@hibernate.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - {shard-dg1}:        [FAIL][23] ([i915#5784]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-dg1-15/igt@gem_eio@unwedge-stress.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-dg1-16/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][25] ([i915#2842]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [ABORT][27] ([i915#5566]) -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-glk3/igt@gen9_exec_parse@allowed-single.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-glk5/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - {shard-tglu}:       [SKIP][29] ([i915#4281]) -> [PASS][30]
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-tglu-8/igt@i915_pm_dc@dc9-dpms.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-tglu-2/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>     - {shard-dg1}:        [FAIL][31] ([i915#3591]) -> [PASS][32] +1 similar issue
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress:
>     - {shard-rkl}:        [SKIP][33] ([i915#1397]) -> [PASS][34] +1 similar issue
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
>     - {shard-dg1}:        [SKIP][35] ([i915#1397]) -> [PASS][36]
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-dg1-15/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@i915_selftest@live@late_gt_pm:
>     - shard-glk:          [ABORT][37] ([i915#6217]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-glk1/igt@i915_selftest@live@late_gt_pm.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-glk8/igt@i915_selftest@live@late_gt_pm.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
>     - shard-apl:          [ABORT][39] ([i915#180]) -> [PASS][40]
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-apl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-glk:          [FAIL][41] ([i915#72]) -> [PASS][42]
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [FAIL][43] ([i915#2346]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
>     - shard-glk:          [FAIL][45] ([i915#79]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
> 
>   * igt@perf_pmu@idle@rcs0:
>     - {shard-rkl}:        [FAIL][47] ([i915#4349]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-rkl-4/igt@perf_pmu@idle@rcs0.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-rkl-6/igt@perf_pmu@idle@rcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-apl:          [FAIL][49] ([i915#4275]) -> [SKIP][50] ([fdo#109271])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13038/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
>   [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4275]: https://gitlab.freedesktop.org/drm/intel/issues/4275
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6217]: https://gitlab.freedesktop.org/drm/intel/issues/6217
>   [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7263 -> IGTPW_8837
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_13038: 6461cb037c9e5c9872a3b1843a6b0aa2f9a0016d @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8837: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/index.html
>   IGT_7263: a6bd8f415c4ec41b5a014c7db47e46c81ffd0074 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8837/index.html
