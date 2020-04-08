Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Apr 2020 01:04:21 -0000
Message-ID: <158630786152.19346.11849658233081620202@emeril.freedesktop.org>
References: <20200407163525.75416-1-jose.souza@intel.com>
In-Reply-To: <20200407163525.75416-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv6=2C1/2=5D_tests/kms=5Ffbcon=5Ffbt?=
 =?utf-8?q?=3A_Reduce_execution_time?=
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
To: "Souza, Jose" <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v6,1/2] tests/kms_fbcon_fbt: Reduce execution time
URL   : https://patchwork.freedesktop.org/series/75628/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8266_full -> IGTPW_4427_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/index.html

Known issues
------------

  Here are the changes found in IGTPW_4427_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-iclb8/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rpm@fences:
    - shard-tglb:         [PASS][3] -> [SKIP][4] ([i915#1316] / [i915#579])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-tglb8/igt@i915_pm_rpm@fences.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-tglb7/igt@i915_pm_rpm@fences.html
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#1316] / [i915#579])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-iclb1/igt@i915_pm_rpm@fences.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-iclb4/igt@i915_pm_rpm@fences.html
    - shard-hsw:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-hsw4/igt@i915_pm_rpm@fences.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-hsw8/igt@i915_pm_rpm@fences.html
    - shard-glk:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-glk8/igt@i915_pm_rpm@fences.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-glk4/igt@i915_pm_rpm@fences.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#54]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#54]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#72])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#177] / [i915#52] / [i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#52] / [i915#54]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#52] / [i915#54] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#93] / [i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#46])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-glk1/igt@kms_flip@flip-vs-expired-vblank.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#699] / [i915#93] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][39] -> [INCOMPLETE][40] ([i915#155] / [i915#648])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][43] -> [FAIL][44] ([fdo#108145] / [i915#265] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#1559] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#1559] / [i915#93] / [i915#95])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][49] -> [FAIL][50] ([i915#1031] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-apl8/igt@kms_prime@basic-crc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-apl1/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][51] -> [FAIL][52] ([i915#1031] / [i915#93] / [i915#95])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl6/igt@kms_prime@basic-crc.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl2/igt@kms_prime@basic-crc.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][53] -> [FAIL][54] ([i915#173])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-iclb5/igt@kms_psr@no_drrs.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#109441]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][57] -> [DMESG-WARN][58] ([i915#180]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [SKIP][59] ([i915#1316] / [i915#579]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-tglb7/igt@i915_pm_rpm@i2c.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-tglb5/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [SKIP][61] ([fdo#109271]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-glk7/igt@i915_pm_rpm@i2c.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-glk7/igt@i915_pm_rpm@i2c.html
    - shard-hsw:          [SKIP][63] ([fdo#109271]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-hsw1/igt@i915_pm_rpm@i2c.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-hsw6/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [SKIP][65] ([i915#1316] / [i915#579]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-iclb5/igt@i915_pm_rpm@i2c.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-iclb3/igt@i915_pm_rpm@i2c.html

  * igt@i915_selftest@live@gem_contexts:
    - shard-kbl:          [INCOMPLETE][67] ([i915#1591] / [i915#794]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl4/igt@i915_selftest@live@gem_contexts.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl2/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gtt:
    - shard-kbl:          [DMESG-FAIL][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl4/igt@i915_selftest@live@gtt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl2/igt@i915_selftest@live@gtt.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@addfb25-x-tiled:
    - shard-kbl:          [SKIP][73] ([fdo#109271]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl4/igt@kms_addfb_basic@addfb25-x-tiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl1/igt@kms_addfb_basic@addfb25-x-tiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][75] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [FAIL][77] ([i915#54] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][81] ([i915#72]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [FAIL][83] ([i915#52] / [i915#54]) -> [PASS][84] +6 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-glk:          [FAIL][85] ([i915#1121] / [i915#64]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-glk8/igt@kms_fbcon_fbt@fbc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-glk5/igt@kms_fbcon_fbt@fbc.html
    - shard-iclb:         [FAIL][87] ([i915#1121]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-iclb4/igt@kms_fbcon_fbt@fbc.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-iclb1/igt@kms_fbcon_fbt@fbc.html
    - shard-tglb:         [FAIL][89] ([i915#64]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-tglb8/igt@kms_fbcon_fbt@fbc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-tglb6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][91] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][93] ([i915#1559] / [i915#95]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][95] ([i915#899]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][97] ([fdo#109441]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][99] ([i915#1542]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-iclb7/igt@perf@blocking-parameterized.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-iclb5/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][101] ([i915#1542]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-hsw6/igt@perf@polling-parameterized.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-hsw6/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-snb:          [INCOMPLETE][103] ([i915#82]) -> [SKIP][104] ([fdo#109271])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-snb1/igt@i915_pm_dc@dc5-psr.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-snb6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rpm@gem-mmap-type:
    - shard-snb:          [SKIP][105] ([fdo#109271]) -> [INCOMPLETE][106] ([i915#82])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-snb6/igt@i915_pm_rpm@gem-mmap-type.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-snb6/igt@i915_pm_rpm@gem-mmap-type.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          [SKIP][107] ([fdo#109271]) -> [SKIP][108] ([fdo#109271] / [fdo#111827])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-kbl2/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-WARN][109] ([i915#180] / [i915#95]) -> [DMESG-FAIL][110] ([i915#180] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-hsw:          [SKIP][111] ([fdo#109271]) -> [INCOMPLETE][112] ([i915#61])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8266/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/shard-hsw8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1591]: https://gitlab.freedesktop.org/drm/intel/issues/1591
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5575 -> IGTPW_4427
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8266: 0a87487ec64e737ec508dda4dd57662857e65f85 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4427: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/index.html
  IGT_5575: 75641939835558eb3e338a70f12025c19afcb896 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4427/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
