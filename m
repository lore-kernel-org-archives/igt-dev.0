Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDAB6F566
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2020 08:26:40 +0000 (UTC)
Date: Thu, 13 Feb 2020 10:26:13 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200213082613.GA3542@ideak-desk.fi.intel.com>
References: <20200211023108.25369-1-imre.deak@intel.com>
 <158152598116.24266.6775953144070743969@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158152598116.24266.6775953144070743969@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv2=2C1/8=5D_lib/igt=5Fdraw=3A_Refactor_get=5F?=
 =?utf-8?q?tiling_calls?=
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
To: igt-dev@lists.freedesktop.org, Matt Turner <matt.turner@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 04:46:21PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [v2,1/8] lib/igt_draw: Refactor get_tiling calls
> URL   : https://patchwork.freedesktop.org/series/73268/
> State : success

Thanks for the review, pushed to igt.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_7904_full -> IGTPW_4124_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/index.html
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4124_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_isolation@vcs1-none:
>     - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +6 similar issues
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb6/igt@gem_ctx_isolation@vcs1-none.html
> 
>   * igt@gem_ctx_shared@exec-single-timeline-bsd:
>     - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110841])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
> 
>   * igt@gem_exec_schedule@in-order-bsd:
>     - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +2 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html
> 
>   * igt@gem_exec_schedule@pi-shared-iova-bsd:
>     - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#716])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-glk7/igt@gen9_exec_parse@allowed-all.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-glk4/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_selftest@live_gtt:
>     - shard-kbl:          [PASS][11] -> [TIMEOUT][12] ([fdo#112271])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-kbl2/igt@i915_selftest@live_gtt.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-kbl6/igt@i915_selftest@live_gtt.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
>     - shard-tglb:         [PASS][13] -> [FAIL][14] ([fdo#111703]) +5 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
>     - shard-tglb:         [PASS][15] -> [DMESG-FAIL][16] ([i915#402]) +2 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#433])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
>     - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
>     - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
>     - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#1184])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
> 
>   * igt@kms_plane_lowres@pipe-a-tiling-x:
>     - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#899])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
> 
>   * igt@kms_psr@psr2_basic:
>     - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb2/igt@kms_psr@psr2_basic.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb3/igt@kms_psr@psr2_basic.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#668]) +2 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb6/igt@kms_psr@psr2_primary_mmap_cpu.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb5/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   * igt@kms_setmode@basic:
>     - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#31])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-apl8/igt@kms_setmode@basic.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-apl6/igt@kms_setmode@basic.html
> 
>   * igt@perf_pmu@rc6-runtime-pm-long:
>     - shard-hsw:          [PASS][33] -> [INCOMPLETE][34] ([CI#80] / [i915#61])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-hsw2/igt@perf_pmu@rc6-runtime-pm-long.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-hsw7/igt@perf_pmu@rc6-runtime-pm-long.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-snb:          [PASS][35] -> [DMESG-WARN][36] ([i915#478])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-snb4/igt@prime_vgem@coherency-gtt.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-snb2/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@prime_vgem@fence-wait-bsd2:
>     - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109276]) +20 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_busy@busy-vcs1:
>     - shard-iclb:         [SKIP][39] ([fdo#112080]) -> [PASS][40] +14 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb8/igt@gem_busy@busy-vcs1.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb2/igt@gem_busy@busy-vcs1.html
> 
>   * igt@gem_exec_balancer@smoke:
>     - shard-iclb:         [SKIP][41] ([fdo#110854]) -> [PASS][42]
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb7/igt@gem_exec_balancer@smoke.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb2/igt@gem_exec_balancer@smoke.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
>     - shard-iclb:         [SKIP][43] ([fdo#112146]) -> [PASS][44] +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb4/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - shard-hsw:          [FAIL][45] ([i915#694]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-apl:          [FAIL][47] ([i915#644]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-iclb:         [FAIL][49] ([i915#454]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-iclb:         [FAIL][51] ([i915#413]) -> [PASS][52]
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb4/igt@i915_pm_rps@waitboost.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb8/igt@i915_pm_rps@waitboost.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +3 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-apl1/igt@i915_suspend@sysfs-reader.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-apl6/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>     - shard-tglb:         [DMESG-FAIL][55] ([i915#402]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen:
>     - shard-kbl:          [FAIL][57] ([i915#54]) -> [PASS][58]
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
>     - shard-apl:          [FAIL][59] ([i915#54]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
> 
>   * igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:
>     - shard-tglb:         [FAIL][61] ([i915#70]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb8/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb5/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
>     - shard-tglb:         [FAIL][63] ([i915#559]) -> [PASS][64] +1 similar issue
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-hsw:          [INCOMPLETE][65] ([i915#61]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_tiling@flip-changes-tiling:
>     - shard-tglb:         [FAIL][67] ([i915#699]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb6/igt@kms_flip_tiling@flip-changes-tiling.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb6/igt@kms_flip_tiling@flip-changes-tiling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-kbl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +6 similar issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
>     - shard-tglb:         [SKIP][71] ([i915#668]) -> [PASS][72] +5 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
>     - shard-tglb:         [FAIL][73] ([i915#1184]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
> 
>   * igt@kms_plane_lowres@pipe-a-tiling-y:
>     - shard-glk:          [FAIL][75] ([i915#899]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-y.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-y.html
> 
>   * igt@kms_psr@psr2_primary_page_flip:
>     - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-tglb:         [FAIL][79] ([i915#65]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb2/igt@kms_rotation_crc@sprite-rotation-270.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb8/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@prime_busy@after-bsd2:
>     - shard-iclb:         [SKIP][81] ([fdo#109276]) -> [PASS][82] +17 similar issues
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb8/igt@prime_busy@after-bsd2.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb1/igt@prime_busy@after-bsd2.html
> 
>   * igt@prime_mmap_coherency@ioctl-errors:
>     - shard-hsw:          [FAIL][83] ([i915#831]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-hsw4/igt@prime_mmap_coherency@ioctl-errors.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
>     - shard-iclb:         [SKIP][85] ([fdo#112080]) -> [FAIL][86] ([IGT#28])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-tglb:         [FAIL][87] ([i915#454]) -> [SKIP][88] ([i915#668])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb1/igt@i915_pm_dc@dc6-psr.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@perf@gen12-mi-rpc:
>     - shard-tglb:         [TIMEOUT][89] ([fdo#112271] / [i915#1085] / [i915#472]) -> [TIMEOUT][90] ([fdo#112271] / [i915#1085])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7904/shard-tglb7/igt@perf@gen12-mi-rpc.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/shard-tglb3/igt@perf@gen12-mi-rpc.html
> 
>   
>   [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
>   [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
>   [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
>   [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
>   [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
>   [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
>   [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
>   [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
>   [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
>   [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
>   [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
>   [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
>   [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
>   [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
>   [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
>   [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
>   [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
>   [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
>   [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
>   [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
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
>   * IGT: IGT_5433 -> IGTPW_4124
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_7904: 5de757f49fb13a3c0e42626e7c4b47c2d82b14a1 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4124: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/index.html
>   IGT_5433: 6a96c17f3a1b4e1f90b1a0b0ce42a7219875d1a4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4124/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
