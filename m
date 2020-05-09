Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 09 May 2020 02:14:54 -0000
Message-ID: <158899049418.12068.2449917987828896217@emeril.freedesktop.org>
References: <20200509002124.3174-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200509002124.3174-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?b?ZW1fc3Bpbl9iYXRjaDogVXNlIF9fZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5l?=
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_spin_batch: Use __for_each_physical_engine
URL   : https://patchwork.freedesktop.org/series/77091/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8455_full -> IGTPW_4551_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/index.html

Known issues
------------

  Here are the changes found in IGTPW_4551_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-glk:          [PASS][1] -> [FAIL][2] ([i915#118] / [i915#70] / [i915#95])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#699] / [i915#93] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [PASS][7] -> [SKIP][8] ([i915#668]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][9] -> [SKIP][10] ([i915#433])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#173])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-iclb6/igt@kms_psr@no_drrs.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109441]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_sequence@get-forked:
    - shard-hsw:          [PASS][17] -> [INCOMPLETE][18] ([i915#61])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-hsw4/igt@kms_sequence@get-forked.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-hsw1/igt@kms_sequence@get-forked.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#1602])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-tglb5/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-tglb6/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][21] ([fdo#109276]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][23] ([i915#180]) -> [PASS][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl1/igt@i915_suspend@sysfs-reader.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [FAIL][25] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [FAIL][27] ([i915#118] / [i915#70] / [i915#95]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [FAIL][29] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [FAIL][31] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-kbl:          [DMESG-WARN][33] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend@b-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][35] ([i915#61]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-hsw2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-hsw1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][37] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [FAIL][39] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [FAIL][41] ([i915#1559] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][43] ([fdo#109642] / [fdo#111068]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-iclb1/igt@kms_psr2_su@frontbuffer.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][45] ([fdo#109441]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][47] ([i915#31]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl1/igt@kms_setmode@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl2/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-snb:          [SKIP][49] ([fdo#109271]) -> [INCOMPLETE][50] ([i915#82]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-snb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-snb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][51] ([i915#1319]) -> [FAIL][52] ([fdo#110321] / [fdo#110336]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][53] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][54] ([i915#1319])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl4/igt@kms_content_protection@legacy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][55] ([i915#1319]) -> [FAIL][56] ([fdo#110321])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl6/igt@kms_content_protection@srm.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][57] ([i915#1121] / [i915#93] / [i915#95]) -> [FAIL][58] ([i915#64])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][59] ([i915#1121] / [i915#95]) -> [FAIL][60] ([i915#1525])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl6/igt@kms_fbcon_fbt@fbc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl1/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][61] ([i915#1525]) -> [FAIL][62] ([i915#1121] / [i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][63] ([i915#64]) -> [FAIL][64] ([i915#1121] / [i915#93] / [i915#95])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][65] ([fdo#108145] / [i915#265]) -> [FAIL][66] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
    - shard-apl:          [FAIL][67] ([fdo#108145] / [i915#265]) -> [FAIL][68] ([fdo#108145] / [i915#265] / [i915#95])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5642 -> IGTPW_4551
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8455: 0fa901c0a0e4f6e0ab2821f7b26c417539cecd08 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4551: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/index.html
  IGT_5642: d1ce4abb01c70f7be6e777b6d45442663c4b830e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4551/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
