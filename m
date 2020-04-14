Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Apr 2020 05:59:38 -0000
Message-ID: <158684397887.30376.4062859453069200674@emeril.freedesktop.org>
References: <20200413020509.678-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200413020509.678-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaWd0L2dl?=
 =?utf-8?q?m=5Fshrink=3A_Fix_reversed_logic_when_mmap_fails?=
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/gem_shrink: Fix reversed logic when mmap fails
URL   : https://patchwork.freedesktop.org/series/75853/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8293_full -> IGTPW_4451_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4451_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4451_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4451_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-tglb6/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4451_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [PASS][2] -> [SKIP][3] ([i915#1316] / [i915#579])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-tglb6/igt@i915_pm_rpm@cursor.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-tglb6/igt@i915_pm_rpm@cursor.html
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([i915#1316] / [i915#579])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-iclb6/igt@i915_pm_rpm@cursor.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-iclb1/igt@i915_pm_rpm@cursor.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglb:         [PASS][6] -> [INCOMPLETE][7] ([i915#456] / [i915#460])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-tglb5/igt@i915_suspend@fence-restore-tiled2untiled.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-tglb6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#129])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl1/igt@kms_color@pipe-c-ctm-green-to-red.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl1/igt@kms_color@pipe-c-ctm-green-to-red.html
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#129])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl3/igt@kms_color@pipe-c-ctm-green-to-red.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl7/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#54] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#1566])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#52] / [i915#54]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_flip@nonexisting-fb:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#1297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl3/igt@kms_flip@nonexisting-fb.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl3/igt@kms_flip@nonexisting-fb.html
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#1297])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl4/igt@kms_flip@nonexisting-fb.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl1/igt@kms_flip@nonexisting-fb.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#699] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#1559] / [i915#95]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#1559] / [i915#93] / [i915#95]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109441])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#31])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl2/igt@kms_setmode@basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl3/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [PASS][38] -> [SKIP][39] ([fdo#112015]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-hsw:          [PASS][40] -> [SKIP][41] ([fdo#109271]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-hsw6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-hsw4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109278])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-iclb1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [PASS][44] -> [SKIP][45] ([fdo#109271]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-glk4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-glk2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][46] -> [DMESG-WARN][47] ([i915#180])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_create@madvise:
    - shard-hsw:          [INCOMPLETE][48] ([i915#61]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-hsw1/igt@gem_exec_create@madvise.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-hsw6/igt@gem_exec_create@madvise.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl1/igt@gem_softpin@noreloc-s3.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][52] ([i915#716]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [SKIP][54] ([i915#1316] / [i915#579]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-iclb3/igt@i915_pm_rpm@dpms-lpsp.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-iclb5/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [SKIP][56] ([i915#1316] / [i915#579]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-tglb5/igt@i915_pm_rpm@dpms-lpsp.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-tglb1/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-glk:          [SKIP][58] ([fdo#109271]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-glk1/igt@i915_pm_rpm@sysfs-read.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-glk1/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][60] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][62] ([i915#52] / [i915#54]) -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][64] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][66] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][68] ([i915#93] / [i915#95]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl7/igt@kms_mmap_write_crc@main.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl6/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [DMESG-WARN][70] ([i915#180]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][72] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][74] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][76] ([fdo#109441]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-iclb7/igt@kms_psr@psr2_primary_render.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][78] ([fdo#112015]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][80] ([fdo#109278]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][82] ([i915#658]) -> [SKIP][83] ([i915#588])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][84] ([i915#468]) -> [FAIL][85] ([i915#454])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][86] ([fdo#111644] / [i915#1397]) -> [SKIP][87] ([i915#1316] / [i915#579])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][88] ([fdo#110892]) -> [SKIP][89] ([i915#1316] / [i915#579])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-iclb4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][90] ([i915#95]) -> [DMESG-FAIL][91] ([i915#180] / [i915#95])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][92] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][93] ([fdo#108145] / [i915#265]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][94] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][95] ([fdo#108145] / [i915#265]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][96], [FAIL][97]) ([i915#1423] / [i915#716]) -> [FAIL][98] ([i915#1423])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl2/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8293/shard-apl1/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-snb-2600 pig-glk-j5005 pig-skl-6260u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5589 -> IGTPW_4451
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8293: a5f88c99deb8e117d62a1514a1efecfddb9ed52b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4451: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4451/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
