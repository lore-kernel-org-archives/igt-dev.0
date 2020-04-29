Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Apr 2020 22:31:50 -0000
Message-ID: <158819951098.6699.5581830007786596747@emeril.freedesktop.org>
References: <20200429154902.201712-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200429154902.201712-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVGVzdCBt?=
 =?utf-8?q?odeseting_with_imported_prime_buffer_between_any_two_devices?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Test modeseting with imported prime buffer between any two devices
URL   : https://patchwork.freedesktop.org/series/76734/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8392_full -> IGTPW_4517_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4517_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4517_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4517_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_pm:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl8/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl6/igt@i915_selftest@live@gt_pm.html

  * {igt@kms_prime@basic-crc@first-to-second} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-iclb3/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-tglb7/igt@kms_prime@basic-crc@first-to-second.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8392_full and IGTPW_4517_full:

### New IGT tests (2) ###

  * igt@kms_prime@basic-crc@first-to-second:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_prime@basic-crc@second-to-first:
    - Statuses : 7 pass(s)
    - Exec time: [0.71, 1.32] s

  

Known issues
------------

  Here are the changes found in IGTPW_4517_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl2/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#370])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb4/igt@i915_pm_rps@min-max-config-loaded.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-iclb2/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([fdo#108145] / [i915#71])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-glk4/igt@kms_color@pipe-a-legacy-gamma.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-glk5/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#72])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@pipe-b-torture-bo:
    - shard-iclb:         [PASS][17] -> [DMESG-WARN][18] ([i915#128])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb1/igt@kms_cursor_legacy@pipe-b-torture-bo.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-iclb7/igt@kms_cursor_legacy@pipe-b-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#52] / [i915#54]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1559] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#1559] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl1/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-glk:          [PASS][31] -> [INCOMPLETE][32] ([i915#58] / [k.org#198133])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-hsw:          [PASS][33] -> [INCOMPLETE][34] ([i915#61])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][35] ([fdo#109276]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [DMESG-WARN][37] ([i915#1436] / [i915#716]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl3/igt@gen9_exec_parse@allowed-single.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl4/igt@gen9_exec_parse@allowed-single.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [FAIL][39] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-apl:          [FAIL][41] ([i915#54] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][43] ([i915#165] / [i915#180]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [FAIL][45] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][47] ([i915#52] / [i915#54]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][49] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][51] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [FAIL][53] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [FAIL][55] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-kbl:          [FAIL][59] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl2/igt@kms_hdr@bpc-switch-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][63] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][65] ([i915#1559] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@polling:
    - shard-tglb:         [SKIP][69] ([i915#405]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-tglb6/igt@perf@polling.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-tglb8/igt@perf@polling.html
    - shard-apl:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl8/igt@perf@polling.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl7/igt@perf@polling.html
    - shard-kbl:          [SKIP][73] ([fdo#109271]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl3/igt@perf@polling.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl7/igt@perf@polling.html
    - shard-hsw:          [SKIP][75] ([fdo#109271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-hsw4/igt@perf@polling.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-hsw2/igt@perf@polling.html
    - shard-iclb:         [SKIP][77] ([i915#405]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-iclb6/igt@perf@polling.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-iclb1/igt@perf@polling.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [INCOMPLETE][79] ([i915#82]) -> [SKIP][80] ([fdo#109271])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-snb5/igt@i915_pm_dc@dc6-psr.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-snb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][81] ([i915#95]) -> [FAIL][82] ([i915#1525])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][83] ([i915#93] / [i915#95]) -> [FAIL][84] ([i915#64])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][85] ([fdo#108145] / [i915#265]) -> [FAIL][86] ([fdo#108145] / [i915#265] / [i915#95])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][87] ([fdo#108145] / [i915#265]) -> [FAIL][88] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8392/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#370]: https://gitlab.freedesktop.org/drm/intel/issues/370
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5614 -> IGTPW_4517
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8392: c5ceaac881b4dc4eca6473abeb27342663c898d3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4517: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/index.html
  IGT_5614: d095827add11d4e8158b87683971ee659749d9a4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4517/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
