Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFCB10E45B
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 09:43:37 +0000 (UTC)
Date: Wed, 16 Nov 2022 11:43:48 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Message-ID: <Y3Sw1IolfML5ynPD@platvala-desk.ger.corp.intel.com>
References: <20221115102206.2493050-1-petri.latvala@intel.com>
 <166853456062.16900.6013541658500964074@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166853456062.16900.6013541658500964074@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNV9w?=
 =?utf-8?q?m=5Ffreq=5Fmult=3A_Compare_scale_factors_as_floats?=
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

On Tue, Nov 15, 2022 at 05:49:20PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: i915_pm_freq_mult: Compare scale factors as floats
> URL   : https://patchwork.freedesktop.org/series/110907/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12382_full -> IGTPW_8103_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8103_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8103_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/index.html
> 
> Participating hosts (11 -> 8)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8103_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode.html


Lakshmi, unrelated failure here.


-- 
Petri Latvala



> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_cursor_legacy@torture-bo@all-pipes:
>     - {shard-rkl}:        [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-1/igt@kms_cursor_legacy@torture-bo@all-pipes.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-5/igt@kms_cursor_legacy@torture-bo@all-pipes.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8103_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#5327])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
>     - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#5325])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb8/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
>     - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099]) +1 similar issue
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-snb6/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-snb:          NOTRUN -> [FAIL][7] ([i915#3354])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-snb5/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@parallel-contexts:
>     - shard-iclb:         NOTRUN -> [SKIP][8] ([i915#4525])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2846])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk2/igt@gem_exec_fair@basic-deadline.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk1/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#4613]) +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb8/igt@gem_lmem_swapping@parallel-random-engines.html
>     - shard-glk:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#4613])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk3/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
>     - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#4613]) +1 similar issue
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#4270]) +1 similar issue
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#4270]) +1 similar issue
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#3297])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb1/igt@gem_userptr_blits@unsync-unmap-cycles.html
>     - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#3297])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#2856]) +1 similar issue
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb1/igt@gen9_exec_parse@bb-start-far.html
>     - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#2527] / [i915#2856]) +1 similar issue
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb2/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-tglb:         NOTRUN -> [FAIL][23] ([i915#3989] / [i915#454])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109506] / [i915#2411])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
>     - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109293] / [fdo#109506])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-tglb:         [PASS][26] -> [DMESG-WARN][27] ([i915#5591])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb5/igt@i915_selftest@live@hangcheck.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb5/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl3/igt@i915_suspend@fence-restore-untiled.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl1/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#3826])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>     - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#3826])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#5286])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>     - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#5286])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>     - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#110723])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111615])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109278]) +3 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb1/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html
>     - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#3689] / [i915#6095])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
>     - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#6095])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3689]) +2 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb5/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111615] / [i915#3689]) +4 similar issues
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb1/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html
> 
>   * igt@kms_chamelium@vga-hpd-with-enabled-mode:
>     - shard-snb:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-snb5/igt@kms_chamelium@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_color_chamelium@ctm-max:
>     - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb7/igt@kms_color_chamelium@ctm-max.html
>     - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +2 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk5/igt@kms_color_chamelium@ctm-max.html
> 
>   * igt@kms_color_chamelium@ctm-negative:
>     - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb6/igt@kms_color_chamelium@ctm-negative.html
>     - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl6/igt@kms_color_chamelium@ctm-negative.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#7118])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb5/igt@kms_content_protection@atomic-dpms.html
>     - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#7118])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb7/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:
>     - shard-apl:          NOTRUN -> [TIMEOUT][48] ([i915#7173])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#3359])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>     - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#3359])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>     - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#2346])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
> 
>   * igt@kms_dsc@basic-dsc:
>     - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#3555]) +2 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb1/igt@kms_dsc@basic-dsc.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109274]) +2 similar issues
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb6/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][56] ([i915#2587] / [i915#2672]) +3 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][57] ([i915#2672]) +6 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#2587] / [i915#2672])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>     - shard-snb:          [PASS][59] -> [SKIP][60] ([fdo#109271])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:
>     - shard-glk:          [PASS][61] -> [FAIL][62] ([i915#2546])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-iclb:         [PASS][63] -> [FAIL][64] ([i915#2546])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271]) +41 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>     - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#6497]) +2 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109280]) +13 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
>     - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109280] / [fdo#111825]) +13 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglb:         [PASS][69] -> [SKIP][70] ([i915#433])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-edp-1:
>     - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#5176]) +2 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb6/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-dp-1:
>     - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271]) +47 similar issues
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl6/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-dp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-edp-1:
>     - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#5176]) +3 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb8/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1:
>     - shard-iclb:         [PASS][74] -> [SKIP][75] ([i915#5176]) +2 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb8/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
>     - shard-iclb:         [PASS][76] -> [SKIP][77] ([i915#5235]) +2 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>     - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#2920])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>     - shard-glk:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>     - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#658])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb8/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-iclb:         [PASS][83] -> [SKIP][84] ([fdo#109441]) +2 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-iclb:         [PASS][85] -> [SKIP][86] ([i915#5519]) +1 similar issue
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-snb:          NOTRUN -> [SKIP][87] ([fdo#109271]) +164 similar issues
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-snb4/igt@kms_tv_load_detect@load-detect.html
>     - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109309])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb1/igt@kms_tv_load_detect@load-detect.html
>     - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109309])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb6/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#2437])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb2/igt@kms_writeback@writeback-fb-id.html
>     - shard-glk:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2437])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk9/igt@kms_writeback@writeback-fb-id.html
>     - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#2437])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb8/igt@kms_writeback@writeback-fb-id.html
>     - shard-apl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#2437])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl7/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@sysfs_clients@pidname:
>     - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2994])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl1/igt@sysfs_clients@pidname.html
>     - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#2994])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb6/igt@sysfs_clients@pidname.html
>     - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#2994])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk9/igt@sysfs_clients@pidname.html
>     - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#2994])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb8/igt@sysfs_clients@pidname.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@unaligned-read:
>     - {shard-rkl}:        [SKIP][98] ([i915#2582]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-1/igt@fbdev@unaligned-read.html
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-5/igt@fbdev@unaligned-read.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglb:         [FAIL][100] ([i915#6268]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb6/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - {shard-rkl}:        [FAIL][102] ([fdo#103375]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-4/igt@gem_eio@in-flight-suspend.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-2/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_eio@reset-stress:
>     - {shard-dg1}:        [FAIL][104] ([i915#5784]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-dg1-18/igt@gem_eio@reset-stress.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-dg1-12/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@parallel:
>     - shard-iclb:         [SKIP][106] ([i915#4525]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb3/igt@gem_exec_balancer@parallel.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@gem_exec_balancer@parallel.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][108] ([i915#2842]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fence@basic-busy@bcs0:
>     - {shard-rkl}:        [SKIP][110] ([i915#6251]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-5/igt@gem_exec_fence@basic-busy@bcs0.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-6/igt@gem_exec_fence@basic-busy@bcs0.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>     - {shard-rkl}:        [SKIP][112] ([i915#3281]) -> [PASS][113] +4 similar issues
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
> 
>   * igt@gem_mmap_gtt@coherency:
>     - {shard-rkl}:        [SKIP][114] ([fdo#111656]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-4/igt@gem_mmap_gtt@coherency.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-5/igt@gem_mmap_gtt@coherency.html
> 
>   * igt@gem_pwrite_snooped:
>     - {shard-rkl}:        [SKIP][116] ([i915#3282]) -> [PASS][117] +1 similar issue
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-4/igt@gem_pwrite_snooped.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-5/igt@gem_pwrite_snooped.html
> 
>   * igt@gen9_exec_parse@bb-start-out:
>     - {shard-rkl}:        [SKIP][118] ([i915#2527]) -> [PASS][119] +1 similar issue
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html
> 
>   * igt@i915_pm_backlight@fade_with_suspend:
>     - {shard-rkl}:        [SKIP][120] ([i915#3012]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-5/igt@i915_pm_backlight@fade_with_suspend.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-6/igt@i915_pm_backlight@fade_with_suspend.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-apl:          [SKIP][122] ([fdo#109271]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl2/igt@i915_pm_dc@dc9-dpms.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>     - {shard-dg1}:        [FAIL][124] ([i915#3591]) -> [PASS][125] +1 similar issue
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
> 
>   * igt@i915_pm_rpm@pm-tiling:
>     - {shard-rkl}:        [SKIP][126] ([fdo#109308]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-1/igt@i915_pm_rpm@pm-tiling.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-snb:          [DMESG-WARN][128] ([i915#4528]) -> [PASS][129] +1 similar issue
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-snb7/igt@i915_suspend@basic-s2idle-without-i915.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-snb6/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-iclb:         [SKIP][130] -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb5/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
>     - {shard-rkl}:        [SKIP][132] ([i915#1845] / [i915#4098]) -> [PASS][133] +16 similar issues
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-glk:          [FAIL][134] ([i915#5138]) -> [PASS][135] +1 similar issue
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
>     - shard-glk:          [FAIL][136] ([i915#2346]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@single-move@all-pipes:
>     - {shard-rkl}:        [INCOMPLETE][138] -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-4/igt@kms_cursor_legacy@single-move@all-pipes.html
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-2/igt@kms_cursor_legacy@single-move@all-pipes.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
>     - {shard-rkl}:        [SKIP][140] ([i915#1849] / [i915#4098]) -> [PASS][141] +10 similar issues
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
>     - {shard-rkl}:        [SKIP][142] ([i915#3558]) -> [PASS][143] +1 similar issue
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
>     - shard-iclb:         [SKIP][144] ([i915#5235]) -> [PASS][145] +2 similar issues
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
> 
>   * igt@kms_properties@crtc-properties-legacy:
>     - {shard-rkl}:        [SKIP][146] ([i915#1849]) -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html
> 
>   * igt@kms_psr@primary_blt:
>     - {shard-rkl}:        [SKIP][148] ([i915#1072]) -> [PASS][149]
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-rkl-1/igt@kms_psr@primary_blt.html
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-rkl-6/igt@kms_psr@primary_blt.html
> 
>   * igt@kms_psr@psr2_no_drrs:
>     - shard-iclb:         [SKIP][150] ([fdo#109441]) -> [PASS][151] +1 similar issue
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-tglb:         [SKIP][152] ([i915#5519]) -> [PASS][153]
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-iclb:         [FAIL][154] ([i915#6117]) -> [SKIP][155] ([i915#4525])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-tglb:         [WARN][156] ([i915#2658]) -> [INCOMPLETE][157] ([i915#7248]) +1 similar issue
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-tglb5/igt@gem_pread@exhaustion.html
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-tglb8/igt@gem_pread@exhaustion.html
>     - shard-glk:          [WARN][158] ([i915#2658]) -> [INCOMPLETE][159] ([i915#7248]) +1 similar issue
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-glk1/igt@gem_pread@exhaustion.html
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-glk2/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-apl:          [WARN][160] ([i915#2658]) -> [INCOMPLETE][161] ([i915#7248])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl6/igt@gem_pwrite@basic-exhaustion.html
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl8/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [FAIL][162] ([i915#4767]) -> [INCOMPLETE][163] ([i915#180])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
>     - shard-apl:          [DMESG-FAIL][164] ([IGT#6]) -> [FAIL][165] ([i915#4573]) +1 similar issue
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl8/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-iclb:         [SKIP][166] ([i915#2920]) -> [SKIP][167] ([i915#658])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area:
>     - shard-iclb:         [SKIP][168] ([fdo#111068] / [i915#658]) -> [SKIP][169] ([i915#2920])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-iclb:         [SKIP][170] ([i915#658]) -> [SKIP][171] ([i915#2920])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@runner@aborted:
>     - shard-apl:          ([FAIL][172], [FAIL][173]) ([i915#3002] / [i915#4312]) -> ([FAIL][174], [FAIL][175], [FAIL][176], [FAIL][177]) ([i915#180] / [i915#3002] / [i915#4312])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl1/igt@runner@aborted.html
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12382/shard-apl8/igt@runner@aborted.html
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl7/igt@runner@aborted.html
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl3/igt@runner@aborted.html
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl6/igt@runner@aborted.html
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/shard-apl1/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
>   [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3354]: https://gitlab.freedesktop.org/drm/intel/issues/3354
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
>   [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
>   [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#7248]: https://gitlab.freedesktop.org/drm/intel/issues/7248
>   [i915#7468]: https://gitlab.freedesktop.org/drm/intel/issues/7468
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7057 -> IGTPW_8103
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_12382: cb74864693414b221b3601572e75449558126e8b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8103: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/index.html
>   IGT_7057: e2138d48c2c506816868c16cf3ba64f81bdead41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8103/index.html
