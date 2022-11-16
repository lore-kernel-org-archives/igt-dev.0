Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AB210E48A
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 10:32:53 +0000 (UTC)
Date: Wed, 16 Nov 2022 12:33:05 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Message-ID: <Y3S8YTuMq9M7a1cl@platvala-desk.ger.corp.intel.com>
References: <20221115115002.2493594-1-petri.latvala@intel.com>
 <166853561857.16900.8615904035661705773@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166853561857.16900.8615904035661705773@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Use_=27abort=27_as_result_if_a_test_caused_an_abort?=
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

On Tue, Nov 15, 2022 at 06:06:58PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Use 'abort' as result if a test caused an abort
> URL   : https://patchwork.freedesktop.org/series/110914/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12382_full -> IGTPW_8105_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8105_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8105_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/index.html
> 
> Participating hosts (11 -> 8)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8105_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb7/igt@i915_suspend@sysfs-reader.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb7/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-iclb:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 


Lakshmi, unrelated failures.

igt@i915_suspend@sysfs-reader got one of those "suspends, doesn't wake
up" issues.

igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode
is a CRC mismatch, not caused by this patch.

More below:



>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - {shard-dg1}:        NOTRUN -> [{ABORT}][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html

Child refuses to die.

<4> [273.506261] i915 0000:03:00.0: drm_WARN_ON(s_en != 0x1)


> 
>   * igt@gem_create@create-massive:
>     - shard-snb:          [DMESG-WARN][6] ([i915#4991]) -> [{ABORT}][7] +1 similar issue
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-snb4/igt@gem_create@create-massive.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-snb2/igt@gem_create@create-massive.html
>     - {shard-dg1}:        [DMESG-WARN][8] ([i915#4991]) -> [{ABORT}][9] +1 similar issue
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-dg1-15/igt@gem_create@create-massive.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-dg1-12/igt@gem_create@create-massive.html
>     - shard-apl:          [DMESG-WARN][10] ([i915#4991]) -> [{ABORT}][11] +1 similar issue
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl8/igt@gem_create@create-massive.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-apl3/igt@gem_create@create-massive.html
>     - shard-tglb:         [DMESG-WARN][12] ([i915#4991]) -> [{ABORT}][13] +1 similar issue
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb2/igt@gem_create@create-massive.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb6/igt@gem_create@create-massive.html
>     - shard-glk:          [DMESG-WARN][14] ([i915#4991]) -> [{ABORT}][15] +1 similar issue
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk7/igt@gem_create@create-massive.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk8/igt@gem_create@create-massive.html
> 
>   * igt@gem_userptr_blits@input-checking:
>     - shard-iclb:         [DMESG-WARN][16] ([i915#4991]) -> [{ABORT}][17] +1 similar issue
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb7/igt@gem_userptr_blits@input-checking.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb6/igt@gem_userptr_blits@input-checking.html
>     - {shard-rkl}:        [DMESG-WARN][18] ([i915#4991]) -> [{ABORT}][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-4/igt@gem_userptr_blits@input-checking.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-rkl-5/igt@gem_userptr_blits@input-checking.html

I didn't check all of these but they look like they should match
i915#4991 issue with just a test result addition.




>   * igt@gem_workarounds@suspend-resume:
>     - shard-apl:          [PASS][20] -> [{ABORT}][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl3/igt@gem_workarounds@suspend-resume.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-apl8/igt@gem_workarounds@suspend-resume.html

Hard to compare, the previous result is a pass.

<4> [124.026367] pipe state doesn't match!
<4> [124.026492] WARNING: CPU: 3 PID: 1147 at drivers/gpu/drm/i915/display/intel_modeset_verify.c:219 intel_modeset_verify_crtc+0x348/0x390 [i915]

Is there an existing issue with that signature?

> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          NOTRUN -> [{ABORT}][22]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk7/igt@gen9_exec_parse@allowed-single.html

<4> [206.300311] i915 0000:00:02.0: Unclaimed write to register 0x220a8
<4> [206.300351] WARNING: CPU: 1 PID: 1031 at drivers/gpu/drm/i915/intel_uncore.c:1905 __unclaimed_reg_debug+0x68/0x80 [i915]


> 
>   * igt@perf_pmu@module-unload:
>     - shard-snb:          [PASS][23] -> [{ABORT}][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-snb7/igt@perf_pmu@module-unload.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-snb6/igt@perf_pmu@module-unload.html

<4> [254.073717] i915 0000:00:02.0: drm_WARN_ON(dev_priv->mm.shrink_count)



-- 
Petri Latvala



> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8105_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#5327])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
>     - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#5325])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
>     - shard-snb:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#1099]) +1 similar issue
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-snb6/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-snb:          NOTRUN -> [FAIL][28] ([i915#3354])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-snb2/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@parallel-contexts:
>     - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#4525])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#2846])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk2/igt@gem_exec_fair@basic-deadline.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk2/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#2842])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
>     - shard-tglb:         [PASS][34] -> [FAIL][35] ([i915#2842])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#4613]) +1 similar issue
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb6/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-apl7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
>     - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#4613]) +1 similar issue
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
>     - shard-glk:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#4270]) +1 similar issue
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#4270]) +1 similar issue
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb7/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_softpin@evict-single-offset:
>     - shard-tglb:         [PASS][42] -> [FAIL][43] ([i915#4171])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb6/igt@gem_softpin@evict-single-offset.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb8/igt@gem_softpin@evict-single-offset.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3297])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb5/igt@gem_userptr_blits@unsync-unmap-cycles.html
>     - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#3297])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb2/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#2856]) +1 similar issue
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb1/igt@gen9_exec_parse@bb-start-far.html
>     - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#2527] / [i915#2856]) +1 similar issue
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb8/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-tglb:         NOTRUN -> [FAIL][48] ([i915#3989] / [i915#454])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109506] / [i915#2411])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
>     - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109293] / [fdo#109506])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3826])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>     - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#3826])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#5286]) +1 similar issue
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
>     - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#5286]) +1 similar issue
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb7/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-0:
>     - shard-glk:          NOTRUN -> [DMESG-FAIL][55] ([i915#118] / [i915#5138])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>     - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#110723])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
>     - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111615])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278]) +4 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb1/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html
>     - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3689] / [i915#6095])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
>     - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#6095])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb8/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3689]) +4 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#111615] / [i915#3689]) +4 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html
> 
>   * igt@kms_chamelium@hdmi-crc-multiple:
>     - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk8/igt@kms_chamelium@hdmi-crc-multiple.html
> 
>   * igt@kms_chamelium@vga-hpd-with-enabled-mode:
>     - shard-snb:          NOTRUN -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-snb6/igt@kms_chamelium@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_color_chamelium@ctm-max:
>     - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb3/igt@kms_color_chamelium@ctm-max.html
> 
>   * igt@kms_color_chamelium@ctm-negative:
>     - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb2/igt@kms_color_chamelium@ctm-negative.html
>     - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +2 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-apl6/igt@kms_color_chamelium@ctm-negative.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#7118])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb8/igt@kms_content_protection@atomic-dpms.html
>     - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#7118])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb1/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:
>     - shard-apl:          NOTRUN -> [TIMEOUT][70] ([i915#7173])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-apl8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-max-size:
>     - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#3555]) +2 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb1/igt@kms_cursor_crc@cursor-onscreen-max-size.html
>     - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#3555])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb7/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3359])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>     - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#3359])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109274]) +2 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb1/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#2587] / [i915#2672]) +4 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#2672]) +4 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#2587] / [i915#2672])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
>     - shard-glk:          [PASS][80] -> [FAIL][81] ([i915#2546])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271]) +44 similar issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>     - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#6497]) +2 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109280]) +12 similar issues
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
>     - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109280] / [fdo#111825]) +12 similar issues
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-edp-1:
>     - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#5176]) +2 similar issues
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-dp-1:
>     - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271]) +52 similar issues
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-apl8/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-dp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-edp-1:
>     - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#5176]) +3 similar issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb3/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-edp-1.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#658])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-apl3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>     - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#2920])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>     - shard-glk:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#658])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>     - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#658])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-iclb:         [PASS][93] -> [SKIP][94] ([fdo#109441]) +1 similar issue
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-snb:          NOTRUN -> [SKIP][95] ([fdo#109271]) +166 similar issues
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-snb5/igt@kms_tv_load_detect@load-detect.html
>     - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#109309])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb1/igt@kms_tv_load_detect@load-detect.html
>     - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109309])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb3/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2437])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb2/igt@kms_writeback@writeback-fb-id.html
>     - shard-glk:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#2437])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk3/igt@kms_writeback@writeback-fb-id.html
>     - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#2437])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb7/igt@kms_writeback@writeback-fb-id.html
>     - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#2437])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-apl6/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@sysfs_clients@pidname:
>     - shard-apl:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#2994])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-apl8/igt@sysfs_clients@pidname.html
>     - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2994])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb7/igt@sysfs_clients@pidname.html
>     - shard-glk:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#2994])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk2/igt@sysfs_clients@pidname.html
>     - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#2994])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb8/igt@sysfs_clients@pidname.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@info:
>     - {shard-rkl}:        [SKIP][106] ([i915#2582]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-5/igt@fbdev@info.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-rkl-6/igt@fbdev@info.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglb:         [FAIL][108] ([i915#6268]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - {shard-dg1}:        [FAIL][110] ([i915#5784]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-dg1-19/igt@gem_eio@unwedge-stress.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-dg1-12/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@parallel-bb-first:
>     - shard-iclb:         [SKIP][112] ([i915#4525]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][114] ([i915#2842]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - {shard-rkl}:        [FAIL][116] ([i915#2842]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_readwrite@beyond-eob:
>     - {shard-rkl}:        [SKIP][118] ([i915#3282]) -> [PASS][119] +2 similar issues
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-4/igt@gem_readwrite@beyond-eob.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-rkl-5/igt@gem_readwrite@beyond-eob.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - {shard-rkl}:        [SKIP][120] ([i915#3281]) -> [PASS][121] +4 similar issues
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - {shard-rkl}:        [SKIP][122] ([i915#2527]) -> [PASS][123] +1 similar issue
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-1/igt@gen9_exec_parse@valid-registers.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_pm_rpm@cursor-dpms:
>     - {shard-rkl}:        [SKIP][124] ([i915#1849]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-2/igt@i915_pm_rpm@cursor-dpms.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-rkl-6/igt@i915_pm_rpm@cursor-dpms.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-snb:          [DMESG-WARN][126] ([i915#4528]) -> [PASS][127] +1 similar issue
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-snb7/igt@i915_suspend@basic-s2idle-without-i915.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-snb5/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-iclb:         [SKIP][128] -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb5/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb1/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-glk:          [FAIL][130] ([i915#5138]) -> [PASS][131] +1 similar issue
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs:
>     - {shard-rkl}:        [SKIP][132] ([i915#1845] / [i915#4098]) -> [PASS][133] +14 similar issues
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-rkl-6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
>     - shard-glk:          [FAIL][134] ([i915#2346]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
>     - {shard-rkl}:        [SKIP][136] ([i915#1849] / [i915#4098]) -> [PASS][137] +10 similar issues
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
> 
>   * igt@kms_plane_lowres@tiling-yf@pipe-b-hdmi-a-2:
>     - shard-glk:          [FAIL][138] ([i915#7307]) -> [PASS][139] +2 similar issues
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk1/igt@kms_plane_lowres@tiling-yf@pipe-b-hdmi-a-2.html
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk6/igt@kms_plane_lowres@tiling-yf@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_psr@psr2_no_drrs:
>     - shard-iclb:         [SKIP][140] ([fdo#109441]) -> [PASS][141] +1 similar issue
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - {shard-rkl}:        [SKIP][142] ([i915#5461]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@perf@mi-rpc:
>     - {shard-rkl}:        [SKIP][144] ([i915#2434]) -> [PASS][145]
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-1/igt@perf@mi-rpc.html
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-rkl-5/igt@perf@mi-rpc.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_fair@basic-pace@bcs0:
>     - shard-tglb:         [FAIL][146] ([i915#2842]) -> [FAIL][147] ([i915#2876])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb2/igt@gem_exec_fair@basic-pace@bcs0.html
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-tglb:         [WARN][148] ([i915#2658]) -> [INCOMPLETE][149] ([i915#7248]) +1 similar issue
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb5/igt@gem_pread@exhaustion.html
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-tglb6/igt@gem_pread@exhaustion.html
>     - shard-glk:          [WARN][150] ([i915#2658]) -> [INCOMPLETE][151] ([i915#7248]) +1 similar issue
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk1/igt@gem_pread@exhaustion.html
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-glk9/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-apl:          [WARN][152] ([i915#2658]) -> [INCOMPLETE][153] ([i915#7248])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl6/igt@gem_pwrite@basic-exhaustion.html
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-apl2/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-iclb:         [SKIP][154] ([i915#658]) -> [SKIP][155] ([i915#2920])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-iclb:         [SKIP][156] ([i915#2920]) -> [SKIP][157] ([fdo#111068] / [i915#658])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-iclb:         [SKIP][158] ([i915#2920]) -> [SKIP][159] ([i915#658])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-iclb:         [SKIP][160] ([fdo#111068] / [i915#658]) -> [SKIP][161] ([i915#2920])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
>   [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
>   [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3354]: https://gitlab.freedesktop.org/drm/intel/issues/3354
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
>   [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
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
>   [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
>   [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
>   [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
>   [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
>   [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#7248]: https://gitlab.freedesktop.org/drm/intel/issues/7248
>   [i915#7307]: https://gitlab.freedesktop.org/drm/intel/issues/7307
>   [i915#7468]: https://gitlab.freedesktop.org/drm/intel/issues/7468
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7057 -> IGTPW_8105
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_12382: cb74864693414b221b3601572e75449558126e8b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8105: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/index.html
>   IGT_7057: e2138d48c2c506816868c16cf3ba64f81bdead41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8105/index.html
