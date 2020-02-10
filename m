Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1256E8D5
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 06:50:33 +0000 (UTC)
Date: Mon, 10 Feb 2020 07:50:30 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200210065030.GA18793@zkempczy-desk.igk.intel.com>
References: <20200207032725.10731-1-zbigniew.kempczynski@intel.com>
 <158131499741.3099.5116116007992770962@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158131499741.3099.5116116007992770962@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fvec=3A_assertion_fortification?=
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
To: igt-dev@lists.freedesktop.org
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 06:09:57AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_vec: assertion fortification
> URL   : https://patchwork.freedesktop.org/series/73125/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_7882_full -> IGTPW_4109_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4109_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4109_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4109_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>     - shard-tglb:         [PASS][1] -> [FAIL][2] +2 similar issues
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb3/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

It seems it is CRC checking problem, not related to the proposed change.

--
Zbigniew

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4109_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_busy@busy-vcs1:
>     - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +10 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb1/igt@gem_busy@busy-vcs1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb3/igt@gem_busy@busy-vcs1.html
> 
>   * igt@gem_ctx_shared@exec-shared-gtt-bsd:
>     - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#616])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl1/igt@gem_ctx_shared@exec-shared-gtt-bsd.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl7/igt@gem_ctx_shared@exec-shared-gtt-bsd.html
> 
>   * igt@gem_exec_schedule@preempt-other-chain-bsd:
>     - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +5 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#644])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#716])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#454])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#413])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb5/igt@i915_pm_rps@waitboost.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb1/igt@i915_pm_rps@waitboost.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +5 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
>     - shard-tglb:         [PASS][19] -> [DMESG-FAIL][20] ([i915#402])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_color@pipe-c-ctm-max:
>     - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#168])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl4/igt@kms_color@pipe-c-ctm-max.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl6/igt@kms_color@pipe-c-ctm-max.html
>     - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#168])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-apl4/igt@kms_color@pipe-c-ctm-max.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-apl3/igt@kms_color@pipe-c-ctm-max.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-suspend:
>     - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +7 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled:
>     - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#559])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([fdo#103665])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_psr@no_drrs:
>     - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#173])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb6/igt@kms_psr@no_drrs.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb1/igt@kms_psr@no_drrs.html
> 
>   * igt@kms_psr@psr2_sprite_blt:
>     - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#402])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb7/igt@kms_rotation_crc@bad-tiling.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb2/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#65])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb6/igt@kms_rotation_crc@primary-rotation-270.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb7/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_setmode@basic:
>     - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#31])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl7/igt@kms_setmode@basic.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl6/igt@kms_setmode@basic.html
> 
>   * igt@prime_vgem@fence-wait-bsd2:
>     - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109276]) +15 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_caching@writes:
>     - shard-hsw:          [FAIL][43] ([i915#694]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-hsw5/igt@gem_caching@writes.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-hsw6/igt@gem_caching@writes.html
> 
>   * igt@gem_exec_balancer@smoke:
>     - shard-iclb:         [SKIP][45] ([fdo#110854]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb6/igt@gem_exec_balancer@smoke.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb1/igt@gem_exec_balancer@smoke.html
> 
>   * igt@gem_exec_schedule@fifo-bsd1:
>     - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +17 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb5/igt@gem_exec_schedule@fifo-bsd1.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb1/igt@gem_exec_schedule@fifo-bsd1.html
> 
>   * igt@gem_exec_schedule@in-order-bsd:
>     - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +1 similar issue
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb7/igt@gem_exec_schedule@in-order-bsd.html
> 
>   * igt@gem_exec_schedule@pi-distinct-iova-bsd:
>     - shard-iclb:         [SKIP][51] ([i915#677]) -> [PASS][52] +1 similar issue
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-glk:          [FAIL][53] ([i915#644]) -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
>     - shard-tglb:         [FAIL][55] ([i915#1172]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb7/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb5/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-suspend:
>     - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58]
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@pipe-c-torture-bo:
>     - shard-hsw:          [INCOMPLETE][59] ([CI#80] / [i915#61]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-hsw8/igt@kms_cursor_legacy@pipe-c-torture-bo.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-hsw5/igt@kms_cursor_legacy@pipe-c-torture-bo.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
>     - shard-tglb:         [DMESG-FAIL][61] ([i915#402]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:
>     - shard-tglb:         [FAIL][63] ([i915#559]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
>     - shard-iclb:         [INCOMPLETE][65] ([i915#123]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:
>     - shard-tglb:         [FAIL][67] -> [PASS][68] +1 similar issue
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
>     - shard-kbl:          [INCOMPLETE][69] ([fdo#103665]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
>     - shard-iclb:         [INCOMPLETE][71] -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
>     - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +4 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
> 
>   * igt@kms_psr2_su@page_flip:
>     - shard-tglb:         [FAIL][75] ([i915#608]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb1/igt@kms_psr2_su@page_flip.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb7/igt@kms_psr2_su@page_flip.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - shard-tglb:         [SKIP][79] ([i915#668]) -> [PASS][80] +3 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb5/igt@kms_psr@sprite_plane_onoff.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb7/igt@kms_psr@sprite_plane_onoff.html
> 
>   * igt@perf@gen12-mi-rpc:
>     - shard-tglb:         [TIMEOUT][81] ([fdo#112271] / [i915#1085] / [i915#472]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb2/igt@perf@gen12-mi-rpc.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb3/igt@perf@gen12-mi-rpc.html
> 
>   * igt@perf_pmu@init-busy-vcs1:
>     - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [PASS][84] +11 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb8/igt@perf_pmu@init-busy-vcs1.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb4/igt@perf_pmu@init-busy-vcs1.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ctx_isolation@vcs1-nonpriv:
>     - shard-iclb:         [FAIL][85] ([IGT#28]) -> [SKIP][86] ([fdo#112080])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html
> 
>   * igt@gem_tiled_blits@interruptible:
>     - shard-hsw:          [FAIL][87] ([i915#694]) -> [FAIL][88] ([i915#818])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-hsw2/igt@gem_tiled_blits@interruptible.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-hsw5/igt@gem_tiled_blits@interruptible.html
> 
>   * igt@gem_tiled_blits@normal:
>     - shard-hsw:          [DMESG-FAIL][89] ([i915#44]) -> [FAIL][90] ([i915#694])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-hsw5/igt@gem_tiled_blits@normal.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-hsw1/igt@gem_tiled_blits@normal.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-snb:          [DMESG-WARN][91] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][92] ([fdo#110789] / [fdo#111870] / [i915#478])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-tglb:         [SKIP][93] ([i915#468]) -> [FAIL][94] ([i915#454])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-tglb:         [FAIL][95] ([i915#454]) -> [SKIP][96] ([i915#468])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
> 
>   
>   [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
>   [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
>   [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
>   [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
>   [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
>   [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
>   [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
>   [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
>   [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
>   [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
>   [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
>   [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
>   [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
>   [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
>   [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
>   [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
>   [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
>   [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
>   [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
>   [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
>   [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
>   [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
>   [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
>   [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
>   [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
> 
> 
> Participating hosts (10 -> 8)
> ------------------------------
> 
>   Missing    (2): pig-skl-6260u pig-glk-j5005 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5423 -> IGTPW_4109
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_7882: bc62c7b88481f1c427fed468264ef0674fc1e8ba @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4109: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/index.html
>   IGT_5423: 02ef996e76b3bae1c62d6a1298462aba0b7ac51a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
