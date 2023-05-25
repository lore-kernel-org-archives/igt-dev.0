Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDC810E7B2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 08:33:58 +0000 (UTC)
Message-ID: <62bf49ec-ee4a-9742-576c-3b94eb681d97@linux.intel.com>
Date: Thu, 25 May 2023 09:33:49 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, fei.yang@intel.com,
 SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>
References: <20230516181646.1372351-1-fei.yang@intel.com>
 <168430259411.6589.16312073611815947427@emeril.freedesktop.org>
 <20230524160248.v2kztk3nsynzm4ha@kamilkon-desk1>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230524160248.v2kztk3nsynzm4ha@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdC9n?=
 =?utf-8?q?em=5Fcreate=3A_exercise_gem=5Fcreate=5Fext=5Fset=5Fpat?=
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



On 24/05/2023 17:02, Kamil Konieczny wrote:
> Hi Sai,
> 
> No need for respin as there is new series. I have few comments, see below.
> 
> On 2023-05-17 at 05:49:54 -0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: test/gem_create: exercise gem_create_ext_set_pat
>> URL   : https://patchwork.freedesktop.org/series/117833/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from CI_DRM_13153_full -> IGTPW_8979_full
>> ====================================================
>>
>> Summary
>> -------
>>
>>    **FAILURE**
>>
>>    Serious unknown changes coming with IGTPW_8979_full absolutely need to be
>>    verified manually.
>>    
>>    If you think the reported changes have nothing to do with the changes
>>    introduced in IGTPW_8979_full, please notify your bug team to allow them
>>    to document this new failure mode, which will reduce false positives in CI.
>>
>>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/index.html
>>
>> Participating hosts (7 -> 7)
>> ------------------------------
>>
>>    No changes in participating hosts
>>
>> Possible new issues
>> -------------------
>>
>>    Here are the unknown changes that may have been introduced in IGTPW_8979_full:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>    * {igt@gem_create@create-ext-set-pat} (NEW):
>>      - {shard-rkl}:        NOTRUN -> [SKIP][1]
>>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-rkl-7/igt@gem_create@create-ext-set-pat.html
>>      - {shard-dg1}:        NOTRUN -> [SKIP][2]
>>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-dg1-16/igt@gem_create@create-ext-set-pat.html
>>      - {shard-tglu}:       NOTRUN -> [SKIP][3]
>>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-tglu-2/igt@gem_create@create-ext-set-pat.html
> 
> Please add this to expected skips, this new test is
> for MTL and above.

Shouldn't be for MTL only, I believe skips are because kernel the run 
was against does not support the API. We need a Test-with: run to show 
behaviour with the extension across platforms.

Regards,

Tvrtko

> 
>>
>>    * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
>>      - shard-apl:          [PASS][4] -> [ABORT][5]
>>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
>>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
>>
> 
> This one is unrelated.
> 
> Regards,
> Kamil
>>    
>> #### Suppressed ####
>>
>>    The following results come from untrusted machines, tests, or statuses.
>>    They do not affect the overall result.
>>
>>    * igt@debugfs_test@read_all_entries_display_off:
>>      - {shard-dg1}:        [PASS][6] -> [DMESG-WARN][7]
>>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-dg1-12/igt@debugfs_test@read_all_entries_display_off.html
>>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-dg1-16/igt@debugfs_test@read_all_entries_display_off.html
>>
>>    
>> New tests
>> ---------
>>
>>    New tests have been introduced between CI_DRM_13153_full and IGTPW_8979_full:
>>
>> ### New IGT tests (1) ###
>>
>>    * igt@gem_create@create-ext-set-pat:
>>      - Statuses : 6 skip(s)
>>      - Exec time: [0.0] s
>>
>>    
>>
>> Known issues
>> ------------
>>
>>    Here are the changes found in IGTPW_8979_full that come from known issues:
>>
>> ### IGT changes ###
>>
>> #### Issues hit ####
>>
>>    * igt@drm_mm@all-tests:
>>      - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#4579]) +3 similar issues
>>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-snb7/igt@drm_mm@all-tests.html
>>
>>    * igt@gem_exec_fair@basic-none-solo@rcs0:
>>      - shard-glk:          NOTRUN -> [FAIL][9] ([i915#2842])
>>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html
>>
>>    * igt@gem_huc_copy@huc-copy:
>>      - shard-glk:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#2190])
>>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-glk6/igt@gem_huc_copy@huc-copy.html
>>
>>    * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>>      - shard-glk:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#3886]) +2 similar issues
>>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-glk4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
>>
>>    * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>>      - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271]) +52 similar issues
>>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-snb5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
>>
>>    * igt@kms_chamelium_color@ctm-blue-to-red:
>>      - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271]) +80 similar issues
>>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-glk5/igt@kms_chamelium_color@ctm-blue-to-red.html
>>
>>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>>      - shard-glk:          NOTRUN -> [FAIL][14] ([i915#2346])
>>     [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>>
>>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>>      - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#2346])
>>     [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>>     [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>>
>>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
>>      - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#79])
>>     [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
>>     [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
>>
>>    * igt@kms_frontbuffer_tracking@fbc-suspend:
>>      - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180] / [i915#1982] / [i915#62])
>>     [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
>>     [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
>>
>>    * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>>      - shard-apl:          NOTRUN -> [SKIP][21] ([fdo#109271]) +3 similar issues
>>     [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-apl6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
>>
>>    * igt@kms_lease@lease_revoke@pipe-a-dp-1:
>>      - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#62]) +6 similar issues
>>     [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-apl7/igt@kms_lease@lease_revoke@pipe-a-dp-1.html
>>     [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-apl6/igt@kms_lease@lease_revoke@pipe-a-dp-1.html
>>
>>    * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
>>      - shard-glk:          NOTRUN -> [FAIL][24] ([i915#4573]) +1 similar issue
>>     [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html
>>
>>    * igt@kms_psr2_su@frontbuffer-xrgb8888:
>>      - shard-glk:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#658])
>>     [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-glk2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>>
>>    * igt@kms_scaling_modes@scaling-mode-full:
>>      - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4579]) +9 similar issues
>>     [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-glk2/igt@kms_scaling_modes@scaling-mode-full.html
>>
>>    
>> #### Possible fixes ####
>>
>>    * igt@device_reset@unbind-reset-rebind:
>>      - {shard-rkl}:        [ABORT][27] ([i915#5507]) -> [PASS][28]
>>     [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html
>>     [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html
>>      - shard-apl:          [ABORT][29] ([i915#5507]) -> [PASS][30]
>>     [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-apl1/igt@device_reset@unbind-reset-rebind.html
>>     [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-apl7/igt@device_reset@unbind-reset-rebind.html
>>      - {shard-tglu}:       [ABORT][31] ([i915#5507]) -> [PASS][32]
>>     [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-tglu-3/igt@device_reset@unbind-reset-rebind.html
>>     [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-tglu-4/igt@device_reset@unbind-reset-rebind.html
>>
>>    * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>>      - {shard-rkl}:        [FAIL][33] ([i915#7742]) -> [PASS][34]
>>     [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>>     [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>>
>>    * igt@gem_ctx_freq@sysfs:
>>      - {shard-dg1}:        [FAIL][35] ([i915#6786]) -> [PASS][36]
>>     [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-dg1-12/igt@gem_ctx_freq@sysfs.html
>>     [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-dg1-15/igt@gem_ctx_freq@sysfs.html
>>
>>    * igt@gem_exec_fair@basic-deadline:
>>      - shard-apl:          [FAIL][37] ([i915#2846]) -> [PASS][38]
>>     [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-apl2/igt@gem_exec_fair@basic-deadline.html
>>     [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-apl6/igt@gem_exec_fair@basic-deadline.html
>>
>>    * igt@gem_ppgtt@blt-vs-render-ctx0:
>>      - shard-snb:          [DMESG-FAIL][39] ([i915#8295]) -> [PASS][40]
>>     [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-snb6/igt@gem_ppgtt@blt-vs-render-ctx0.html
>>     [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-snb2/igt@gem_ppgtt@blt-vs-render-ctx0.html
>>
>>    * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>>      - {shard-dg1}:        [FAIL][41] ([i915#3591]) -> [PASS][42]
>>     [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
>>     [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
>>
>>    * igt@i915_pm_rps@reset:
>>      - shard-snb:          [INCOMPLETE][43] ([i915#7790]) -> [PASS][44]
>>     [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-snb2/igt@i915_pm_rps@reset.html
>>     [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-snb5/igt@i915_pm_rps@reset.html
>>
>>    * igt@i915_selftest@perf@engine_cs:
>>      - shard-snb:          [ABORT][45] ([i915#4528] / [i915#4579]) -> [PASS][46]
>>     [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-snb2/igt@i915_selftest@perf@engine_cs.html
>>     [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-snb7/igt@i915_selftest@perf@engine_cs.html
>>
>>    * igt@perf_pmu@idle@rcs0:
>>      - {shard-rkl}:        [FAIL][47] ([i915#4349]) -> [PASS][48]
>>     [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-rkl-2/igt@perf_pmu@idle@rcs0.html
>>     [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-rkl-3/igt@perf_pmu@idle@rcs0.html
>>
>>    
>> #### Warnings ####
>>
>>    * igt@kms_content_protection@mei_interface:
>>      - shard-snb:          [SKIP][49] ([fdo#109271] / [i915#4579]) -> [SKIP][50] ([fdo#109271])
>>     [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13153/shard-snb6/igt@kms_content_protection@mei_interface.html
>>     [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/shard-snb2/igt@kms_content_protection@mei_interface.html
>>
>>    
>>    {name}: This element is suppressed. This means it is ignored when computing
>>            the status of the difference (SUCCESS, WARNING, or FAILURE).
>>
>>    [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>>    [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>>    [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>>    [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>>    [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>>    [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>>    [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>>    [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>>    [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
>>    [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>>    [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>>    [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>>    [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>>    [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>>    [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>>    [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>>    [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>>    [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>>    [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>>    [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
>>    [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>>    [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>>    [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>>    [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>>    [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>>    [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>>    [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>>    [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>>    [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>>    [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>>    [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>>    [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>>    [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>>    [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>>    [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>>    [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>>    [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>>    [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>>    [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>>    [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>>    [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>>    [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>>    [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>>    [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>>    [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
>>    [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>>    [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>>    [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
>>    [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
>>    [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>>    [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>>    [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>>    [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>>    [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>>    [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>>    [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>>    [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>>    [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>>    [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>>    [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>>    [i915#5507]: https://gitlab.freedesktop.org/drm/intel/issues/5507
>>    [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>>    [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>>    [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
>>    [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
>>    [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>>    [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
>>    [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>>    [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>>    [i915#6786]: https://gitlab.freedesktop.org/drm/intel/issues/6786
>>    [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>>    [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>>    [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>>    [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>>    [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
>>    [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>>    [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>>    [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>>    [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
>>    [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>>    [i915#8295]: https://gitlab.freedesktop.org/drm/intel/issues/8295
>>
>>
>> Build changes
>> -------------
>>
>>    * CI: CI-20190529 -> None
>>    * IGT: IGT_7292 -> IGTPW_8979
>>    * Piglit: piglit_4509 -> None
>>
>>    CI-20190529: 20190529
>>    CI_DRM_13153: 1ceecfa94dd4a059164b23925aecc9db4c4fd3b6 @ git://anongit.freedesktop.org/gfx-ci/linux
>>    IGTPW_8979: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/index.html
>>    IGT_7292: 9d9475ffd3b5ae18fd8ec120595385f6c562f249 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
>>
>> == Logs ==
>>
>> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8979/index.html
