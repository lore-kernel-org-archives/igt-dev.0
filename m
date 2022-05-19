Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E3111B23F
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 09:31:26 +0000 (UTC)
Date: Thu, 19 May 2022 12:29:02 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Message-ID: <YoYN3tcZg6/4N398@platvala-desk.ger.corp.intel.com>
References: <20220518235608.4528-1-vitaly.prosyak@amd.com>
 <165292494485.515.8896092559733284858@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165292494485.515.8896092559733284858@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_refactoring_and_update_amd=5Fbasic_tests_=28rev3=29?=
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

On Thu, May 19, 2022 at 01:49:04AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/amdgpu: refactoring and update amd_basic tests (rev3)
> URL   : https://patchwork.freedesktop.org/series/104149/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_6480_full -> IGTPW_7139_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7139_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7139_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/index.html
> 
> Participating hosts (7 -> 8)
> ------------------------------
> 
>   Additional (1): shard-tglu 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7139_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-snb6/igt@i915_suspend@basic-s3-without-i915.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html


Lakshmi, false positive here.



-- 
Petri Latvala



> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7139_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@feature_discovery@display-3x:
>     - shard-iclb:         NOTRUN -> [SKIP][3] ([i915#1839])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb5/igt@feature_discovery@display-3x.html
>     - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#1839])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@feature_discovery@display-3x.html
> 
>   * igt@gem_ctx_persistence@processes:
>     - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +1 similar issue
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-snb2/igt@gem_ctx_persistence@processes.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][6] ([i915#2842])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs1:
>     - shard-iclb:         NOTRUN -> [FAIL][7] ([i915#2842])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-apl:          [PASS][8] -> [FAIL][9] ([i915#2842]) +1 similar issue
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#2842]) +2 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][12] ([i915#2842]) +1 similar issue
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html
>     - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2849])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_flush@basic-wb-ro-default:
>     - shard-snb:          [PASS][14] -> [SKIP][15] ([fdo#109271]) +1 similar issue
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-snb4/igt@gem_exec_flush@basic-wb-ro-default.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-snb6/igt@gem_exec_flush@basic-wb-ro-default.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#112283])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@gem_exec_params@secure-non-root.html
>     - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#112283])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb1/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gem_exec_whisper@basic-forked-all:
>     - shard-glk:          [PASS][18] -> [DMESG-WARN][19] ([i915#118])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk3/igt@gem_exec_whisper@basic-forked-all.html
> 
>   * igt@gem_lmem_swapping@heavy-multi:
>     - shard-kbl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl4/igt@gem_lmem_swapping@heavy-multi.html
>     - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#4613]) +1 similar issue
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@gem_lmem_swapping@heavy-multi.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-glk:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#4613])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk9/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs:
>     - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4613])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl8/igt@gem_lmem_swapping@verify-random-ccs.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-1:
>     - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#4270])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb2/igt@gem_pxp@reject-modify-context-protection-off-1.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-execution:
>     - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#4270]) +3 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb7/igt@gem_pxp@verify-pxp-stale-buf-execution.html
> 
>   * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
>     - shard-kbl:          NOTRUN -> [SKIP][26] ([fdo#109271]) +183 similar issues
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-to-vebox-linear:
>     - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#768]) +1 similar issue
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-linear.html
> 
>   * igt@gem_softpin@evict-single-offset:
>     - shard-kbl:          NOTRUN -> [FAIL][28] ([i915#4171])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl1/igt@gem_softpin@evict-single-offset.html
> 
>   * igt@gem_userptr_blits@coherency-unsync:
>     - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#3297])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb1/igt@gem_userptr_blits@coherency-unsync.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#3297]) +1 similar issue
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen7_exec_parse@chained-batch:
>     - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109289]) +1 similar issue
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb3/igt@gen7_exec_parse@chained-batch.html
> 
>   * igt@gen9_exec_parse@basic-rejected-ctx-param:
>     - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#2856])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html
> 
>   * igt@gen9_exec_parse@bb-start-cmd:
>     - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#2527] / [i915#2856]) +1 similar issue
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@gen9_exec_parse@bb-start-cmd.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-iclb:         [PASS][34] -> [FAIL][35] ([i915#454])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>     - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#1937])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
>     - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#1937])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109289]) +2 similar issues
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111644] / [i915#1397] / [i915#2411])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>     - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110892])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#5723])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb3/igt@i915_query@test-query-geometry-subslices.html
>     - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#5723])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@i915_suspend@debugfs-reader:
>     - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +2 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-apl1/igt@i915_suspend@debugfs-reader.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl6/igt@i915_suspend@debugfs-reader.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][45] ([i915#180])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl7/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
>     - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#5286]) +3 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb5/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#5286]) +8 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb3/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111614]) +9 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#110725] / [fdo#111614]) +7 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-snb:          NOTRUN -> [SKIP][50] ([fdo#109271]) +171 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-snb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111615]) +8 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#110723]) +1 similar issue
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#2705])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb5/igt@kms_big_joiner@basic.html
>     - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#2705])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb1/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#3886]) +5 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl3/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>     - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#3886]) +5 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3689]) +8 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3886]) +6 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>     - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [i915#3886]) +4 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#3689] / [i915#3886]) +1 similar issue
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111615] / [i915#3689]) +9 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3742])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb7/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_chamelium@hdmi-hpd-after-suspend:
>     - shard-snb:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-snb6/igt@kms_chamelium@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_color@pipe-b-deep-color:
>     - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#6029])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb8/igt@kms_color@pipe-b-deep-color.html
> 
>   * igt@kms_color@pipe-d-ctm-0-25:
>     - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278] / [i915#1149])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb1/igt@kms_color@pipe-d-ctm-0-25.html
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
>     - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109284] / [fdo#111827]) +6 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-negative:
>     - shard-glk:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +11 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk8/igt@kms_color_chamelium@pipe-c-ctm-negative.html
> 
>   * igt@kms_color_chamelium@pipe-c-gamma:
>     - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl3/igt@kms_color_chamelium@pipe-c-gamma.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
>     - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +9 similar issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl7/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
>     - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109284] / [fdo#111827]) +13 similar issues
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3116] / [i915#3299])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb8/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#1063])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3319]) +3 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
>     - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109278] / [fdo#109279]) +3 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109279] / [i915#3359]) +5 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-max-size-random:
>     - shard-glk:          NOTRUN -> [SKIP][76] ([fdo#109271]) +135 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-max-size-random.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:
>     - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278]) +28 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
>     - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3359]) +11 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#4103]) +1 similar issue
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109274] / [fdo#109278]) +1 similar issue
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [PASS][81] -> [FAIL][82] ([i915#2346] / [i915#533])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>     - shard-iclb:         NOTRUN -> [FAIL][83] ([i915#2346])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
>     - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#5287]) +1 similar issue
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html
>     - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#5287])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html
> 
>   * igt@kms_dsc@basic-dsc-enable:
>     - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#3840])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb5/igt@kms_dsc@basic-dsc-enable.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-glk:          NOTRUN -> [FAIL][87] ([i915#4767])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109274] / [fdo#111825] / [i915#3966])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>     - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109274]) +2 similar issues
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109274] / [fdo#111825]) +11 similar issues
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp1:
>     - shard-kbl:          [PASS][91] -> [DMESG-WARN][92] ([i915#180]) +2 similar issues
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2587])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
>     - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#2587]) +1 similar issue
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109285])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb7/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109280]) +28 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
>     - shard-apl:          NOTRUN -> [SKIP][97] ([fdo#109271]) +157 similar issues
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>     - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109280] / [fdo#111825]) +40 similar issues
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
>     - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#533]) +1 similar issue
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
>     - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#533])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
>     - shard-apl:          NOTRUN -> [FAIL][101] ([fdo#108145] / [i915#265]) +1 similar issue
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
>     - shard-kbl:          NOTRUN -> [FAIL][102] ([fdo#108145] / [i915#265])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
>     - shard-glk:          NOTRUN -> [FAIL][103] ([fdo#108145] / [i915#265]) +2 similar issues
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
> 
>   * igt@kms_plane_lowres@pipe-a-tiling-x:
>     - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#3536]) +1 similar issue
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@kms_plane_lowres@pipe-a-tiling-x.html
> 
>   * igt@kms_plane_lowres@pipe-c-tiling-none:
>     - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#3536]) +1 similar issue
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb5/igt@kms_plane_lowres@pipe-c-tiling-none.html
> 
>   * igt@kms_plane_lowres@pipe-d-tiling-yf:
>     - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#111615] / [fdo#112054]) +1 similar issue
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@kms_plane_lowres@pipe-d-tiling-yf.html
> 
>   * igt@kms_plane_multiple@atomic-pipe-b-tiling-4:
>     - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#5288])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-b-tiling-4.html
> 
>   * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier:
>     - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#5176]) +11 similar issues
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier.html
> 
>   * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-c-edp-1-downscale-with-pixel-format:
>     - shard-iclb:         NOTRUN -> [SKIP][109] ([i915#5176]) +8 similar issues
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-c-edp-1-downscale-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale:
>     - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#5235]) +3 similar issues
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale.html
> 
>   * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
>     - shard-iclb:         [PASS][111] -> [SKIP][112] ([i915#5176]) +1 similar issue
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-tglb:         NOTRUN -> [SKIP][113] ([i915#2920]) +2 similar issues
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb3/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-apl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#658]) +1 similar issue
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
>     - shard-glk:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#658]) +2 similar issues
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
>     - shard-iclb:         NOTRUN -> [SKIP][116] ([fdo#111068] / [i915#658])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area:
>     - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#658]) +2 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#1911])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-iclb:         NOTRUN -> [SKIP][119] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb4/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109441]) +2 similar issues
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   * igt@kms_psr@psr2_primary_mmap_gtt:
>     - shard-tglb:         NOTRUN -> [FAIL][121] ([i915#132] / [i915#3467]) +6 similar issues
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb6/igt@kms_psr@psr2_primary_mmap_gtt.html
> 
>   * igt@kms_psr@psr2_primary_page_flip:
>     - shard-iclb:         [PASS][122] -> [SKIP][123] ([fdo#109441])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-tglb:         NOTRUN -> [SKIP][124] ([fdo#111615] / [i915#5289])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-tglb:         NOTRUN -> [SKIP][125] ([i915#3555]) +1 similar issue
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb8/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-iclb:         NOTRUN -> [SKIP][126] ([i915#3555])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-apl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#2437])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl6/igt@kms_writeback@writeback-check-output.html
>     - shard-iclb:         NOTRUN -> [SKIP][128] ([i915#2437]) +1 similar issue
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb4/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-kbl:          NOTRUN -> [SKIP][129] ([fdo#109271] / [i915#2437]) +2 similar issues
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl4/igt@kms_writeback@writeback-fb-id.html
>     - shard-tglb:         NOTRUN -> [SKIP][130] ([i915#2437]) +2 similar issues
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@nouveau_crc@pipe-b-source-outp-inactive:
>     - shard-iclb:         NOTRUN -> [SKIP][131] ([i915#2530]) +4 similar issues
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb7/igt@nouveau_crc@pipe-b-source-outp-inactive.html
> 
>   * igt@nouveau_crc@pipe-c-source-outp-complete:
>     - shard-tglb:         NOTRUN -> [SKIP][132] ([i915#2530]) +4 similar issues
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb5/igt@nouveau_crc@pipe-c-source-outp-complete.html
> 
>   * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
>     - shard-iclb:         NOTRUN -> [SKIP][133] ([fdo#109291]) +3 similar issues
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb3/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html
> 
>   * igt@prime_nv_test@i915_nv_sharing:
>     - shard-tglb:         NOTRUN -> [SKIP][134] ([fdo#109291]) +4 similar issues
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb2/igt@prime_nv_test@i915_nv_sharing.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-tglb:         NOTRUN -> [SKIP][135] ([fdo#111656])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb7/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-tglb:         NOTRUN -> [SKIP][136] ([fdo#109295])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb8/igt@prime_vgem@fence-write-hang.html
>     - shard-iclb:         NOTRUN -> [SKIP][137] ([fdo#109295])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb5/igt@prime_vgem@fence-write-hang.html
> 
>   * igt@sysfs_clients@busy:
>     - shard-glk:          NOTRUN -> [SKIP][138] ([fdo#109271] / [i915#2994]) +1 similar issue
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk6/igt@sysfs_clients@busy.html
>     - shard-kbl:          NOTRUN -> [SKIP][139] ([fdo#109271] / [i915#2994]) +1 similar issue
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl4/igt@sysfs_clients@busy.html
>     - shard-apl:          NOTRUN -> [SKIP][140] ([fdo#109271] / [i915#2994]) +1 similar issue
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl4/igt@sysfs_clients@busy.html
> 
>   * igt@sysfs_clients@fair-3:
>     - shard-tglb:         NOTRUN -> [SKIP][141] ([i915#2994]) +2 similar issues
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb5/igt@sysfs_clients@fair-3.html
>     - shard-iclb:         NOTRUN -> [SKIP][142] ([i915#2994]) +1 similar issue
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb4/igt@sysfs_clients@fair-3.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_fair@basic-none@rcs0:
>     - shard-kbl:          [FAIL][143] ([i915#2842]) -> [PASS][144] +1 similar issue
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-apl:          [FAIL][145] ([i915#2842]) -> [PASS][146] +1 similar issue
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl4/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [FAIL][147] ([i915#2842]) -> [PASS][148] +1 similar issue
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_flush@basic-uc-rw-default:
>     - shard-snb:          [SKIP][149] ([fdo#109271]) -> [PASS][150]
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-snb6/igt@gem_exec_flush@basic-uc-rw-default.html
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-snb2/igt@gem_exec_flush@basic-uc-rw-default.html
> 
>   * igt@gem_exec_whisper@basic-queues-forked-all:
>     - shard-glk:          [DMESG-WARN][151] ([i915#118]) -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-iclb:         [FAIL][153] ([i915#454]) -> [PASS][154]
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
>     - shard-iclb:         [DMESG-FAIL][155] ([i915#1888]) -> [PASS][156]
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-apl:          [DMESG-WARN][157] ([i915#180]) -> [PASS][158] +3 similar issues
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-iclb:         [FAIL][159] ([i915#2346]) -> [PASS][160]
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
>     - shard-glk:          [FAIL][161] ([i915#79]) -> [PASS][162]
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
>     - shard-glk:          [FAIL][163] ([i915#1888] / [i915#2546]) -> [PASS][164]
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-tglb:         [SKIP][165] ([i915#5519]) -> [PASS][166]
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_balancer@parallel:
>     - shard-iclb:         [DMESG-WARN][167] ([i915#5614]) -> [SKIP][168] ([i915#4525]) +1 similar issue
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb4/igt@gem_exec_balancer@parallel.html
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb8/igt@gem_exec_balancer@parallel.html
> 
>   * igt@gem_exec_balancer@parallel-keep-submit-fence:
>     - shard-iclb:         [SKIP][169] ([i915#4525]) -> [DMESG-WARN][170] ([i915#5614]) +1 similar issue
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb5/igt@gem_exec_balancer@parallel-keep-submit-fence.html
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-iclb:         [DMESG-FAIL][171] ([i915#5614]) -> [SKIP][172] ([i915#4525])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-iclb:         [WARN][173] ([i915#2684]) -> [FAIL][174] ([i915#2680] / [i915#2684])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - shard-iclb:         [SKIP][175] ([fdo#111068] / [i915#658]) -> [SKIP][176] ([i915#2920]) +1 similar issue
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-iclb:         [FAIL][177] ([i915#5939]) -> [SKIP][178] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-iclb3/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@runner@aborted:
>     - shard-kbl:          ([FAIL][179], [FAIL][180], [FAIL][181], [FAIL][182], [FAIL][183], [FAIL][184], [FAIL][185], [FAIL][186], [FAIL][187], [FAIL][188], [FAIL][189]) ([i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][190], [FAIL][191], [FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198], [FAIL][199]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl6/igt@runner@aborted.html
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl6/igt@runner@aborted.html
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl7/igt@runner@aborted.html
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl7/igt@runner@aborted.html
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl6/igt@runner@aborted.html
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl6/igt@runner@aborted.html
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl1/igt@runner@aborted.html
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl3/igt@runner@aborted.html
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl1/igt@runner@aborted.html
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl3/igt@runner@aborted.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6480/shard-kbl3/igt@runner@aborted.html
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl1/igt@runner@aborted.html
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl3/igt@runner@aborted.html
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl1/igt@runner@aborted.html
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl1/igt@runner@aborted.html
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl4/igt@runner@aborted.html
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl6/igt@runner@aborted.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl7/igt@runner@aborted.html
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl7/igt@runner@aborted.html
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl6/igt@runner@aborted.html
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/shard-kbl7/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>   [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
>   [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
>   [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
>   [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2680]: https://gitlab.freedesktop.org/drm/intel/issues/2680
>   [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
>   [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
>   [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
>   [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
>   [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
>   [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
>   [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
>   [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
>   [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
>   [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
>   [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
>   [i915#5691]: https://gitlab.freedesktop.org/drm/intel/issues/5691
>   [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
>   [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
>   [i915#6029]: https://gitlab.freedesktop.org/drm/intel/issues/6029
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6480 -> IGTPW_7139
> 
>   CI-20190529: 20190529
>   CI_DRM_11674: 3e53b0d858897e3c1e7c6a661219823df2326b77 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_7139: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/index.html
>   IGT_6480: 40ee6f52ac54858fa857fcdef52c0c791abf9344 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7139/index.html
