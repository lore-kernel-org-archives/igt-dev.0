Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8366E12F
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2020 13:51:32 +0000 (UTC)
Date: Fri, 3 Apr 2020 16:51:23 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200403135123.GF13110@ideak-desk.fi.intel.com>
References: <20200402122943.6583-1-imre.deak@intel.com>
 <158592034743.13349.5459637369691645993@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158592034743.13349.5459637369691645993@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Skip_detiler_fences_subtest_on_platforms_w/o_aper?=
 =?utf-8?q?ture?=
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
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

On Fri, Apr 03, 2020 at 01:25:47PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_flip: Skip detiler fences subtest on platforms w/o aperture
> URL   : https://patchwork.freedesktop.org/series/75416/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5559_full -> IGTPW_4398_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4398_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4398_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4398_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ppgtt@blt-vs-render-ctx0:
>     - shard-apl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl3/igt@gem_ppgtt@blt-vs-render-ctx0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl2/igt@gem_ppgtt@blt-vs-render-ctx0.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-hsw:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-hsw6/igt@gem_tiled_swapping@non-threaded.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-hsw6/igt@gem_tiled_swapping@non-threaded.html
>     - shard-snb:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-snb6/igt@gem_tiled_swapping@non-threaded.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-snb4/igt@gem_tiled_swapping@non-threaded.html

The above failures are unrelated to this change, it would at most cause
kms_flip to skip.

> New tests
> ---------
> 
>   New tests have been introduced between IGT_5559_full and IGTPW_4398_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@gem_cs_tlb@engines:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4398_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_balancer@smoke:
>     - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb1/igt@gem_exec_balancer@smoke.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-iclb5/igt@gem_exec_balancer@smoke.html
> 
>   * igt@i915_pm_rpm@gem-idle:
>     - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#1316]) +1 similar issue
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb8/igt@i915_pm_rpm@gem-idle.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-iclb2/igt@i915_pm_rpm@gem-idle.html
>     - shard-glk:          [PASS][11] -> [SKIP][12] ([fdo#109271]) +1 similar issue
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk9/igt@i915_pm_rpm@gem-idle.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-glk7/igt@i915_pm_rpm@gem-idle.html
>     - shard-tglb:         [PASS][13] -> [SKIP][14] ([i915#1316] / [i915#579]) +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb5/igt@i915_pm_rpm@gem-idle.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-tglb8/igt@i915_pm_rpm@gem-idle.html
> 
>   * igt@i915_pm_rpm@pm-tiling:
>     - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +1 similar issue
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-hsw4/igt@i915_pm_rpm@pm-tiling.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-hsw4/igt@i915_pm_rpm@pm-tiling.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
>     - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54] / [i915#93] / [i915#95]) +5 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
>     - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#54] / [i915#95]) +2 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
> 
>   * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
>     - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#70] / [i915#93] / [i915#95])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
> 
>   * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
>     - shard-hsw:          [PASS][23] -> [INCOMPLETE][24] ([i915#61])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-hsw4/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-hsw4/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
>     - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#52] / [i915#54]) +3 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled:
>     - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#52] / [i915#54] / [i915#95])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#34])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
>     - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#53] / [i915#93] / [i915#95]) +1 similar issue
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-pipe-a:
>     - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#53] / [i915#95])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
>     - shard-kbl:          [PASS][35] -> [FAIL][36] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
> 
>   * igt@kms_plane_cursor@pipe-a-viewport-size-128:
>     - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#1559] / [i915#95])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
>     - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#1559] / [i915#93] / [i915#95])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +2 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_vblank@pipe-a-ts-continuation-suspend:
>     - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +2 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:
>     - shard-tglb:         [PASS][45] -> [SKIP][46] ([fdo#112015])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html
> 
>   * igt@prime_busy@hang-bsd2:
>     - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109276]) +4 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb2/igt@prime_busy@hang-bsd2.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-iclb8/igt@prime_busy@hang-bsd2.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
>     - shard-apl:          [FAIL][49] ([i915#1528]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl8/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl3/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +6 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
> 
>   * igt@gem_mmap_gtt@hang:
>     - shard-tglb:         [FAIL][53] -> [PASS][54] +2 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb7/igt@gem_mmap_gtt@hang.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-tglb5/igt@gem_mmap_gtt@hang.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-iclb:         [FAIL][55] -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb2/igt@gem_tiled_swapping@non-threaded.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-iclb1/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-kbl:          [DMESG-WARN][57] ([i915#716]) -> [PASS][58]
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-iclb:         [SKIP][59] ([i915#1316]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb4/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-iclb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
>     - shard-tglb:         [SKIP][61] ([i915#1316] / [i915#579]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-0:
>     - shard-kbl:          [FAIL][63] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
>     - shard-apl:          [FAIL][65] ([i915#1119] / [i915#95]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
>     - shard-apl:          [FAIL][67] ([i915#54] / [i915#95]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
>     - shard-kbl:          [FAIL][69] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][70] +2 similar issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding:
>     - shard-apl:          [FAIL][71] ([i915#54]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
>     - shard-kbl:          [FAIL][73] ([i915#54]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
>     - shard-glk:          [FAIL][75] ([i915#52] / [i915#54]) -> [PASS][76] +3 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-kbl:          [FAIL][77] ([i915#64] / [i915#93] / [i915#95]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
>     - shard-apl:          [FAIL][79] ([i915#1525]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl3/igt@kms_fbcon_fbt@fbc.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl8/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_flip@2x-flip-vs-fences:
>     - shard-hsw:          [INCOMPLETE][81] ([i915#61]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-hsw2/igt@kms_flip@2x-flip-vs-fences.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-hsw2/igt@kms_flip@2x-flip-vs-fences.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-apl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl8/igt@kms_flip@flip-vs-suspend.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl3/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@plain-flip-ts-check:
>     - shard-glk:          [FAIL][85] ([i915#34]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk2/igt@kms_flip@plain-flip-ts-check.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-glk4/igt@kms_flip@plain-flip-ts-check.html
> 
>   * igt@kms_flip_tiling@flip-changes-tiling:
>     - shard-apl:          [FAIL][87] ([i915#95]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling.html
>     - shard-kbl:          [FAIL][89] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-apl:          [DMESG-WARN][91] ([i915#180] / [i915#95]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
>     - shard-apl:          [FAIL][93] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
> 
>   * igt@kms_psr@psr2_cursor_mmap_cpu:
>     - shard-iclb:         [SKIP][95] ([fdo#109441]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
> 
>   * igt@kms_setmode@basic:
>     - shard-apl:          [FAIL][97] ([i915#31]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl4/igt@kms_setmode@basic.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl2/igt@kms_setmode@basic.html
>     - shard-kbl:          [FAIL][99] ([i915#31]) -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl2/igt@kms_setmode@basic.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl6/igt@kms_setmode@basic.html
> 
>   * igt@perf@low-oa-exponent-permissions:
>     - shard-tglb:         [SKIP][101] ([i915#405]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb1/igt@perf@low-oa-exponent-permissions.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-tglb1/igt@perf@low-oa-exponent-permissions.html
>     - shard-iclb:         [SKIP][103] ([i915#405]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb4/igt@perf@low-oa-exponent-permissions.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-iclb2/igt@perf@low-oa-exponent-permissions.html
>     - shard-hsw:          [SKIP][105] ([fdo#109271]) -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-hsw8/igt@perf@low-oa-exponent-permissions.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-hsw1/igt@perf@low-oa-exponent-permissions.html
>     - shard-glk:          [SKIP][107] ([fdo#109271]) -> [PASS][108]
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk2/igt@perf@low-oa-exponent-permissions.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-glk6/igt@perf@low-oa-exponent-permissions.html
> 
>   * igt@prime_vgem@sync-bsd2:
>     - shard-iclb:         [SKIP][109] ([fdo#109276]) -> [PASS][110] +1 similar issue
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb5/igt@prime_vgem@sync-bsd2.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-iclb1/igt@prime_vgem@sync-bsd2.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-tglb:         [SKIP][111] ([i915#468]) -> [FAIL][112] ([i915#454])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rpm@gem-mmap-type:
>     - shard-snb:          [INCOMPLETE][113] ([i915#82]) -> [SKIP][114] ([fdo#109271])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-snb6/igt@i915_pm_rpm@gem-mmap-type.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-snb5/igt@i915_pm_rpm@gem-mmap-type.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>     - shard-apl:          [FAIL][115] ([fdo#108145] / [i915#265]) -> [FAIL][116] ([fdo#108145] / [i915#265] / [i915#95])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
>     - shard-kbl:          [FAIL][117] ([fdo#108145] / [i915#265]) -> [FAIL][118] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>     - shard-apl:          [FAIL][119] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][120] ([fdo#108145] / [i915#265])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
>     - shard-kbl:          [FAIL][121] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][122] ([fdo#108145] / [i915#265])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
> 
>   * igt@kms_psr2_su@page_flip:
>     - shard-iclb:         [SKIP][123] ([fdo#109642] / [fdo#111068]) -> [FAIL][124] ([i915#608])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb4/igt@kms_psr2_su@page_flip.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-iclb2/igt@kms_psr2_su@page_flip.html
> 
>   * igt@runner@aborted:
>     - shard-kbl:          ([FAIL][125], [FAIL][126]) ([i915#1423] / [i915#716] / [i915#92]) -> [FAIL][127] ([i915#1423] / [i915#92])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl6/igt@runner@aborted.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@runner@aborted.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/shard-kbl7/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
>   [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
>   [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
>   [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
>   [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
>   [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
>   [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
>   [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
>   [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
>   [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
>   [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
>   [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
>   [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
>   [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
>   [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
>   [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
>   [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
>   [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
>   [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
> 
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5559 -> IGTPW_4398
> 
>   CI-20190529: 20190529
>   CI_DRM_8238: 840f70602a47208a2f1e444ba276f412f10e38df @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4398: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/index.html
>   IGT_5559: d213e0c268e4bf2b619197b6125730b1affbf8d4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4398/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
