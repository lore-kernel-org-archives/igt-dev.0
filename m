Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Jun 2020 18:42:20 -0000
Message-ID: <159112334016.21430.18408789608383274835@emeril.freedesktop.org>
References: <20200602111330.910039-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200602111330.910039-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_lib/igt=5Fdevice=5Fscan=3A_Add?=
 =?utf-8?q?_missing_Check_for_return_value_in_scan=5Fdrm=5Fdevices?=
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

Series: series starting with [i-g-t,1/4] lib/igt_device_scan: Add missing Check for return value in scan_drm_devices
URL   : https://patchwork.freedesktop.org/series/77914/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8571_full -> IGTPW_4640_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/index.html

Known issues
------------

  Here are the changes found in IGTPW_4640_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][1] -> [FAIL][2] ([i915#1119] / [i915#118] / [i915#95])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#54])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#54]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#1925] / [i915#1926])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-glk7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@pipe-c-torture-move:
    - shard-hsw:          [PASS][15] -> [DMESG-WARN][16] ([i915#128])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-hsw1/igt@kms_cursor_legacy@pipe-c-torture-move.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-hsw1/igt@kms_cursor_legacy@pipe-c-torture-move.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109349])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#52] / [i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-glk:          [PASS][23] -> [TIMEOUT][24] ([i915#1958]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-c:
    - shard-glk:          [PASS][27] -> [INCOMPLETE][28] ([i915#1927] / [i915#58] / [k.org#198133])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-c.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-glk8/igt@kms_universal_plane@universal-plane-gen9-features-pipe-c.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#331])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#331])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-glk:          [TIMEOUT][35] ([i915#1958]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk6/igt@gem_exec_reloc@basic-cpu-read.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-glk1/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][37] ([i915#1436] / [i915#716]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-glk5/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [DMESG-WARN][39] ([i915#1436] / [i915#716]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][41] ([i915#1899]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-iclb:         [INCOMPLETE][43] ([i915#189]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-iclb4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][45] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-apl:          [FAIL][47] ([i915#70] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl6/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
    - shard-kbl:          [FAIL][49] ([i915#70] / [i915#93] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][51] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][53] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][55] ([i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl8/igt@kms_draw_crc@fill-fb.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl7/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][57] ([i915#64] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl7/igt@kms_fbcon_fbt@fbc.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][59] ([i915#1525] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl1/igt@kms_fbcon_fbt@fbc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl1/igt@kms_fbcon_fbt@fbc.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][61] ([i915#79]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-vga1-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][63] ([i915#1927] / [i915#61]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-hsw8/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-vga1-hdmi-a1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-hsw1/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-vga1-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [FAIL][69] ([i915#83]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-tglb6/igt@kms_panel_fitting@atomic-fastset.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-tglb7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [FAIL][71] ([i915#83]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][75] ([i915#1899]) -> [FAIL][76] ([i915#454])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][77] ([i915#1319] / [i915#1635]) -> [TIMEOUT][78] ([i915#1319])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl6/igt@kms_content_protection@legacy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][79] ([fdo#110321]) -> [DMESG-FAIL][80] ([fdo#110321])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl6/igt@kms_content_protection@srm.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][81] ([i915#54] / [i915#93] / [i915#95]) -> [FAIL][82] ([i915#54])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-glk:          [SKIP][83] ([fdo#109271]) -> [TIMEOUT][84] ([i915#1958])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-glk7/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [FAIL][85] ([fdo#108145] / [i915#265]) -> [FAIL][86] ([fdo#108145] / [i915#265] / [i915#95])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [FAIL][87] ([fdo#108145] / [i915#265]) -> [FAIL][88] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5690 -> IGTPW_4640
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8571: 0536dff30eff69abcf6355bdd9b9fdf45a560099 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4640: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/index.html
  IGT_5690: bea881189520a9cccbb1c1cb454ac5b6fdaea40e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4640/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
