Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 26 May 2020 11:01:03 -0000
Message-ID: <159049086389.28044.16491221652524554862@emeril.freedesktop.org>
References: <20200526081451.2045-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200526081451.2045-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgTWFrZSBn?=
 =?utf-8?q?em=5Fmedia=5Fvme_libdrm-free?=
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

Series: Make gem_media_vme libdrm-free
URL   : https://patchwork.freedesktop.org/series/77651/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8535_full -> IGTPW_4610_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4610_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4610_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4610_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-glk:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-glk9/igt@gem_mmap_gtt@basic-small-bo.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-glk6/igt@gem_mmap_gtt@basic-small-bo.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_reloc@basic-concurrent16}:
    - shard-glk:          NOTRUN -> [TIMEOUT][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-glk6/igt@gem_exec_reloc@basic-concurrent16.html

  
Known issues
------------

  Here are the changes found in IGTPW_4610_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-glk:          [PASS][4] -> [TIMEOUT][5] ([i915#1930])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-glk9/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][6] -> [FAIL][7] ([i915#1899])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl2/igt@i915_suspend@debugfs-reader.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#1119] / [i915#93] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#1119] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#1119] / [i915#118] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-glk4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#54])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#54])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#54])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-glk:          [PASS][24] -> [INCOMPLETE][25] ([i915#58] / [k.org#198133])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#1566] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109349])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#52] / [i915#54] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][36] -> [FAIL][37] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][38] -> [SKIP][39] ([i915#433])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][40] -> [FAIL][41] ([i915#1559] / [i915#93] / [i915#95])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [PASS][42] -> [FAIL][43] ([i915#1559] / [i915#95])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109441]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([i915#31])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl6/igt@kms_setmode@basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl3/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][48] -> [INCOMPLETE][49] ([i915#155])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Possible fixes ####

  * {igt@gem_exec_reloc@basic-concurrent16}:
    - shard-snb:          [FAIL][50] ([i915#1930]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][52] ([i915#1904]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][54] ([i915#1119] / [i915#95]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][56] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][58] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][60] ([i915#1925]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-glk4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][62] ([fdo#109441]) -> [PASS][63] +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-iclb3/igt@kms_psr@psr2_cursor_render.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65] +6 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][68] ([i915#1319]) -> [FAIL][69] ([fdo#110321] / [fdo#110336])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-apl7/igt@kms_content_protection@atomic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][70] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][71] ([i915#1319])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-apl8/igt@kms_content_protection@legacy.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][72] ([i915#1319] / [i915#1635]) -> [FAIL][73] ([fdo#110321] / [i915#95])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-apl8/igt@kms_content_protection@lic.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-apl4/igt@kms_content_protection@lic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][74] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][75] ([fdo#108145] / [i915#265])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [FAIL][76] ([i915#608]) -> [SKIP][77] ([i915#1911])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8535/shard-tglb7/igt@kms_psr2_su@page_flip.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/shard-tglb5/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5678 -> IGTPW_4610
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8535: 2b29b968529189aeb528fcb20b1b3e41ab0391e3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4610: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/index.html
  IGT_5678: c1f30ee09ac2e7eb3e8e90245239731a169a6050 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4610/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
