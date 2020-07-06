Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA636E413
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2020 14:07:48 +0000 (UTC)
Date: Mon, 6 Jul 2020 17:07:36 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200706140736.GA20810@ideak-desk.fi.intel.com>
References: <20200630160344.15886-1-imre.deak@intel.com>
 <159363977572.16668.1996158495901776173@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159363977572.16668.1996158495901776173@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fflip=3A_Check_for_?=
 =?utf-8?q?link_reset_during_TS_calibration_as_well?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 01, 2020 at 09:42:55PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] tests/kms_flip: Check for link reset during TS calibration as well
> URL   : https://patchwork.freedesktop.org/series/78949/
> State : success

Thanks for the review, pushed to master, with the event_state->name
deubg print fixed.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8678_full -> IGTPW_4720_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with IGTPW_4720_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4720_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4720_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
>     - shard-tglb:         [FAIL][1] ([i915#1928]) -> [FAIL][2] +1 similar issue
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4720_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_param@set-priority-range:
>     - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#1635] / [i915#95]) +31 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl1/igt@gem_ctx_param@set-priority-range.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl8/igt@gem_ctx_param@set-priority-range.html
> 
>   * igt@gem_exec_await@wide-all:
>     - shard-hsw:          [PASS][5] -> [INCOMPLETE][6] ([i915#1958])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-hsw4/igt@gem_exec_await@wide-all.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-hsw4/igt@gem_exec_await@wide-all.html
> 
>   * igt@gem_exec_create@forked:
>     - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95]) +2 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-glk7/igt@gem_exec_create@forked.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-glk4/igt@gem_exec_create@forked.html
> 
>   * igt@gem_mmap_wc@copy:
>     - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#93] / [i915#95]) +47 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl1/igt@gem_mmap_wc@copy.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl3/igt@gem_mmap_wc@copy.html
> 
>   * igt@i915_module_load@reload:
>     - shard-iclb:         [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +2 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-iclb2/igt@i915_module_load@reload.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-iclb1/igt@i915_module_load@reload.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#454])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-hsw:          [PASS][15] -> [WARN][16] ([i915#1519])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
>     - shard-kbl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#54] / [i915#95]) +1 similar issue
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
>     - shard-apl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#1635] / [i915#54] / [i915#95])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
> 
>   * igt@kms_flip_tiling@flip-changes-tiling-y:
>     - shard-kbl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#95]) +1 similar issue
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-y.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-snb:          [PASS][23] -> [TIMEOUT][24] ([i915#1958]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>     - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +2 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
>     - shard-apl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#1635] / [i915#95]) +1 similar issue
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
>     - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +4 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
> 
>   * igt@kms_psr@psr2_primary_render:
>     - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#402])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-tglb5/igt@kms_psr@psr2_primary_render.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-tglb2/igt@kms_psr@psr2_primary_render.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@perf@blocking-parameterized:
>     - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#1542])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-iclb4/igt@perf@blocking-parameterized.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-iclb5/igt@perf@blocking-parameterized.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_balancer@bonded-slice:
>     - shard-iclb:         [INCOMPLETE][37] ([i915#2118]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-iclb1/igt@gem_exec_balancer@bonded-slice.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-iclb5/igt@gem_exec_balancer@bonded-slice.html
> 
>   * igt@gem_exec_whisper@basic-contexts-forked:
>     - shard-glk:          [DMESG-WARN][39] ([i915#118] / [i915#95]) -> [PASS][40] +1 similar issue
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-glk9/igt@gem_exec_whisper@basic-contexts-forked.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>     - shard-snb:          [TIMEOUT][41] ([i915#1958]) -> [PASS][42] +3 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-snb1/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-snb2/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-apl:          [DMESG-WARN][43] ([i915#1436] / [i915#716]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl6/igt@gen9_exec_parse@allowed-all.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl8/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_getparams_basic@basic-eu-total:
>     - shard-kbl:          [DMESG-WARN][45] ([i915#93] / [i915#95]) -> [PASS][46] +42 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl6/igt@i915_getparams_basic@basic-eu-total.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl3/igt@i915_getparams_basic@basic-eu-total.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp:
>     - shard-apl:          [DMESG-WARN][47] ([i915#1635] / [i915#95]) -> [PASS][48] +35 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-0:
>     - shard-glk:          [DMESG-FAIL][49] ([i915#118] / [i915#95]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-glk5/igt@kms_big_fb@linear-64bpp-rotate-0.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
>     - shard-kbl:          [DMESG-FAIL][51] ([i915#54] / [i915#95]) -> [PASS][52] +3 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
>     - shard-glk:          [FAIL][53] ([i915#79]) -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp1:
>     - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +7 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
>     - shard-hsw:          [INCOMPLETE][57] ([i915#2055]) -> [PASS][58]
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1:
>     - shard-kbl:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl7/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl3/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack:
>     - shard-tglb:         [DMESG-WARN][61] ([i915#1982]) -> [PASS][62] +1 similar issue
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html
> 
>   * igt@kms_lease@lessee_list:
>     - shard-hsw:          [TIMEOUT][63] ([i915#1958]) -> [PASS][64] +3 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-hsw7/igt@kms_lease@lessee_list.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-hsw4/igt@kms_lease@lessee_list.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
>     - shard-glk:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
>     - shard-kbl:          [DMESG-FAIL][67] ([fdo#108145] / [i915#95]) -> [PASS][68] +1 similar issue
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
>     - shard-apl:          [DMESG-FAIL][69] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][70] +1 similar issue
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
> 
>   * igt@kms_plane_cursor@pipe-a-overlay-size-128:
>     - shard-kbl:          [DMESG-FAIL][71] ([i915#95]) -> [PASS][72] +1 similar issue
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
>     - shard-apl:          [DMESG-FAIL][73] ([i915#1635] / [i915#95]) -> [PASS][74] +1 similar issue
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
> 
>   * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
>     - shard-iclb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +1 similar issue
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-iclb7/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
> 
>   * igt@kms_psr2_su@frontbuffer:
>     - shard-iclb:         [SKIP][77] ([fdo#109642] / [fdo#111068]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
> 
>   * igt@kms_psr@no_drrs:
>     - shard-iclb:         [FAIL][79] ([i915#173]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-iclb1/igt@kms_psr@no_drrs.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-iclb3/igt@kms_psr@no_drrs.html
> 
>   * igt@kms_psr@psr2_cursor_mmap_cpu:
>     - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
> 
>   * igt@kms_psr@psr2_sprite_plane_onoff:
>     - shard-tglb:         [DMESG-WARN][83] ([i915#402]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-tglb2/igt@kms_psr@psr2_sprite_plane_onoff.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-tglb3/igt@kms_psr@psr2_sprite_plane_onoff.html
> 
>   * igt@perf@polling-parameterized:
>     - shard-iclb:         [FAIL][85] ([i915#1542]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-iclb6/igt@perf@polling-parameterized.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-iclb6/igt@perf@polling-parameterized.html
> 
>   * igt@perf_pmu@semaphore-busy@rcs0:
>     - shard-kbl:          [FAIL][87] ([i915#1820]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl2/igt@perf_pmu@semaphore-busy@rcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_reloc@basic-spin-others@vcs0:
>     - shard-snb:          [WARN][89] ([i915#2021]) -> [WARN][90] ([i915#2036])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html
> 
>   * igt@kms_chamelium@dp-hpd-storm-disable:
>     - shard-apl:          [SKIP][91] ([fdo#109271] / [fdo#111827]) -> [SKIP][92] ([fdo#109271] / [fdo#111827] / [i915#1635])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl3/igt@kms_chamelium@dp-hpd-storm-disable.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl7/igt@kms_chamelium@dp-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-kbl:          [TIMEOUT][93] ([i915#1319]) -> [TIMEOUT][94] ([i915#1319] / [i915#1958])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl2/igt@kms_content_protection@srm.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl7/igt@kms_content_protection@srm.html
>     - shard-apl:          [FAIL][95] ([fdo#110321]) -> [DMESG-FAIL][96] ([fdo#110321] / [i915#1635] / [i915#95])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl8/igt@kms_content_protection@srm.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl3/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-kbl:          [DMESG-WARN][97] ([i915#93] / [i915#95]) -> [DMESG-WARN][98] ([i915#180])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_dp_dsc@basic-dsc-enable-edp:
>     - shard-iclb:         [SKIP][99] ([fdo#109349]) -> [DMESG-WARN][100] ([i915#1226])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
>     - shard-snb:          [TIMEOUT][101] ([i915#1958]) -> [SKIP][102] ([fdo#109271]) +1 similar issue
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
>     - shard-hsw:          [TIMEOUT][103] ([i915#1958]) -> [SKIP][104] ([fdo#109271])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-hsw7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-hsw1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>     - shard-tglb:         [FAIL][105] ([i915#1928]) -> [FAIL][106] ([i915#2122])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-tglb1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-tglb3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-hsw:          [SKIP][107] ([fdo#109271]) -> [TIMEOUT][108] ([i915#1958]) +2 similar issues
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-kbl:          [DMESG-WARN][109] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][110] ([i915#93] / [i915#95])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-apl:          [SKIP][111] ([fdo#109271]) -> [SKIP][112] ([fdo#109271] / [i915#1635]) +11 similar issues
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>     - shard-apl:          [SKIP][113] ([fdo#109271] / [i915#1635]) -> [SKIP][114] ([fdo#109271]) +13 similar issues
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
>     - shard-apl:          [DMESG-FAIL][115] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][116] ([fdo#108145] / [i915#265])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
>     - shard-kbl:          [DMESG-FAIL][117] ([fdo#108145] / [i915#95]) -> [FAIL][118] ([fdo#108145] / [i915#265])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
>     - shard-kbl:          [FAIL][119] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][120] ([fdo#108145] / [i915#95])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
>     - shard-apl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#1635] / [i915#95])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
> 
>   * igt@kms_plane_cursor@pipe-d-primary-size-256:
>     - shard-snb:          [SKIP][123] ([fdo#109271]) -> [TIMEOUT][124] ([i915#1958]) +3 similar issues
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-snb1/igt@kms_plane_cursor@pipe-d-primary-size-256.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-snb4/igt@kms_plane_cursor@pipe-d-primary-size-256.html
> 
>   * igt@runner@aborted:
>     - shard-apl:          ([FAIL][125], [FAIL][126]) ([fdo#109271] / [i915#1635] / [i915#716]) -> [FAIL][127] ([i915#1635])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl8/igt@runner@aborted.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-apl6/igt@runner@aborted.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-apl6/igt@runner@aborted.html
>     - shard-tglb:         [FAIL][128] ([i915#2110]) -> [FAIL][129] ([i915#1764] / [i915#2110])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8678/shard-tglb1/igt@runner@aborted.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/shard-tglb3/igt@runner@aborted.html
> 
>   
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
>   [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
>   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
>   [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
>   [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
>   [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
>   [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
>   [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
>   [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
>   [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
>   [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
>   [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
>   [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
>   [i915#2118]: https://gitlab.freedesktop.org/drm/intel/issues/2118
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
>   [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
> 
> 
> Participating hosts (11 -> 8)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5718 -> IGTPW_4720
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_8678: 7cafa8aeca728d8abd1bc9d31d2fca60757a00c4 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4720: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/index.html
>   IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4720/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
