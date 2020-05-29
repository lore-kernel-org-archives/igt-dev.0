Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 29 May 2020 13:24:29 -0000
Message-ID: <159075866984.3333.3363602550923775876@emeril.freedesktop.org>
References: <20200529104127.9569-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200529104127.9569-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgUmVtb3Zl?=
 =?utf-8?q?_=5Fv2_functions_in_gpu_pipelines?=
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

Series: Remove _v2 functions in gpu pipelines
URL   : https://patchwork.freedesktop.org/series/77782/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8552_full -> IGTPW_4623_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/index.html

Known issues
------------

  Here are the changes found in IGTPW_4623_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-glk:          [PASS][1] -> [TIMEOUT][2] ([i915#1958]) +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-glk7/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-glk2/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#54])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-hsw:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-hsw4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-hsw8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([fdo#108145] / [i915#265] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109441]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-mixed-process@rcs0:
    - shard-apl:          [FAIL][19] ([i915#1528]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-apl2/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-hsw:          [INCOMPLETE][21] ([i915#61]) -> [PASS][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-hsw8/igt@gem_exec_whisper@basic-fds-forked-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-hsw2/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][23] ([i915#1904]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][25] ([i915#1899]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-iclb1/igt@i915_pm_dc@dc5-psr.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-iclb2/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][27] ([i915#180]) -> [PASS][28] +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-apl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [FAIL][29] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-glk:          [TIMEOUT][31] ([i915#1958]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [DMESG-FAIL][33] ([i915#1926]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-kbl:          [FAIL][35] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][37] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-snb:          [DMESG-WARN][39] ([i915#42]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-snb5/igt@kms_fbcon_fbt@fbc-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-snb2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-snb:          [SKIP][41] ([fdo#109271]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][43] ([i915#433]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [FAIL][45] ([i915#83]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][47] ([i915#180] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][49] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][51] ([i915#1559] / [i915#95]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][55] ([i915#155]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][57] ([i915#1542]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-iclb1/igt@perf@blocking-parameterized.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-iclb6/igt@perf@blocking-parameterized.html
    - shard-hsw:          [FAIL][59] ([i915#1542]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-hsw8/igt@perf@blocking-parameterized.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-hsw4/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-glk:          [TIMEOUT][61] ([i915#1958]) -> [SKIP][62] ([fdo#109271]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-glk4/igt@i915_pm_dc@dc6-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-glk5/igt@i915_pm_dc@dc6-dpms.html
    - shard-tglb:         [FAIL][63] ([i915#454]) -> [SKIP][64] ([i915#468])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][65] ([i915#468]) -> [FAIL][66] ([i915#454])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][67] ([i915#1319] / [i915#1635]) -> [FAIL][68] ([fdo#110321] / [fdo#110336])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-apl1/igt@kms_content_protection@atomic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [FAIL][69] ([fdo#110321] / [i915#93] / [i915#95]) -> [TIMEOUT][70] ([i915#1319])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-kbl2/igt@kms_content_protection@lic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][71] ([fdo#110321]) -> [TIMEOUT][72] ([i915#1319] / [i915#1635])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-apl4/igt@kms_content_protection@srm.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-apl4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][73] ([i915#1925]) -> [DMESG-FAIL][74] ([i915#1925] / [i915#1926]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8552/shard-glk2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/shard-glk4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5683 -> IGTPW_4623
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8552: cd4a9b47339259e3a98601fff14438f17fd2d7dc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4623: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/index.html
  IGT_5683: 757b6e72d546fd2dbc3801a73796d67b0854021b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4623/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
