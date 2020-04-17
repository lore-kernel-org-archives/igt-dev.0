Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Apr 2020 18:14:20 -0000
Message-ID: <158714726073.10464.10894572632301812541@emeril.freedesktop.org>
References: <20200416172933.30533-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200416172933.30533-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Allow_modeset_to_survive_change_of_cdclk?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_big_fb: Allow modeset to survive change of cdclk
URL   : https://patchwork.freedesktop.org/series/76042/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8311_full -> IGTPW_4478_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/index.html

Known issues
------------

  Here are the changes found in IGTPW_4478_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-glk:          [PASS][1] -> [SKIP][2] ([fdo#109271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk4/igt@i915_pm_rpm@modeset-non-lpsp.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-glk1/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-hsw:          [PASS][3] -> [SKIP][4] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-hsw6/igt@i915_pm_rpm@modeset-non-lpsp.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-hsw7/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#57])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#52] / [i915#54]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([fdo#108145] / [i915#265] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109441]) +5 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#31])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-hsw4/igt@kms_setmode@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-hsw4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#1085])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-tglb1/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@processes:
    - shard-tglb:         [FAIL][25] ([i915#1528]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb1/igt@gem_ctx_persistence@processes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-tglb1/igt@gem_ctx_persistence@processes.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][27] ([i915#180]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-kbl3/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][29] ([i915#454]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-glk:          [SKIP][31] ([fdo#109271]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk8/igt@i915_pm_rpm@basic-pci-d3-state.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-glk4/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-iclb:         [SKIP][33] ([i915#1316] / [i915#579]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb7/igt@i915_pm_rpm@basic-pci-d3-state.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-iclb1/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-hsw:          [SKIP][35] ([fdo#109271]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-hsw1/igt@i915_pm_rpm@basic-pci-d3-state.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-hsw4/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-tglb:         [SKIP][37] ([i915#1316] / [i915#579]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb7/igt@i915_pm_rpm@basic-pci-d3-state.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-tglb2/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [FAIL][39] ([i915#54]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-kbl:          [FAIL][41] ([i915#54]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][43] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][47] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][49] ([i915#52] / [i915#54]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * {igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][51] ([i915#61]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-hsw4/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-hsw7/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html

  * {igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2}:
    - shard-glk:          [FAIL][53] ([i915#79]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [INCOMPLETE][55] ([i915#1185] / [i915#250]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][57] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][59] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_prime@basic-crc:
    - shard-kbl:          [FAIL][61] ([i915#1031] / [i915#93] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl1/igt@kms_prime@basic-crc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-kbl3/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][63] ([fdo#109441]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][65] ([i915#456]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][67] ([i915#468]) -> [FAIL][68] ([i915#454])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         [SKIP][69] ([fdo#110892]) -> [SKIP][70] ([i915#1316] / [i915#579])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-tglb:         [SKIP][71] ([fdo#111644] / [i915#1397]) -> [SKIP][72] ([IGT#35] / [i915#1316] / [i915#579])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_plane_scaling@pipe-c-scaler-with-pixel-format:
    - shard-kbl:          [FAIL][73] ([i915#1735]) -> [FAIL][74] ([i915#1735] / [i915#93] / [i915#95])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl2/igt@kms_plane_scaling@pipe-c-scaler-with-pixel-format.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-kbl4/igt@kms_plane_scaling@pipe-c-scaler-with-pixel-format.html
    - shard-apl:          [FAIL][75] ([i915#1735]) -> [FAIL][76] ([i915#1735] / [i915#95])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-apl7/igt@kms_plane_scaling@pipe-c-scaler-with-pixel-format.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-apl7/igt@kms_plane_scaling@pipe-c-scaler-with-pixel-format.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][77] ([i915#31] / [i915#93] / [i915#95]) -> [FAIL][78] ([i915#31])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8311/shard-kbl4/igt@kms_setmode@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/shard-kbl2/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#35]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/35
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1735]: https://gitlab.freedesktop.org/drm/intel/issues/1735
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5593 -> IGTPW_4478
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8311: 19367bb5e65eaf0719597b3ff244fd1c2ea12bda @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4478: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/index.html
  IGT_5593: 1c658f5e46598ae93345177d4981ef54704daec6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4478/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
