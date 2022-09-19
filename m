Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062D210E5E2
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 09:16:07 +0000 (UTC)
Date: Mon, 19 Sep 2022 11:16:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YygzUj71DNXeBjoY@kamilkon-desk1>
References: <20220916150028.123582-1-kamil.konieczny@linux.intel.com>
 <166336647235.18047.4451778765896792822@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166336647235.18047.4451778765896792822@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4IHNw?=
 =?utf-8?q?inner_48b_and_extend_gem=5Fcreate?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

On 2022-09-16 at 22:14:32 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix spinner 48b and extend gem_create
> URL   : https://patchwork.freedesktop.org/series/108662/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12146_full -> IGTPW_7791_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7791_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7791_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/index.html
> 
> Participating hosts (10 -> 8)
> ------------------------------
> 
>   Additional (1): shard-rkl 
>   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7791_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
>     - shard-iclb:         [PASS][2] -> [FAIL][3] +2 similar issues
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-iclb6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html

These are unrelated to patchset.

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_12146_full and IGTPW_7791_full:
> 
> ### New IGT tests (4) ###
> 
>   * igt@gem_create@busy-create@smem0:
>     - Statuses : 6 pass(s)
>     - Exec time: [32.24, 32.25] s
> 
>   * igt@gem_create@create-clear@smem0:
>     - Statuses : 6 pass(s)
>     - Exec time: [32.44, 33.33] s
> 
>   * igt@gem_create@hog-create:
>     - Statuses :
>     - Exec time: [None] s

Here I am not sure if this is ok ?

Regards,
Kamil

> 
>   * igt@gem_create@hog-create@smem0:
>     - Statuses : 5 pass(s)
>     - Exec time: [32.24, 32.26] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7791_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#5327])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb8/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ctx_persistence@process:
>     - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-snb4/igt@gem_ctx_persistence@process.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-iclb:         NOTRUN -> [FAIL][6] ([i915#2842]) +5 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb6/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][7] ([i915#2842])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>     - shard-glk:          NOTRUN -> [FAIL][8] ([i915#2842])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vcs0:
>     - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2842]) +2 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-glk1/igt@gem_exec_fair@basic-pace@vcs0.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-iclb:         NOTRUN -> [SKIP][11] ([fdo#112283])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb2/igt@gem_exec_params@secure-non-root.html
>     - shard-tglb:         NOTRUN -> [SKIP][12] ([fdo#112283])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb7/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gem_lmem_swapping@massive-random:
>     - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#4613]) +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb4/igt@gem_lmem_swapping@massive-random.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#4613]) +1 similar issue
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb5/igt@gem_lmem_swapping@random.html
>     - shard-glk:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk8/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl3/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#4270]) +2 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb2/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#4270]) +2 similar issues
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
>     - shard-apl:          NOTRUN -> [SKIP][19] ([fdo#109271]) +152 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#768])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>   * igt@gem_userptr_blits@access-control:
>     - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#3297])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb1/igt@gem_userptr_blits@access-control.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109290])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb2/igt@gem_userptr_blits@coherency-sync.html
>     - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#110542])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb2/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#3297])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb1/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen3_render_mixed_blits:
>     - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109289])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb2/igt@gen3_render_mixed_blits.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#2527] / [i915#2856]) +1 similar issue
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb6/igt@gen9_exec_parse@basic-rejected.html
>     - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#2856]) +1 similar issue
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb6/igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#6412])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb6/igt@i915_module_load@resize-bar.html
>     - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#6412])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb7/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#658]) +2 similar issues
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl6/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#3989] / [i915#454])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-apl:          [PASS][33] -> [SKIP][34] ([fdo#109271])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +2 similar issues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#1769] / [i915#3555])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>     - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#1769] / [i915#3555])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#5286]) +2 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#5286]) +3 similar issues
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-0:
>     - shard-glk:          [PASS][41] -> [DMESG-FAIL][42] ([i915#118] / [i915#1888])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-glk1/igt@kms_big_fb@linear-16bpp-rotate-0.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk9/igt@kms_big_fb@linear-16bpp-rotate-0.html
>     - shard-iclb:         [PASS][43] -> [DMESG-FAIL][44] ([i915#1888])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-0.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#1888])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#110725] / [fdo#111614]) +1 similar issue
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
>     - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111614])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#110723]) +1 similar issue
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111615]) +3 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_joiner@2x-modeset:
>     - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#2705])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb5/igt@kms_big_joiner@2x-modeset.html
>     - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#2705])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb3/igt@kms_big_joiner@2x-modeset.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>     - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#3886]) +5 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#3689] / [i915#6095])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb5/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [i915#3886]) +6 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb6/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html
>     - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3689] / [i915#3886])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#3886]) +4 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#6095])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb8/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3689]) +3 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_chamelium@dp-hpd-after-suspend:
>     - shard-snb:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +2 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-snb2/igt@kms_chamelium@dp-hpd-after-suspend.html
> 
>   * igt@kms_chamelium@hdmi-cmp-planar-formats:
>     - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109284] / [fdo#111827]) +5 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb5/igt@kms_chamelium@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_chamelium@hdmi-crc-fast:
>     - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +7 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk6/igt@kms_chamelium@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium@vga-hpd-without-ddc:
>     - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl7/igt@kms_chamelium@vga-hpd-without-ddc.html
> 
>   * igt@kms_color_chamelium@ctm-max:
>     - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109284] / [fdo#111827]) +2 similar issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb6/igt@kms_color_chamelium@ctm-max.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-iclb:         NOTRUN -> [SKIP][65] ([i915#3359])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb7/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109274]) +6 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>     - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109274] / [fdo#111825])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          NOTRUN -> [INCOMPLETE][68] ([i915#180] / [i915#1982] / [i915#4939] / [i915#6598])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][69] -> [FAIL][70] ([i915#2122]) +1 similar issue
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb1/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#3555]) +2 similar issues
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#2672]) +6 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#2587] / [i915#2672]) +2 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#2672] / [i915#3555]) +1 similar issue
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
>     - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109280]) +21 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
>     - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#6497]) +5 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
>     - shard-snb:          NOTRUN -> [SKIP][78] ([fdo#109271]) +82 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
>     - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109280] / [fdo#111825]) +12 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
>     - shard-apl:          NOTRUN -> [FAIL][80] ([fdo#108145] / [i915#265]) +1 similar issue
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
>     - shard-apl:          NOTRUN -> [FAIL][81] ([i915#265])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#112054] / [i915#5288])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb1/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
>     - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#3536]) +2 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb1/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1:
>     - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#5176]) +2 similar issues
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271]) +81 similar issues
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#658]) +1 similar issue
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>     - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#2920])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>     - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#2920])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#111068] / [i915#658])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@psr2_sprite_mmap_gtt:
>     - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109441])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
>     - shard-tglb:         NOTRUN -> [FAIL][91] ([i915#132] / [i915#3467])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb5/igt@kms_psr@psr2_sprite_mmap_gtt.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-iclb:         [PASS][92] -> [SKIP][93] ([fdo#109441]) +1 similar issue
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#5289])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_vblank@pipe-d-wait-idle-hang:
>     - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109278]) +11 similar issues
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb8/igt@kms_vblank@pipe-d-wait-idle-hang.html
> 
>   * igt@prime_nv_api@i915_nv_double_export:
>     - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109291]) +2 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb2/igt@prime_nv_api@i915_nv_double_export.html
> 
>   * igt@prime_nv_test@i915_nv_sharing:
>     - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109291]) +1 similar issue
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb1/igt@prime_nv_test@i915_nv_sharing.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109295])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb7/igt@prime_vgem@fence-read-hang.html
>     - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109295])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb8/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@sysfs_clients@fair-1:
>     - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#2994]) +1 similar issue
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb7/igt@sysfs_clients@fair-1.html
> 
>   * igt@sysfs_clients@sema-25:
>     - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#2994]) +2 similar issues
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl8/igt@sysfs_clients@sema-25.html
>     - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#2994])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb5/igt@sysfs_clients@sema-25.html
>     - shard-glk:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#2994])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk8/igt@sysfs_clients@sema-25.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_balancer@parallel:
>     - shard-iclb:         [SKIP][104] ([i915#4525]) -> [PASS][105] +1 similar issue
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-iclb7/igt@gem_exec_balancer@parallel.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb4/igt@gem_exec_balancer@parallel.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-glk:          [FAIL][106] ([i915#2842]) -> [PASS][107] +1 similar issue
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglb:         [FAIL][108] ([i915#2842]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-apl:          [DMESG-WARN][110] ([i915#180]) -> [PASS][111] +2 similar issues
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl2/igt@gem_workarounds@suspend-resume-context.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@i915_pm_dc@dc5-psr:
>     - shard-tglb:         [FAIL][112] ([i915#3989]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-tglb7/igt@i915_pm_dc@dc5-psr.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglb7/igt@i915_pm_dc@dc5-psr.html
> 
>   * igt@i915_pm_rps@engine-order:
>     - shard-apl:          [FAIL][114] ([i915#6537]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl8/igt@i915_pm_rps@engine-order.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl3/igt@i915_pm_rps@engine-order.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-iclb:         [DMESG-WARN][116] ([i915#2867]) -> [PASS][117] +4 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-iclb8/igt@i915_selftest@live@hangcheck.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb8/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
>     - {shard-tglu}:       [FAIL][118] ([i915#1888]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip@legacy:
>     - shard-iclb:         [FAIL][120] ([i915#5072]) -> [PASS][121] +1 similar issue
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@legacy.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>     - shard-glk:          [FAIL][122] ([i915#2346]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2:
>     - shard-glk:          [FAIL][124] ([i915#1036] / [i915#1888]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_psr@psr2_primary_page_flip:
>     - shard-iclb:         [SKIP][126] ([fdo#109441]) -> [PASS][127] +1 similar issue
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
> 
>   * igt@kms_vblank@pipe-b-accuracy-idle:
>     - shard-glk:          [FAIL][128] ([i915#43]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-glk6/igt@kms_vblank@pipe-b-accuracy-idle.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-glk3/igt@kms_vblank@pipe-b-accuracy-idle.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-iclb:         [SKIP][130] ([i915#658]) -> [SKIP][131] ([i915#588])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-iclb:         [SKIP][132] ([i915#2920]) -> [SKIP][133] ([i915#658])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-iclb:         [FAIL][134] ([i915#5939]) -> [SKIP][135] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-iclb6/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@runner@aborted:
>     - shard-apl:          ([FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599]) -> ([FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl1/igt@runner@aborted.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl6/igt@runner@aborted.html
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl6/igt@runner@aborted.html
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl6/igt@runner@aborted.html
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl2/igt@runner@aborted.html
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl8/igt@runner@aborted.html
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl7/igt@runner@aborted.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-apl8/igt@runner@aborted.html
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl7/igt@runner@aborted.html
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl7/igt@runner@aborted.html
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl2/igt@runner@aborted.html
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl2/igt@runner@aborted.html
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl6/igt@runner@aborted.html
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl2/igt@runner@aborted.html
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/shard-apl1/igt@runner@aborted.html
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
>   [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1036]: https://gitlab.freedesktop.org/drm/intel/issues/1036
>   [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
>   [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
>   [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
>   [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
>   [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
>   [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
>   [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
>   [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
>   [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
>   [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
>   [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
>   [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
>   [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
>   [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6656 -> IGTPW_7791
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_12146: afdeadb1830054a87b9e2d765caa2f197321ca0c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_7791: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/index.html
>   IGT_6656: 24100c4e181c50e3678aeca9c641b8a43555ad73 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7791/index.html
