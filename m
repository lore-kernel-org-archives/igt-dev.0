Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 10 Feb 2020 07:23:04 -0000
Message-ID: <158131938489.3100.953845652941916541@emeril.freedesktop.org>
References: <20200207032725.10731-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200207032725.10731-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fvec=3A_assertion_fortification?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_vec: assertion fortification
URL   : https://patchwork.freedesktop.org/series/73125/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7882_full -> IGTPW_4109_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/index.html

Known issues
------------

  Here are the changes found in IGTPW_4109_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +10 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_shared@exec-shared-gtt-bsd:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#616])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl1/igt@gem_ctx_shared@exec-shared-gtt-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl7/igt@gem_ctx_shared@exec-shared-gtt-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#644])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#716])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#454])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#413])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-tglb:         [PASS][17] -> [DMESG-FAIL][18] ([i915#402])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#1172])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb3/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#168])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl4/igt@kms_color@pipe-c-ctm-max.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl6/igt@kms_color@pipe-c-ctm-max.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#168])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-apl4/igt@kms_color@pipe-c-ctm-max.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-apl3/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +7 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#559])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([fdo#103665])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_mmap_write_crc@main:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#1180])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb1/igt@kms_mmap_write_crc@main.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb7/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane@plane-position-covered-pipe-a-planes:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#1171])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb6/igt@kms_plane@plane-position-covered-pipe-a-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb2/igt@kms_plane@plane-position-covered-pipe-a-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#173])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb6/igt@kms_psr@no_drrs.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-tglb:         [PASS][39] -> [DMESG-WARN][40] ([i915#402])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb7/igt@kms_rotation_crc@bad-tiling.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb2/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-tglb:         [PASS][41] -> [FAIL][42] ([i915#65])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb6/igt@kms_rotation_crc@primary-rotation-270.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl7/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl6/igt@kms_setmode@basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109276]) +15 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_caching@writes:
    - shard-hsw:          [FAIL][47] ([i915#694]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-hsw5/igt@gem_caching@writes.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-hsw6/igt@gem_caching@writes.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][49] ([fdo#110854]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +17 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb5/igt@gem_exec_schedule@fifo-bsd1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb1/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb7/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][57] ([i915#644]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-tglb:         [FAIL][59] ([i915#1172]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb7/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb5/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@pipe-c-torture-bo:
    - shard-hsw:          [INCOMPLETE][63] ([CI#80] / [i915#61]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-hsw8/igt@kms_cursor_legacy@pipe-c-torture-bo.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-hsw5/igt@kms_cursor_legacy@pipe-c-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-tglb:         [DMESG-FAIL][65] ([i915#402]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:
    - shard-tglb:         [FAIL][67] ([i915#559]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-iclb:         [INCOMPLETE][69] ([i915#123]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:
    - shard-tglb:         [FAIL][71] -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][73] ([fdo#103665]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-iclb:         [INCOMPLETE][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [FAIL][79] ([i915#608]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb1/igt@kms_psr2_su@page_flip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@sprite_plane_onoff:
    - shard-tglb:         [SKIP][83] ([i915#668]) -> [PASS][84] +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb5/igt@kms_psr@sprite_plane_onoff.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb7/igt@kms_psr@sprite_plane_onoff.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][85] ([fdo#112271] / [i915#1085] / [i915#472]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][87] ([fdo#112080]) -> [PASS][88] +11 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb8/igt@perf_pmu@init-busy-vcs1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb4/igt@perf_pmu@init-busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][89] ([IGT#28]) -> [SKIP][90] ([fdo#112080])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][91] ([i915#694]) -> [FAIL][92] ([i915#818])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-hsw2/igt@gem_tiled_blits@interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [DMESG-FAIL][93] ([i915#44]) -> [FAIL][94] ([i915#694])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-hsw5/igt@gem_tiled_blits@normal.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][95] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][96] ([fdo#110789] / [fdo#111870] / [i915#478])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][97] ([i915#468]) -> [FAIL][98] ([i915#454])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][99] ([i915#454]) -> [SKIP][100] ([i915#468])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7882/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1171]: https://gitlab.freedesktop.org/drm/intel/issues/1171
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1180]: https://gitlab.freedesktop.org/drm/intel/issues/1180
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5423 -> IGTPW_4109
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7882: bc62c7b88481f1c427fed468264ef0674fc1e8ba @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4109: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/index.html
  IGT_5423: 02ef996e76b3bae1c62d6a1298462aba0b7ac51a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4109/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
