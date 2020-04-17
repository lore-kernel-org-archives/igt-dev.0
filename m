Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Apr 2020 14:26:38 -0000
Message-ID: <158713359858.10464.7526178795644250873@emeril.freedesktop.org>
References: <20200416131915.533-1-mika.kahola@intel.com>
In-Reply-To: <20200416131915.533-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_Wait_for_an_extra_vblank_=28rev5=29?=
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

Series: tests/kms_cursor_legacy: Wait for an extra vblank (rev5)
URL   : https://patchwork.freedesktop.org/series/75413/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8311_full -> IGTPW_4477_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4477_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4477_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4477_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-tglb:         [FAIL][3] ([i915#1602]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb7/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-tglb2/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4477_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#183])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl1/igt@gem_tiled_swapping@non-threaded.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl7/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#1066])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#1316] / [i915#579])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-iclb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-tglb:         [PASS][11] -> [SKIP][12] ([i915#1316] / [i915#579])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-tglb8/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#39])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk4/igt@i915_pm_rps@min-max-config-loaded.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-glk4/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#70] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#70] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl2/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl1/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#1566] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#52] / [i915#54]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#52] / [i915#54] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl3/igt@kms_draw_crc@fill-fb.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl6/igt@kms_draw_crc@fill-fb.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#93] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl7/igt@kms_mmap_write_crc@main.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl3/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#1559] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#1559] / [i915#93] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][49] -> [FAIL][50] ([i915#31])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-hsw4/igt@kms_setmode@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-hsw1/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][51] -> [FAIL][52] ([i915#1085])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-tglb5/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@processes:
    - shard-tglb:         [FAIL][53] ([i915#1528]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb1/igt@gem_ctx_persistence@processes.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-tglb5/igt@gem_ctx_persistence@processes.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][57] ([i915#454]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-glk:          [SKIP][59] ([fdo#109271]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk8/igt@i915_pm_rpm@basic-pci-d3-state.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-glk4/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-iclb:         [SKIP][61] ([i915#1316] / [i915#579]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb7/igt@i915_pm_rpm@basic-pci-d3-state.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-iclb7/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-hsw:          [SKIP][63] ([fdo#109271]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-hsw1/igt@i915_pm_rpm@basic-pci-d3-state.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-hsw1/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-tglb:         [SKIP][65] ([i915#1316] / [i915#579]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb7/igt@i915_pm_rpm@basic-pci-d3-state.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-tglb2/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-kbl:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][71] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][75] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][77] ([i915#52] / [i915#54]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * {igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][79] ([i915#61]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-hsw4/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-hsw4/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html

  * {igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2}:
    - shard-glk:          [FAIL][81] ([i915#79]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [INCOMPLETE][83] ([i915#1185] / [i915#250]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][85] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][87] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_prime@basic-crc:
    - shard-kbl:          [FAIL][89] ([i915#1031] / [i915#93] / [i915#95]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl1/igt@kms_prime@basic-crc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl3/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92] +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb1/igt@kms_psr@psr2_cursor_render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][93] ([i915#456]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][95] ([i915#468]) -> [FAIL][96] ([i915#454])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][97] ([i915#357]) -> [FAIL][98] ([i915#357] / [i915#93] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl2/igt@kms_content_protection@uevent.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][99] ([i915#357]) -> [FAIL][100] ([i915#357] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl4/igt@kms_content_protection@uevent.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl8/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][101] ([i915#95]) -> [FAIL][102] ([i915#1525])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][103] ([i915#93] / [i915#95]) -> [FAIL][104] ([i915#64])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][105] ([i915#31] / [i915#93] / [i915#95]) -> [FAIL][106] ([i915#31])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl4/igt@kms_setmode@basic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/shard-kbl1/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#183]: https://gitlab.freedesktop.org/drm/intel/issues/183
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5593 -> IGTPW_4477
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8311: 19367bb5e65eaf0719597b3ff244fd1c2ea12bda @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4477: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/index.html
  IGT_5593: 1c658f5e46598ae93345177d4981ef54704daec6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4477/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
