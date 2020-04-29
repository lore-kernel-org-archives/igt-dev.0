Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Apr 2020 21:40:06 -0000
Message-ID: <158819640613.6698.977151271459389942@emeril.freedesktop.org>
References: <20200429145113.588577-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200429145113.588577-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcGVyZjog?=
 =?utf-8?q?Flush_the_work_between_rounds_of_gen8-unprivileged-single-ctx-c?=
 =?utf-8?q?ounter_=28rev2=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: perf: Flush the work between rounds of gen8-unprivileged-single-ctx-counter (rev2)
URL   : https://patchwork.freedesktop.org/series/76732/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8392_full -> IGTPW_4516_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/index.html

Known issues
------------

  Here are the changes found in IGTPW_4516_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl4/igt@i915_suspend@forcewake.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#1119] / [i915#93] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl4/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#72])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-hsw:          [PASS][11] -> [INCOMPLETE][12] ([i915#61])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-hsw8/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-hsw2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#1566] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([fdo#108145] / [i915#265] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#1031] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl4/igt@kms_prime@basic-crc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-apl3/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#1031] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl4/igt@kms_prime@basic-crc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl3/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#31])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl1/igt@kms_setmode@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl4/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][29] ([fdo#109276]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [DMESG-WARN][31] ([i915#1436] / [i915#716]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl3/igt@gen9_exec_parse@allowed-single.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl2/igt@gen9_exec_parse@allowed-single.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [FAIL][33] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-apl:          [FAIL][35] ([i915#54] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][37] ([i915#165] / [i915#180]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][39] ([fdo#109349]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][41] ([i915#52] / [i915#54]) -> [PASS][42] +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][43] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][45] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [FAIL][47] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [FAIL][49] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-kbl:          [FAIL][53] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl2/igt@kms_hdr@bpc-switch-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-apl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][57] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][59] ([i915#1559] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][61] ([fdo#109642] / [fdo#111068]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb8/igt@kms_psr2_su@frontbuffer.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][63] ([fdo#109441]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@polling:
    - shard-glk:          [SKIP][65] ([fdo#109271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-glk9/igt@perf@polling.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-glk2/igt@perf@polling.html
    - shard-tglb:         [SKIP][67] ([i915#405]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-tglb6/igt@perf@polling.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-tglb2/igt@perf@polling.html
    - shard-apl:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl8/igt@perf@polling.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-apl2/igt@perf@polling.html
    - shard-kbl:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl3/igt@perf@polling.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl1/igt@perf@polling.html
    - shard-hsw:          [SKIP][73] ([fdo#109271]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-hsw4/igt@perf@polling.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-hsw8/igt@perf@polling.html
    - shard-iclb:         [SKIP][75] ([i915#405]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb6/igt@perf@polling.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-iclb2/igt@perf@polling.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][77] ([i915#1542]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-hsw8/igt@perf@polling-parameterized.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-hsw1/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [INCOMPLETE][80] ([i915#155])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [INCOMPLETE][81] ([i915#82]) -> [SKIP][82] ([fdo#109271])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-snb5/igt@i915_pm_dc@dc6-psr.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-snb5/igt@i915_pm_dc@dc6-psr.html
    - shard-tglb:         [FAIL][83] ([i915#454]) -> [SKIP][84] ([i915#468]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5614 -> IGTPW_4516
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8392: c5ceaac881b4dc4eca6473abeb27342663c898d3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4516: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/index.html
  IGT_5614: d095827add11d4e8158b87683971ee659749d9a4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4516/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
