Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A8989ECB
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2020 18:09:24 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 1 Jun 2020 18:09:22 +0000
Message-ID: <e11aa04c9fb00d2fc6971579f60dc473d6335a35.camel@intel.com>
References: <20200529005218.76681-1-jose.souza@intel.com>
 <159073446809.3332.5010659259727565707@emeril.freedesktop.org>
In-Reply-To: <159073446809.3332.5010659259727565707@emeril.freedesktop.org>
Content-Language: en-US
Content-ID: <43CCDD9F4575904EB1666D6E7490DF6D@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Ffbcon=5Ffbt=3A_When_restoring_fbcon_always_set_mode_to_te?=
 =?utf-8?q?xt_mode?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2020-05-29 at 06:41 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_fbcon_fbt: When restoring fbcon always set mode to text mode
> URL   : https://patchwork.freedesktop.org/series/77774/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8551_full -> IGTPW_4622_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4622_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4622_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4622_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
>     - shard-glk:          [PASS][1] -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
> 
>   * igt@runner@aborted:
>     - shard-hsw:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-hsw1/igt@runner@aborted.html


Regressions above are not related to this changes.

Pushed, thanks for the review Uma.

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4622_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_create@create-clear:
>     - shard-hsw:          [PASS][4] -> [DMESG-WARN][5] ([i915#1927])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-hsw1/igt@gem_create@create-clear.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-hsw1/igt@gem_create@create-clear.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-kbl:          [PASS][6] -> [DMESG-WARN][7] ([i915#180]) +1 similar issue
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@i915_module_load@reload:
>     - shard-glk:          [PASS][8] -> [INCOMPLETE][9] ([i915#58] / [k.org#198133])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-glk6/igt@i915_module_load@reload.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-glk8/igt@i915_module_load@reload.html
>     - shard-apl:          [PASS][10] -> [INCOMPLETE][11] ([i915#1635])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl7/igt@i915_module_load@reload.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl6/igt@i915_module_load@reload.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
>     - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#54])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
>     - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#54])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
>     - shard-apl:          [PASS][16] -> [TIMEOUT][17] ([i915#1635])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
>     - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>     - shard-glk:          [PASS][20] -> [DMESG-FAIL][21] ([i915#1925]) +1 similar issue
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-glk8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-glk5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@pipe-d-torture-bo:
>     - shard-tglb:         [PASS][22] -> [DMESG-WARN][23] ([i915#128])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-tglb6/igt@kms_cursor_legacy@pipe-d-torture-bo.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-tglb6/igt@kms_cursor_legacy@pipe-d-torture-bo.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
>     - shard-kbl:          [PASS][24] -> [FAIL][25] ([i915#53] / [i915#93] / [i915#95])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-kbl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
>     - shard-apl:          [PASS][26] -> [FAIL][27] ([i915#53] / [i915#95])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
>     - shard-kbl:          [PASS][28] -> [INCOMPLETE][29] ([i915#155] / [i915#648])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
> 
>   * igt@kms_psr@psr2_sprite_mmap_gtt:
>     - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109441])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_mmap_gtt@basic-small-copy-odd:
>     - shard-hsw:          [INCOMPLETE][32] ([i915#61]) -> [PASS][33] +1 similar issue
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-hsw8/igt@gem_mmap_gtt@basic-small-copy-odd.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-hsw6/igt@gem_mmap_gtt@basic-small-copy-odd.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-glk:          [DMESG-WARN][34] ([i915#1927]) -> [PASS][35]
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-glk8/igt@gem_set_tiling_vs_gtt.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-glk9/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-kbl:          [INCOMPLETE][36] -> [PASS][37]
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-kbl6/igt@gem_softpin@noreloc-s3.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-kbl7/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-apl:          [DMESG-WARN][38] ([i915#1436] / [i915#716]) -> [PASS][39]
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl6/igt@gen9_exec_parse@allowed-all.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl1/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-tglb:         [SKIP][40] ([i915#1904]) -> [PASS][41]
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@i915_pm_dc@dc5-psr:
>     - shard-iclb:         [FAIL][42] ([i915#1899]) -> [PASS][43]
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-iclb3/igt@i915_pm_dc@dc5-psr.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-iclb3/igt@i915_pm_dc@dc5-psr.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-glk:          [FAIL][44] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][45]
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-glk7/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
>     - shard-kbl:          [FAIL][46] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][47] +1 similar issue
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
>     - shard-apl:          [FAIL][48] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][49] +1 similar issue
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
> 
>   * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
>     - shard-apl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51] +3 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
> 
>   * {igt@kms_flip@flip-vs-suspend@c-dp1}:
>     - shard-kbl:          [DMESG-WARN][52] ([i915#180]) -> [PASS][53] +1 similar issue
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglb:         [SKIP][54] ([i915#433]) -> [PASS][55]
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-tglb:         [FAIL][56] ([i915#83]) -> [PASS][57]
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-tglb5/igt@kms_panel_fitting@atomic-fastset.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-tglb2/igt@kms_panel_fitting@atomic-fastset.html
>     - shard-iclb:         [FAIL][58] ([i915#83]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-coverage-7efc:
>     - shard-glk:          [INCOMPLETE][60] ([i915#1927] / [i915#58] / [k.org#198133]) -> [PASS][61]
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-glk8/igt@kms_plane_alpha_blend@pipe-c-coverage-7efc.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-coverage-7efc.html
> 
>   * igt@kms_plane_cursor@pipe-a-viewport-size-64:
>     - shard-kbl:          [FAIL][62] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][63] +1 similar issue
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
>     - shard-apl:          [FAIL][64] ([i915#1559] / [i915#95]) -> [PASS][65] +1 similar issue
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
> 
>   * igt@kms_psr@no_drrs:
>     - shard-iclb:         [FAIL][66] ([i915#173]) -> [PASS][67]
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-iclb1/igt@kms_psr@no_drrs.html
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-iclb8/igt@kms_psr@no_drrs.html
> 
>   * igt@kms_psr@psr2_cursor_mmap_cpu:
>     - shard-iclb:         [SKIP][68] ([fdo#109441]) -> [PASS][69] +2 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
> 
>   * {igt@perf@blocking-parameterized}:
>     - shard-iclb:         [FAIL][70] ([i915#1542]) -> [PASS][71]
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-iclb6/igt@perf@blocking-parameterized.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-iclb6/igt@perf@blocking-parameterized.html
>     - shard-hsw:          [FAIL][72] ([i915#1542]) -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-hsw8/igt@perf@blocking-parameterized.html
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-hsw2/igt@perf@blocking-parameterized.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@atomic:
>     - shard-apl:          [TIMEOUT][74] ([i915#1319] / [i915#1635]) -> [TIMEOUT][75] ([i915#1319])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl4/igt@kms_content_protection@atomic.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl4/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-apl:          [FAIL][76] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][77] ([fdo#110321])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl6/igt@kms_content_protection@atomic-dpms.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl1/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@lic:
>     - shard-apl:          [TIMEOUT][78] ([i915#1319] / [i915#1635]) -> [FAIL][79] ([fdo#110321])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl1/igt@kms_content_protection@lic.html
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl1/igt@kms_content_protection@lic.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
>     - shard-apl:          [DMESG-WARN][80] ([i915#180] / [i915#95]) -> [DMESG-WARN][81] ([i915#180])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
> 
>   * igt@kms_psr2_su@page_flip:
>     - shard-iclb:         [FAIL][82] ([i915#608]) -> [SKIP][83] ([fdo#109642] / [fdo#111068])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8551/shard-iclb2/igt@kms_psr2_su@page_flip.html
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/shard-iclb8/igt@kms_psr2_su@page_flip.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
>   [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
>   [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
>   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
>   [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
>   [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
>   [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
>   [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
>   [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
>   [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
>   [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
>   [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
>   [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
>   [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
>   [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
>   [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
>   [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
>   [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
>   [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
>   [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
>   [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
>   [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
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
>   * IGT: IGT_5683 -> IGTPW_4622
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_8551: 2342e5b1743ca04244e790ccd53638019187dd88 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4622: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/index.html
>   IGT_5683: 757b6e72d546fd2dbc3801a73796d67b0854021b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4622/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
