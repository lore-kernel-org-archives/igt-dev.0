Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 09 May 2020 00:40:54 -0000
Message-ID: <158898485495.12068.2944493392166798250@emeril.freedesktop.org>
References: <20200508220541.1796-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200508220541.1796-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaWd0L2dl?=
 =?utf-8?q?m=5Fshrink=3A_touch_each_page_in_pwrite=5F/pread=5F_=28rev3=29?=
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

Series: igt/gem_shrink: touch each page in pwrite_/pread_ (rev3)
URL   : https://patchwork.freedesktop.org/series/77085/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8455_full -> IGTPW_4550_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/index.html

Known issues
------------

  Here are the changes found in IGTPW_4550_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2] ([i915#155])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [PASS][5] -> [SKIP][6] ([i915#668]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-tglb7/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-tglb6/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][7] -> [SKIP][8] ([i915#433])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#1559] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#1559] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109441]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-iclb4/igt@kms_psr@psr2_cursor_render.html

  
#### Possible fixes ####

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][15] ([i915#180]) -> [PASS][16] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl1/igt@i915_suspend@sysfs-reader.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-apl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [FAIL][17] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [FAIL][19] ([i915#118] / [i915#70] / [i915#95]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-glk9/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [FAIL][21] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [FAIL][23] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-kbl:          [DMESG-WARN][25] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend@b-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][27] ([i915#61]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-hsw2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-hsw4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [FAIL][29] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [FAIL][31] ([i915#1559] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][33] ([fdo#109441]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][35] ([i915#31]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-hsw6/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-hsw1/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][37] ([i915#357]) -> [FAIL][38] ([i915#357] / [i915#93] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl7/igt@kms_content_protection@uevent.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][39] ([i915#357]) -> [FAIL][40] ([i915#357] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl7/igt@kms_content_protection@uevent.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][41] ([i915#1525]) -> [FAIL][42] ([i915#1121] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][43] ([i915#64]) -> [FAIL][44] ([i915#1121] / [i915#93] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][45] ([fdo#108145] / [i915#265]) -> [FAIL][46] ([fdo#108145] / [i915#265] / [i915#95]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5642 -> IGTPW_4550
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8455: 0fa901c0a0e4f6e0ab2821f7b26c417539cecd08 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4550: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/index.html
  IGT_5642: d1ce4abb01c70f7be6e777b6d45442663c4b830e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4550/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
