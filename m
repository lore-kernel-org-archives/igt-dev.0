Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165B710E00F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Feb 2023 20:11:24 +0000 (UTC)
Date: Tue, 28 Feb 2023 21:11:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230228201119.n3khwcfo6e4aruc6@kamilkon-desk1>
References: <20230227142748.28811-1-kamil.konieczny@linux.intel.com>
 <167753715975.26341.18173197618857656375@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <167753715975.26341.18173197618857656375@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_check_disk_limit_at_dumping_kmsg_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

these are unrelated to change in runner.

Regards,
Kamil

On 2023-02-27 at 22:32:39 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: check disk limit at dumping kmsg (rev2)
> URL   : https://patchwork.freedesktop.org/series/114353/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12786_full -> IGTPW_8532_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8532_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8532_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8532_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_fence@syncobj-timeline-export:
>     - shard-tglu-10:      NOTRUN -> [ABORT][1] +2 similar issues
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@gem_exec_fence@syncobj-timeline-export.html
> 
>   * igt@gem_exec_schedule@pi-common@rcs0:
>     - shard-glk:          NOTRUN -> [ABORT][2] +14 similar issues
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk9/igt@gem_exec_schedule@pi-common@rcs0.html
> 
>   * igt@gem_ringfill@engines-basic@vecs0:
>     - shard-glk:          NOTRUN -> [DMESG-WARN][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@gem_ringfill@engines-basic@vecs0.html
> 
>   * igt@prime_vgem@fence-wait@rcs0:
>     - shard-apl:          NOTRUN -> [ABORT][4] +11 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl1/igt@prime_vgem@fence-wait@rcs0.html
>     - shard-snb:          NOTRUN -> [ABORT][5] +6 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@prime_vgem@fence-wait@rcs0.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@gem_exec_fence@long-history:
>     - {shard-tglu}:       NOTRUN -> [ABORT][6] +6 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-5/igt@gem_exec_fence@long-history.html
> 
>   * igt@gem_exec_fence@submit:
>     - {shard-dg1}:        NOTRUN -> [ABORT][7] +11 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-15/igt@gem_exec_fence@submit.html
> 
>   * igt@prime_vgem@wait@rcs0:
>     - {shard-rkl}:        NOTRUN -> [ABORT][8] +10 similar issues
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-5/igt@prime_vgem@wait@rcs0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8532_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_persistence@process:
>     - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099]) +2 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@gem_ctx_persistence@process.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-apl:          NOTRUN -> [FAIL][10] ([i915#2846])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@gem_exec_fair@basic-deadline.html
>     - shard-glk:          NOTRUN -> [FAIL][11] ([i915#2846])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk4/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-vip@rcs0:
>     - shard-tglu-10:      NOTRUN -> [FAIL][12] ([i915#2842])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@gem_exec_fair@basic-none-vip@rcs0.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4613]) +5 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>     - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
> 
>   * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
>     - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271]) +163 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#3323])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - shard-tglu-10:      NOTRUN -> [SKIP][17] ([i915#2527] / [i915#2856])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][18] ([i915#2521])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-tglu-10:      NOTRUN -> [SKIP][19] ([fdo#111614]) +1 similar issue
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-tglu-10:      NOTRUN -> [SKIP][20] ([fdo#111615]) +1 similar issue
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
>     - shard-tglu-10:      NOTRUN -> [SKIP][21] ([i915#3689] / [i915#3886])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>     - shard-glk:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
>     - shard-tglu-10:      NOTRUN -> [SKIP][23] ([i915#3689] / [i915#6095])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#3886]) +8 similar issues
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs:
>     - shard-tglu-10:      NOTRUN -> [SKIP][25] ([i915#6095]) +1 similar issue
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:
>     - shard-tglu-10:      NOTRUN -> [SKIP][26] ([i915#3689])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html
> 
>   * igt@kms_chamelium_edid@hdmi-mode-timings:
>     - shard-tglu-10:      NOTRUN -> [SKIP][27] ([i915#7828])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-tglu-10:      NOTRUN -> [SKIP][28] ([fdo#109274])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-apl:          NOTRUN -> [FAIL][29] ([i915#2346])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-tglu-10:      NOTRUN -> [SKIP][30] ([fdo#110189]) +1 similar issue
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271]) +135 similar issues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>     - shard-snb:          NOTRUN -> [SKIP][32] ([fdo#109271]) +163 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
>     - shard-tglu-10:      NOTRUN -> [SKIP][33] ([fdo#109280]) +6 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
>     - shard-tglu-10:      NOTRUN -> [SKIP][34] ([fdo#109289])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
> 
>   * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][35] ([i915#4573]) +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:
>     - shard-apl:          NOTRUN -> [FAIL][36] ([i915#4573]) +1 similar issue
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-tglu-10:      NOTRUN -> [SKIP][37] ([fdo#112054] / [i915#5288])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-4:
>     - shard-tglu-10:      NOTRUN -> [SKIP][38] ([i915#3555])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_plane_multiple@tiling-4.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#658]) +2 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#658]) +2 similar issues
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-tglu-10:      NOTRUN -> [SKIP][41] ([fdo#111615] / [i915#5289])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#2437])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@kms_writeback@writeback-invalid-parameters.html
>     - shard-tglu-10:      NOTRUN -> [SKIP][43] ([i915#2437])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@v3d/v3d_perfmon@create-single-perfmon:
>     - shard-tglu-10:      NOTRUN -> [SKIP][44] ([fdo#109315] / [i915#2575]) +1 similar issue
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@v3d/v3d_perfmon@create-single-perfmon.html
> 
>   * igt@vc4/vc4_perfmon@create-single-perfmon:
>     - shard-tglu-10:      NOTRUN -> [SKIP][45] ([i915#2575])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@vc4/vc4_perfmon@create-single-perfmon.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - {shard-rkl}:        [FAIL][46] ([i915#2842]) -> [PASS][47] +2 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp:
>     - {shard-dg1}:        [SKIP][48] ([i915#1397]) -> [PASS][49]
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-dg1-15/igt@i915_pm_rpm@modeset-lpsp.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
>   [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
>   [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
>   [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7173 -> IGTPW_8532
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_12786: f182ba6684a2393069248bc946f20ceabd9e395d @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8532: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html
>   IGT_7173: deab4e0bdf5a9366b67d0a44f478f3da3c9a943b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html
