Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 09:55:44 -0000
Message-ID: <158193334456.7222.11355745111390208008@emeril.freedesktop.org>
References: <20200213093041.10120-1-mika.kahola@intel.com>
In-Reply-To: <20200213093041.10120-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_Use_correct_CCS_plane_for_semiplanar_formats?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_ccs: Use correct CCS plane for semiplanar formats
URL   : https://patchwork.freedesktop.org/series/73399/
State : success

== Summary ==

CI Bug Log - changes from IGT_5439_full -> IGTPW_4145_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/index.html

Known issues
------------

  Here are the changes found in IGTPW_4145_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276]) +10 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb5/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112146]) +9 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][5] -> [DMESG-WARN][6] ([fdo#111870] / [i915#478])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb4/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#413])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb3/igt@i915_pm_rps@waitboost.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb7/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl7/igt@i915_suspend@sysfs-reader.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-apl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#1140])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb5/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb6/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#1172])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#1149])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb8/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb1/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([fdo#111703]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-size-change:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-size-change.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#70]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb6/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb5/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-tglb:         [PASS][27] -> [DMESG-FAIL][28] ([i915#402])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#559]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb4/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#1041] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-kbl4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-tglb:         [PASS][37] -> [DMESG-FAIL][38] ([i915#402] / [i915#65])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#31])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl2/igt@kms_setmode@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-apl8/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#112080]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb1/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb3/igt@perf_pmu@busy-accuracy-2-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][43] ([fdo#110841]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][45] ([i915#677]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_store@cachelines-vcs1:
    - shard-iclb:         [SKIP][49] ([fdo#112080]) -> [PASS][50] +11 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb8/igt@gem_exec_store@cachelines-vcs1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb2/igt@gem_exec_store@cachelines-vcs1.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][51] ([i915#716]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][53] ([i915#447]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb6/igt@i915_pm_dc@dc5-dpms.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-tglb:         [FAIL][55] ([i915#1172]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-tglb:         [FAIL][57] ([fdo#111703]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_tiling@flip-to-y-tiled:
    - shard-glk:          [FAIL][61] ([i915#167]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk7/igt@kms_flip_tiling@flip-to-y-tiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-glk1/igt@kms_flip_tiling@flip-to-y-tiled.html
    - shard-tglb:         [DMESG-FAIL][63] ([i915#402]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb2/igt@kms_flip_tiling@flip-to-y-tiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb2/igt@kms_flip_tiling@flip-to-y-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-snb:          [DMESG-WARN][65] ([i915#478]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-top-left-pipe-a-planes:
    - shard-tglb:         [FAIL][69] ([i915#1171]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb7/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][71] ([i915#899]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][75] ([fdo#103665]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][77] ([fdo#112271] / [i915#1085]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb3/igt@perf@gen12-mi-rpc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][79] ([fdo#109276]) -> [PASS][80] +17 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][81] ([IGT#28]) -> [SKIP][82] ([fdo#112080])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][83] ([i915#454]) -> [SKIP][84] ([i915#468])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock_timelines:
    - shard-glk:          [INCOMPLETE][85] ([i915#58] / [k.org#198133]) -> [INCOMPLETE][86] ([i915#1234] / [i915#58] / [k.org#198133])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk5/igt@i915_selftest@mock_timelines.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-glk4/igt@i915_selftest@mock_timelines.html
    - shard-kbl:          [INCOMPLETE][87] ([fdo#103665]) -> [INCOMPLETE][88] ([fdo#103665] / [i915#1234])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl1/igt@i915_selftest@mock_timelines.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-kbl7/igt@i915_selftest@mock_timelines.html
    - shard-apl:          [INCOMPLETE][89] ([fdo#103927]) -> [INCOMPLETE][90] ([fdo#103927] / [i915#1234])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl3/igt@i915_selftest@mock_timelines.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-apl8/igt@i915_selftest@mock_timelines.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99]) ([fdo#111870] / [i915#1077] / [i915#698] / [i915#974]) -> ([FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109]) ([fdo#111870] / [i915#1077] / [i915#974])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb6/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb5/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb5/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb5/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb6/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb5/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb6/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb6/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb4/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb5/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb5/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/shard-snb4/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1041]: https://gitlab.freedesktop.org/drm/intel/issues/1041
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1171]: https://gitlab.freedesktop.org/drm/intel/issues/1171
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1234]: https://gitlab.freedesktop.org/drm/intel/issues/1234
  [i915#167]: https://gitlab.freedesktop.org/drm/intel/issues/167
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5439 -> IGTPW_4145
  * Linux: CI_DRM_7927 -> CI_DRM_7930

  CI-20190529: 20190529
  CI_DRM_7927: 3a98ab302e50571e7815a0092e344ffe730688bb @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_7930: efe748cc918711e2a9b9bf1a63a6c7b2747a4eb3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4145: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/index.html
  IGT_5439: ed1f7d96d4d5d4565bcd3adb3a23b2002a25419e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4145/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
