Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88C310EEA5
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Apr 2022 11:37:36 +0000 (UTC)
Date: Tue, 19 Apr 2022 17:08:27 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20220419113826.GA11688@intel.com>
References: <20220418152954.5327-1-ramalingam.c@intel.com>
 <165035460750.19107.17826211923908132640@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <165035460750.19107.17826211923908132640@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Flmem=5Fswapping=3A_Add_ccs_subtests_=28rev10=29?=
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

On 2022-04-19 at 07:50:07 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/i915/gem_lmem_swapping: Add ccs subtests (rev10)
> URL   : https://patchwork.freedesktop.org/series/101324/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11512_full -> IGTPW_6944_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6944_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6944_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/index.html
> 
> Participating hosts (13 -> 9)
> ------------------------------
> 
>   Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6944_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-glk:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-glk3/igt@device_reset@unbind-reset-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk3/igt@device_reset@unbind-reset-rebind.html
>     - shard-apl:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl3/igt@device_reset@unbind-reset-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl3/igt@device_reset@unbind-reset-rebind.html
>     - shard-kbl:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl6/igt@device_reset@unbind-reset-rebind.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl1/igt@device_reset@unbind-reset-rebind.html
These test results are not related to the change in discussion.
> 
>   * {igt@gem_lmem_swapping@heavy-verify-random-ccs} (NEW):
>     - {shard-rkl}:        NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][8] +2 similar issues
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb5/igt@gem_lmem_swapping@verify-random-ccs.html
>     - shard-tglb:         NOTRUN -> [SKIP][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb7/igt@gem_lmem_swapping@verify-random-ccs.html
> 
>   * {igt@gem_lmem_swapping@verify-random-ccs@lmem0} (NEW):
>     - {shard-dg1}:        NOTRUN -> [SKIP][10]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-dg1-19/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html
> 
Above ccs tests are supposed to skip on non flat-ccs platforms like rkl,
icl, tgl and dg1. So this is expected behaviour.

Regards
Ram.
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@gem_exec_schedule@submit-golden-slice@vecs0:
>     - {shard-dg1}:        [PASS][11] -> [INCOMPLETE][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-dg1-19/igt@gem_exec_schedule@submit-golden-slice@vecs0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-dg1-17/igt@gem_exec_schedule@submit-golden-slice@vecs0.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - {shard-rkl}:        NOTRUN -> [SKIP][13] +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-1/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs:
>     - {shard-tglu}:       NOTRUN -> [SKIP][14]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglu-8/igt@gem_lmem_swapping@verify-random-ccs.html
> 
>   * igt@i915_pm_rpm@i2c:
>     - {shard-rkl}:        [SKIP][15] ([fdo#109308]) -> [INCOMPLETE][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-1/igt@i915_pm_rpm@i2c.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-5/igt@i915_pm_rpm@i2c.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_11512_full and IGTPW_6944_full:
> 
> ### New IGT tests (2) ###
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6944_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ccs@block-copy-inplace:
>     - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#5325])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb1/igt@gem_ccs@block-copy-inplace.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#5327])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb1/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@rcs0:
>     - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +2 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
>     - shard-snb:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#1099])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html
> 
>   * igt@gem_ctx_shared@q-in-order:
>     - shard-snb:          NOTRUN -> [SKIP][22] ([fdo#109271]) +247 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-snb6/igt@gem_ctx_shared@q-in-order.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][23] ([i915#180]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl1/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#4525])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb8/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-iclb:         NOTRUN -> [DMESG-FAIL][25] ([i915#5614])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html
>     - shard-tglb:         NOTRUN -> [DMESG-FAIL][26] ([i915#5076] / [i915#5614])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb1/igt@gem_exec_balancer@parallel-ordering.html
>     - shard-kbl:          NOTRUN -> [DMESG-FAIL][27] ([i915#5076] / [i915#5614])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl1/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#2846])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-glk6/igt@gem_exec_fair@basic-deadline.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk4/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#2842])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@bcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][32] ([i915#2842]) +5 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#2849])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109313])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_params@no-bsd:
>     - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#109283]) +1 similar issue
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb7/igt@gem_exec_params@no-bsd.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109283])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb3/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_whisper@basic-queues-forked-all:
>     - shard-iclb:         [PASS][38] -> [INCOMPLETE][39] ([i915#5304] / [i915#5498])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked-all.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb8/igt@gem_exec_whisper@basic-queues-forked-all.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-tglb:         [PASS][40] -> [SKIP][41] ([i915#2190])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-tglb5/igt@gem_huc_copy@huc-copy.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb6/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@heavy-multi:
>     - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#4613]) +2 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl3/igt@gem_lmem_swapping@heavy-multi.html
>     - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#4613])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb8/igt@gem_lmem_swapping@heavy-multi.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#4613]) +2 similar issues
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb2/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify:
>     - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#4613]) +2 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl6/igt@gem_lmem_swapping@parallel-random-verify.html
> 
>   * igt@gem_pxp@create-regular-context-1:
>     - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#4270]) +1 similar issue
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb1/igt@gem_pxp@create-regular-context-1.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#4270])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb1/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#768])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>     - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#3297])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>   * igt@gen7_exec_parse@batch-without-end:
>     - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109289]) +2 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb7/igt@gen7_exec_parse@batch-without-end.html
> 
>   * igt@gen7_exec_parse@cmd-crossing-page:
>     - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#109289]) +4 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb8/igt@gen7_exec_parse@cmd-crossing-page.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-apl:          [PASS][53] -> [DMESG-WARN][54] ([i915#5566] / [i915#716])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl8/igt@gen9_exec_parse@allowed-all.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl8/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#2856]) +1 similar issue
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb6/igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@gen9_exec_parse@bb-start-cmd:
>     - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#2527] / [i915#2856]) +4 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html
> 
>   * igt@i915_pm_rpm@dpms-non-lpsp:
>     - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111644] / [i915#1397] / [i915#2411])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-iclb:         NOTRUN -> [SKIP][58] ([i915#1769])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>     - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#1769]) +1 similar issue
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#5286]) +4 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#5286]) +6 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#110725] / [fdo#111614]) +1 similar issue
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb1/igt@kms_big_fb@linear-32bpp-rotate-90.html
>     - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111614])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb1/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3777]) +2 similar issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>     - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3777]) +2 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#3777]) +4 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111615]) +7 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271]) +164 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
>     - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#110723]) +1 similar issue
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_joiner@2x-modeset:
>     - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#2705])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb8/igt@kms_big_joiner@2x-modeset.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3689]) +6 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#3886]) +5 similar issues
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
>     - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278] / [i915#3886]) +7 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
>     - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#3886]) +9 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>     - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#3886]) +9 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111615] / [i915#3689]) +5 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#3689] / [i915#3886]) +2 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb6/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_chamelium@hdmi-crc-fast:
>     - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109284] / [fdo#111827]) +11 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb6/igt@kms_chamelium@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium@hdmi-hpd-storm:
>     - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [fdo#111827]) +16 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl4/igt@kms_chamelium@hdmi-hpd-storm.html
> 
>   * igt@kms_chamelium@vga-hpd-without-ddc:
>     - shard-snb:          NOTRUN -> [SKIP][80] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-snb4/igt@kms_chamelium@vga-hpd-without-ddc.html
> 
>   * igt@kms_color@pipe-d-ctm-max:
>     - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109278] / [i915#1149])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb6/igt@kms_color@pipe-d-ctm-max.html
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-0-5:
>     - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +9 similar issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-0-5.html
>     - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-0-5.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
>     - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
>     - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109284] / [fdo#111827]) +18 similar issues
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-kbl:          NOTRUN -> [TIMEOUT][86] ([i915#1319]) +1 similar issue
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl7/igt@kms_content_protection@atomic.html
>     - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109300] / [fdo#111066]) +1 similar issue
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb2/igt@kms_content_protection@atomic.html
>     - shard-apl:          NOTRUN -> [TIMEOUT][88] ([i915#1319]) +1 similar issue
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl2/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-kbl:          NOTRUN -> [FAIL][89] ([i915#2105])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl6/igt@kms_content_protection@uevent.html
>     - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#1063]) +4 similar issues
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb2/igt@kms_content_protection@uevent.html
>     - shard-apl:          NOTRUN -> [FAIL][91] ([i915#2105])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl8/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
>     - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109278] / [fdo#109279]) +4 similar issues
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
>     - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#3359]) +10 similar issues
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#3319]) +2 similar issues
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
>     - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109279] / [i915#3359]) +6 similar issues
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-256x256-random:
>     - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271]) +93 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk4/igt@kms_cursor_crc@pipe-d-cursor-256x256-random.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-256x85-onscreen:
>     - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109278]) +28 similar issues
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-256x85-onscreen.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109274] / [fdo#109278]) +3 similar issues
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109274] / [fdo#111825]) +12 similar issues
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [PASS][100] -> [FAIL][101] ([i915#2346] / [i915#533])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#4103]) +1 similar issue
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
>     - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#3788])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb5/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled:
>     - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#5287]) +2 similar issues
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#5287]) +3 similar issues
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109274]) +3 similar issues
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
>     - shard-glk:          [PASS][107] -> [FAIL][108] ([i915#79])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#2587])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
>     - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#2587])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-kbl:          NOTRUN -> [SKIP][111] ([fdo#109271]) +193 similar issues
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
>     - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109280]) +32 similar issues
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu:
>     - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#109280] / [fdo#111825]) +45 similar issues
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#3555]) +3 similar issues
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb1/igt@kms_hdr@static-toggle-dpms.html
>     - shard-iclb:         NOTRUN -> [SKIP][115] ([i915#3555])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb1/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-tglb:         NOTRUN -> [SKIP][116] ([i915#1839])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>     - shard-iclb:         NOTRUN -> [SKIP][117] ([i915#1839])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
>     - shard-glk:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#533])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
>     - shard-apl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#533])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
>     - shard-kbl:          NOTRUN -> [SKIP][120] ([fdo#109271] / [i915#533]) +1 similar issue
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>     - shard-glk:          NOTRUN -> [FAIL][121] ([i915#265])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
>     - shard-kbl:          NOTRUN -> [FAIL][122] ([i915#265])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
>     - shard-kbl:          NOTRUN -> [FAIL][123] ([fdo#108145] / [i915#265]) +2 similar issues
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
>     - shard-glk:          NOTRUN -> [FAIL][124] ([fdo#108145] / [i915#265])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
>     - shard-apl:          NOTRUN -> [FAIL][125] ([fdo#108145] / [i915#265])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
> 
>   * igt@kms_plane_lowres@pipe-b-tiling-none:
>     - shard-iclb:         NOTRUN -> [SKIP][126] ([i915#3536])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb5/igt@kms_plane_lowres@pipe-b-tiling-none.html
> 
>   * igt@kms_plane_lowres@pipe-d-tiling-4:
>     - shard-tglb:         NOTRUN -> [SKIP][127] ([i915#5288])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-4.html
> 
>   * igt@kms_plane_lowres@pipe-d-tiling-y:
>     - shard-tglb:         NOTRUN -> [SKIP][128] ([i915#3536]) +2 similar issues
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-y.html
> 
>   * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format:
>     - shard-iclb:         [PASS][129] -> [SKIP][130] ([i915#5176]) +2 similar issues
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-iclb8/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:
>     - shard-tglb:         NOTRUN -> [SKIP][131] ([i915#5176]) +3 similar issues
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb8/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale:
>     - shard-iclb:         [PASS][132] -> [SKIP][133] ([i915#5235]) +2 similar issues
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-iclb5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-kbl:          NOTRUN -> [SKIP][134] ([fdo#109271] / [i915#658]) +1 similar issue
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>     - shard-tglb:         NOTRUN -> [SKIP][135] ([i915#2920])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-tglb:         NOTRUN -> [SKIP][136] ([i915#1911])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-iclb:         NOTRUN -> [SKIP][137] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb3/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@psr2_dpms:
>     - shard-tglb:         NOTRUN -> [FAIL][138] ([i915#132] / [i915#3467]) +1 similar issue
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb6/igt@kms_psr@psr2_dpms.html
> 
>   * igt@kms_psr@psr2_no_drrs:
>     - shard-iclb:         [PASS][139] -> [SKIP][140] ([fdo#109441]) +2 similar issues
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb1/igt@kms_psr@psr2_no_drrs.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         NOTRUN -> [SKIP][141] ([fdo#109441]) +1 similar issue
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-iclb:         [PASS][142] -> [SKIP][143] ([i915#5519])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-iclb4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
>     - shard-tglb:         NOTRUN -> [SKIP][144] ([i915#5030]) +3 similar issues
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb1/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
>     - shard-iclb:         NOTRUN -> [SKIP][145] ([i915#5030]) +2 similar issues
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb4/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html
> 
>   * igt@kms_setmode@basic@pipe-a-vga-1:
>     - shard-snb:          NOTRUN -> [FAIL][146] ([i915#5465]) +1 similar issue
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-snb2/igt@kms_setmode@basic@pipe-a-vga-1.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-apl:          NOTRUN -> [FAIL][147] ([IGT#2])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl4/igt@kms_sysfs_edid_timing.html
>     - shard-kbl:          NOTRUN -> [FAIL][148] ([IGT#2])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl7/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-kbl:          NOTRUN -> [SKIP][149] ([fdo#109271] / [i915#2437])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl1/igt@kms_writeback@writeback-fb-id.html
>     - shard-tglb:         NOTRUN -> [SKIP][150] ([i915#2437])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb2/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@nouveau_crc@pipe-b-source-outp-complete:
>     - shard-iclb:         NOTRUN -> [SKIP][151] ([i915#2530]) +2 similar issues
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb4/igt@nouveau_crc@pipe-b-source-outp-complete.html
> 
>   * igt@nouveau_crc@pipe-c-source-outp-complete:
>     - shard-tglb:         NOTRUN -> [SKIP][152] ([i915#2530]) +3 similar issues
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb3/igt@nouveau_crc@pipe-c-source-outp-complete.html
> 
>   * igt@prime_nv_pcopy@test3_2:
>     - shard-tglb:         NOTRUN -> [SKIP][153] ([fdo#109291]) +5 similar issues
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb6/igt@prime_nv_pcopy@test3_2.html
> 
>   * igt@prime_nv_test@i915_import_cpu_mmap:
>     - shard-iclb:         NOTRUN -> [SKIP][154] ([fdo#109291]) +3 similar issues
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb7/igt@prime_nv_test@i915_import_cpu_mmap.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-tglb:         NOTRUN -> [SKIP][155] ([fdo#109295])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb7/igt@prime_vgem@fence-read-hang.html
>     - shard-iclb:         NOTRUN -> [SKIP][156] ([fdo#109295])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb1/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@sysfs_clients@fair-3:
>     - shard-tglb:         NOTRUN -> [SKIP][157] ([i915#2994]) +5 similar issues
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb6/igt@sysfs_clients@fair-3.html
> 
>   * igt@sysfs_clients@fair-7:
>     - shard-apl:          NOTRUN -> [SKIP][158] ([fdo#109271] / [i915#2994]) +4 similar issues
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl1/igt@sysfs_clients@fair-7.html
> 
>   * igt@sysfs_clients@sema-25:
>     - shard-iclb:         NOTRUN -> [SKIP][159] ([i915#2994]) +3 similar issues
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb8/igt@sysfs_clients@sema-25.html
> 
>   * igt@sysfs_clients@sema-50:
>     - shard-glk:          NOTRUN -> [SKIP][160] ([fdo#109271] / [i915#2994]) +2 similar issues
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk1/igt@sysfs_clients@sema-50.html
> 
>   * igt@sysfs_clients@split-50:
>     - shard-kbl:          NOTRUN -> [SKIP][161] ([fdo#109271] / [i915#2994]) +4 similar issues
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl6/igt@sysfs_clients@split-50.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][162] ([i915#2842]) -> [PASS][163]
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-vip@rcs0:
>     - shard-kbl:          [FAIL][164] ([i915#2842]) -> [PASS][165]
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl3/igt@gem_exec_fair@basic-none-vip@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglb:         [FAIL][166] ([i915#2842]) -> [PASS][167]
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          [FAIL][168] ([i915#2842]) -> [PASS][169] +1 similar issue
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-wb:
>     - shard-snb:          [SKIP][170] ([fdo#109271]) -> [PASS][171]
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-snb4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-apl:          [SKIP][172] ([fdo#109271]) -> [PASS][173]
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - {shard-rkl}:        [SKIP][174] ([fdo#109308]) -> [PASS][175]
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-1/igt@i915_pm_rpm@basic-rte.html
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@i915_pm_rpm@basic-rte.html
> 
>   * igt@i915_suspend@forcewake:
>     - {shard-dg1}:        [TIMEOUT][176] ([fdo#103375]) -> [PASS][177]
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-dg1-12/igt@i915_suspend@forcewake.html
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-dg1-13/igt@i915_suspend@forcewake.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-0:
>     - shard-glk:          [DMESG-WARN][178] ([i915#118]) -> [PASS][179] +1 similar issue
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-kbl:          [DMESG-WARN][180] ([i915#62] / [i915#92]) -> [PASS][181] +2 similar issues
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
>     - {shard-rkl}:        [SKIP][182] ([i915#1845] / [i915#4098]) -> [PASS][183] +12 similar issues
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a:
>     - shard-kbl:          [DMESG-WARN][184] ([i915#165] / [i915#180] / [i915#62] / [i915#92]) -> [PASS][185] +20 similar issues
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl3/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl4/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html
> 
>   * igt@kms_color@pipe-b-ctm-negative:
>     - {shard-rkl}:        [SKIP][186] ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][187]
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-1/igt@kms_color@pipe-b-ctm-negative.html
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@kms_color@pipe-b-ctm-negative.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
>     - {shard-dg1}:        [DMESG-WARN][188] -> [PASS][189]
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-dg1-13/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-dg1-13/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
>     - {shard-rkl}:        [SKIP][190] ([fdo#112022] / [i915#4070]) -> [PASS][191] +6 similar issues
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-2/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
> 
>   * igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge:
>     - {shard-rkl}:        [SKIP][192] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][193] +1 similar issue
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>     - {shard-rkl}:        [SKIP][194] ([fdo#111825] / [i915#4070]) -> [PASS][195] +1 similar issue
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [FAIL][196] ([i915#2346]) -> [PASS][197]
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled:
>     - {shard-rkl}:        [SKIP][198] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][199] +5 similar issues
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - {shard-rkl}:        [SKIP][200] ([i915#1849] / [i915#4098]) -> [PASS][201] +10 similar issues
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-5/igt@kms_fbcon_fbt@fbc-suspend.html
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_invalid_mode@bad-vtotal:
>     - {shard-rkl}:        [SKIP][202] ([i915#4278]) -> [PASS][203]
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-5/igt@kms_invalid_mode@bad-vtotal.html
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@kms_invalid_mode@bad-vtotal.html
> 
>   * igt@kms_lease@lease_invalid_crtc:
>     - shard-kbl:          [DMESG-WARN][204] ([i915#165] / [i915#62] / [i915#92]) -> [PASS][205] +1 similar issue
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl3/igt@kms_lease@lease_invalid_crtc.html
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl4/igt@kms_lease@lease_invalid_crtc.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
>     - shard-apl:          [DMESG-WARN][206] ([i915#180]) -> [PASS][207] +1 similar issue
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
> 
>   * igt@kms_plane_multiple@atomic-pipe-a-tiling-none:
>     - {shard-rkl}:        [SKIP][208] ([i915#1849] / [i915#3558] / [i915#4070]) -> [PASS][209]
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html
> 
>   * igt@kms_psr@cursor_render:
>     - {shard-rkl}:        [SKIP][210] ([i915#1072]) -> [PASS][211]
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-2/igt@kms_psr@cursor_render.html
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@kms_psr@cursor_render.html
> 
>   * igt@kms_psr@psr2_cursor_blt:
>     - shard-iclb:         [SKIP][212] ([fdo#109441]) -> [PASS][213] +1 similar issue
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak-pipe-a:
>     - {shard-rkl}:        [SKIP][214] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][215]
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-rkl-2/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
> 
>   * igt@kms_vblank@invalid:
>     - shard-kbl:          [DMESG-WARN][216] ([i915#180] / [i915#62] / [i915#92]) -> [PASS][217] +2 similar issues
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl3/igt@kms_vblank@invalid.html
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl6/igt@kms_vblank@invalid.html
> 
>   * igt@perf_pmu@semaphore-busy@vcs0:
>     - {shard-dg1}:        [FAIL][218] ([i915#5043]) -> [PASS][219] +2 similar issues
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs0.html
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-tglb:         [TIMEOUT][220] ([i915#3063] / [i915#3648]) -> [FAIL][221] ([i915#232])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-tglb6/igt@gem_eio@unwedge-stress.html
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-tglb1/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@parallel-keep-submit-fence:
>     - shard-iclb:         [SKIP][222] ([i915#4525]) -> [DMESG-WARN][223] ([i915#5614])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-kbl:          [SKIP][224] ([fdo#109271] / [i915#3777] / [i915#92]) -> [SKIP][225] ([fdo#109271] / [i915#3777])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>     - shard-kbl:          [SKIP][226] ([fdo#109271] / [i915#165] / [i915#3886] / [i915#92]) -> [SKIP][227] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_chamelium@vga-hpd-for-each-pipe:
>     - shard-kbl:          [SKIP][228] ([fdo#109271] / [fdo#111827] / [i915#165] / [i915#92]) -> [SKIP][229] ([fdo#109271] / [fdo#111827]) +1 similar issue
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl3/igt@kms_chamelium@vga-hpd-for-each-pipe.html
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_cursor_legacy@pipe-d-single-bo:
>     - shard-kbl:          [SKIP][230] ([fdo#109271] / [i915#165] / [i915#533] / [i915#92]) -> [SKIP][231] ([fdo#109271] / [i915#533])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl3/igt@kms_cursor_legacy@pipe-d-single-bo.html
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl4/igt@kms_cursor_legacy@pipe-d-single-bo.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-kbl:          [SKIP][232] ([fdo#109271] / [i915#165] / [i915#92]) -> [SKIP][233] ([fdo#109271]) +19 similar issues
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl3/igt@kms_flip@2x-plain-flip.html
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl4/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-kbl:          [SKIP][234] ([fdo#109271] / [i915#92]) -> [SKIP][235] ([fdo#109271]) +9 similar issues
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-kbl3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-kbl7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@runner@aborted:
>     - shard-apl:          ([FAIL][236], [FAIL][237], [FAIL][238], [FAIL][239], [FAIL][240], [FAIL][241], [FAIL][242]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][243], [FAIL][244], [FAIL][245], [FAIL][246], [FAIL][247], [FAIL][248], [FAIL][249], [FAIL][250], [FAIL][251]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl4/igt@runner@aborted.html
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl4/igt@runner@aborted.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl8/igt@runner@aborted.html
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl1/igt@runner@aborted.html
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl4/igt@runner@aborted.html
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl6/igt@runner@aborted.html
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/shard-apl4/igt@runner@aborted.html
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl8/igt@runner@aborted.html
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl4/igt@runner@aborted.html
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl8/igt@runner@aborted.html
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl6/igt@runner@aborted.html
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl6/igt@runner@aborted.html
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl3/igt@runner@aborted.html
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl3/igt@runner@aborted.html
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl2/igt@runner@aborted.html
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/shard-apl1/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>   [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
>   [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
>   [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
>   [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
>   [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
>   [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3648]: https://gitlab.freedesktop.org/drm/intel/issues/3648
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3777]: https://gitlab.freedesktop.org/drm/intel/issues/3777
>   [i915#3788]: https://gitlab.freedesktop.org/drm/intel/issues/3788
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
>   [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
>   [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
>   [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4886]: https://gitlab.freedesktop.org/drm/intel/issues/4886
>   [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
>   [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
>   [i915#5043]: https://gitlab.freedesktop.org/drm/intel/issues/5043
>   [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
>   [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
>   [i915#5264]: https://gitlab.freedesktop.org/drm/intel/issues/5264
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5304]: https://gitlab.freedesktop.org/drm/intel/issues/5304
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
>   [i915#5498]: https://gitlab.freedesktop.org/drm/intel/issues/5498
>   [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
>   [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6439 -> IGTPW_6944
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_11512: eaa63ceada3c12c39ce37a11ec2bfb9be060841a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_6944: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/index.html
>   IGT_6439: 0c6c92745d89c8244d6af8732a0dd03f45ac2030 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6944/index.html
