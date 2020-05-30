Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 30 May 2020 06:30:29 -0000
Message-ID: <159082022977.9480.13964688909112059197@emeril.freedesktop.org>
References: <20200530011613.45991-1-jose.souza@intel.com>
In-Reply-To: <20200530011613.45991-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fpsr2=5Fsu=3A_Read_?=
 =?utf-8?q?su_blocks_of_frame_1_if_frame_0_is_0?=
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

Series: series starting with [i-g-t,1/2] tests/kms_psr2_su: Read su blocks of frame 1 if frame 0 is 0
URL   : https://patchwork.freedesktop.org/series/77807/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8557_full -> IGTPW_4626_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/index.html

Known issues
------------

  Here are the changes found in IGTPW_4626_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][1] -> [FAIL][2] ([i915#1119] / [i915#118] / [i915#95])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-size-change:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-size-change.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@pipe-c-torture-bo:
    - shard-iclb:         [PASS][9] -> [DMESG-WARN][10] ([i915#128])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-iclb5/igt@kms_cursor_legacy@pipe-c-torture-bo.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-iclb1/igt@kms_cursor_legacy@pipe-c-torture-bo.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#699] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-snb:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#49])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#173])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-iclb4/igt@kms_psr@no_drrs.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_vblank@pipe-b-query-forked:
    - shard-hsw:          [PASS][25] -> [INCOMPLETE][26] ([i915#61])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-hsw1/igt@kms_vblank@pipe-b-query-forked.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-hsw1/igt@kms_vblank@pipe-b-query-forked.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][27] ([i915#180]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl8/igt@gem_softpin@noreloc-s3.html

  * igt@gem_vm_create@isolation:
    - shard-apl:          [TIMEOUT][29] ([i915#1635]) -> [PASS][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl7/igt@gem_vm_create@isolation.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl2/igt@gem_vm_create@isolation.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][31] ([i915#1436] / [i915#716]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][33] ([i915#1899]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [FAIL][35] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][37] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [FAIL][39] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * {igt@kms_prime@basic-crc@second-to-first}:
    - shard-apl:          [FAIL][41] ([i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl8/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [FAIL][43] ([i915#93] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [FAIL][45] ([i915#608]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-tglb6/igt@kms_psr2_su@page_flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-tglb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][47] ([fdo#109441]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][51] ([i915#588]) -> [SKIP][52] ([i915#658])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][53] ([i915#468]) -> [FAIL][54] ([i915#454])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][55] ([i915#1899]) -> [FAIL][56] ([i915#454])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][57] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][58] ([i915#1319] / [i915#1635])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl2/igt@kms_content_protection@legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][59] ([i915#1319]) -> [FAIL][60] ([fdo#110321] / [i915#93] / [i915#95])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-kbl4/igt@kms_content_protection@lic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-kbl2/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][61] ([i915#1319]) -> [FAIL][62] ([fdo#110321])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl7/igt@kms_content_protection@srm.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-WARN][63] ([i915#1926]) -> [DMESG-FAIL][64] ([i915#1925] / [i915#1926])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-glk4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-apl:          [TIMEOUT][65] ([i915#1635]) -> [SKIP][66] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][67] ([fdo#108145] / [i915#265]) -> [FAIL][68] ([fdo#108145] / [i915#265] / [i915#95])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#265]) -> [FAIL][70] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][71] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][72] ([fdo#108145] / [i915#265])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          [FAIL][73] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][74] ([fdo#108145] / [i915#265])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8557/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5684 -> IGTPW_4626
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8557: cd02c2938ef1c5e2ca72b8240918151060dfbf92 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4626: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/index.html
  IGT_5684: bd399f5eb8263bb4a84ae6a5bb1a13d329e0515d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4626/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
