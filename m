Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 15:06:22 -0000
Message-ID: <158990078201.31237.17383419599047186714@emeril.freedesktop.org>
References: <20200519094821.29150-1-petri.latvala@intel.com>
In-Reply-To: <20200519094821.29150-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Don=27t_use_igt=5Ffixture_in_an_exit_handler?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_flip: Don't use igt_fixture in an exit handler
URL   : https://patchwork.freedesktop.org/series/77405/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8501_full -> IGTPW_4584_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/index.html

Known issues
------------

  Here are the changes found in IGTPW_4584_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#1436] / [i915#716])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl3/igt@gen9_exec_parse@allowed-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#165] / [i915#78])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-kbl2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#1566] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][9] -> [SKIP][10] ([i915#433])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-kbl1/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#1559] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1559] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-iclb1/igt@kms_psr@psr2_no_drrs.html

  
#### Possible fixes ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][21] ([i915#1904]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [FAIL][23] ([i915#71]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl6/igt@kms_color@pipe-c-degamma.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-apl8/igt@kms_color@pipe-c-degamma.html
    - shard-glk:          [FAIL][25] ([i915#71]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk7/igt@kms_color@pipe-c-degamma.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-glk6/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [FAIL][27] ([i915#71]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_color@pipe-c-degamma.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-kbl4/igt@kms_color@pipe-c-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][29] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [FAIL][31] ([i915#1121]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb5/igt@kms_fbcon_fbt@psr-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-tglb2/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][33] ([i915#79]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [FAIL][39] ([i915#1559] / [i915#95]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [FAIL][41] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][43] ([fdo#109642] / [fdo#111068]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb1/igt@kms_psr2_su@frontbuffer.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][45] ([fdo#109441]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][47] ([i915#1542]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb7/igt@perf@polling-parameterized.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-tglb2/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][49] ([i915#1319]) -> [FAIL][50] ([fdo#110321] / [fdo#110336] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl3/igt@kms_content_protection@atomic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/shard-apl4/igt@kms_content_protection@atomic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5659 -> IGTPW_4584
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8501: c6bfff03c22fb90dcf1ddacb745667467ab5ab73 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4584: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/index.html
  IGT_5659: 66ab5e42811fee3dea8c21ab29e70e323a0650de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4584/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
