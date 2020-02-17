Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 09:47:06 -0000
Message-ID: <158193282680.7224.375722763449800030@emeril.freedesktop.org>
References: <20200213051845.31958-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200213051845.31958-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Set_plane_position_and_framebuffer_dimensions?=
 =?utf-8?q?_before_commit?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_big_fb: Set plane position and framebuffer dimensions before commit
URL   : https://patchwork.freedesktop.org/series/73392/
State : success

== Summary ==

CI Bug Log - changes from IGT_5439_full -> IGTPW_4144_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/index.html

Known issues
------------

  Here are the changes found in IGTPW_4144_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][1] -> [TIMEOUT][2] ([fdo#112271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb2/igt@gem_exec_balancer@hang.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb6/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112146]) +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb5/igt@gem_exec_schedule@wide-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [PASS][5] -> [FAIL][6] ([i915#694]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][7] -> [DMESG-WARN][8] ([fdo#111870] / [i915#478])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#370])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb8/igt@i915_pm_rps@min-max-config-loaded.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb2/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#413]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb5/igt@i915_pm_rps@reset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb4/igt@i915_pm_rps@reset.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#1140])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb5/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb6/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#1172]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_color@pipe-b-ctm-blue-to-red:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#129])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl8/igt@kms_color@pipe-b-ctm-blue-to-red.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-apl4/igt@kms_color@pipe-b-ctm-blue-to-red.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#129])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl1/igt@kms_color@pipe-b-ctm-blue-to-red.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-kbl2/igt@kms_color@pipe-b-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([fdo#111703]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
    - shard-tglb:         [PASS][23] -> [DMESG-FAIL][24] ([i915#402]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb8/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#559])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
    - shard-snb:          [PASS][27] -> [DMESG-WARN][28] ([i915#478])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#668]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#1184])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb5/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#199])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-tglb:         [PASS][41] -> [FAIL][42] ([i915#65])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl2/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-apl1/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#112080]) +9 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109276]) +13 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@prime_busy@after-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb7/igt@prime_busy@after-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#110841]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][51] ([fdo#110854]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb3/igt@gem_exec_balancer@smoke.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][53] ([fdo#112080]) -> [PASS][54] +9 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][59] ([fdo#111870] / [i915#478]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][61] ([i915#716]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][63] ([i915#447]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb4/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-hsw:          [INCOMPLETE][65] ([i915#151] / [i915#61]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-hsw5/igt@i915_pm_rpm@gem-evict-pwrite.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-hsw4/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-tglb:         [FAIL][67] ([i915#1172]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-tglb:         [FAIL][69] ([fdo#111703]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [FAIL][71] ([i915#54]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][73] ([i915#54]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_tiling@flip-to-y-tiled:
    - shard-glk:          [FAIL][77] ([i915#167]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk7/igt@kms_flip_tiling@flip-to-y-tiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-glk1/igt@kms_flip_tiling@flip-to-y-tiled.html
    - shard-tglb:         [DMESG-FAIL][79] ([i915#402]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb2/igt@kms_flip_tiling@flip-to-y-tiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb2/igt@kms_flip_tiling@flip-to-y-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-snb:          [DMESG-WARN][81] ([i915#478]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-top-left-pipe-a-planes:
    - shard-tglb:         [FAIL][85] ([i915#1171]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-tglb1/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][87] ([i915#899]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][91] ([fdo#103665]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][93] ([fdo#109276]) -> [PASS][94] +22 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][95] ([i915#694]) -> [FAIL][96] ([i915#818])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-hsw5/igt@gem_tiled_blits@normal.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@i915_selftest@mock_timelines:
    - shard-glk:          [INCOMPLETE][97] ([i915#58] / [k.org#198133]) -> [INCOMPLETE][98] ([i915#1234] / [i915#58] / [k.org#198133])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk5/igt@i915_selftest@mock_timelines.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-glk6/igt@i915_selftest@mock_timelines.html
    - shard-kbl:          [INCOMPLETE][99] ([fdo#103665]) -> [INCOMPLETE][100] ([fdo#103665] / [i915#1234])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl1/igt@i915_selftest@mock_timelines.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-kbl4/igt@i915_selftest@mock_timelines.html
    - shard-apl:          [INCOMPLETE][101] ([fdo#103927]) -> [INCOMPLETE][102] ([fdo#103927] / [i915#1234])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl3/igt@i915_selftest@mock_timelines.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-apl1/igt@i915_selftest@mock_timelines.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111]) ([fdo#111870] / [i915#1077] / [i915#698] / [i915#974]) -> ([FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120]) ([fdo#111870] / [i915#1077] / [i915#974])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb5/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb5/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb5/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb5/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb6/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb5/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb5/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb6/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb6/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb6/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb6/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/shard-snb2/igt@runner@aborted.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#1171]: https://gitlab.freedesktop.org/drm/intel/issues/1171
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#1234]: https://gitlab.freedesktop.org/drm/intel/issues/1234
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#167]: https://gitlab.freedesktop.org/drm/intel/issues/167
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#199]: https://gitlab.freedesktop.org/drm/intel/issues/199
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#370]: https://gitlab.freedesktop.org/drm/intel/issues/370
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5439 -> IGTPW_4144

  CI-20190529: 20190529
  CI_DRM_7927: 3a98ab302e50571e7815a0092e344ffe730688bb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4144: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/index.html
  IGT_5439: ed1f7d96d4d5d4565bcd3adb3a23b2002a25419e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4144/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
