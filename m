Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 21 May 2020 22:25:27 -0000
Message-ID: <159009992760.4441.6580786363170583517@emeril.freedesktop.org>
References: <20200521074823.18632-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200521074823.18632-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQ2hhbmdl?=
 =?utf-8?q?_media_fill_to_be_libdrm-free?=
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

Series: Change media fill to be libdrm-free
URL   : https://patchwork.freedesktop.org/series/77501/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8516_full -> IGTPW_4605_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/index.html

Known issues
------------

  Here are the changes found in IGTPW_4605_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#1436] / [i915#716])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl2/igt@gen9_exec_parse@allowed-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-apl3/igt@gen9_exec_parse@allowed-all.html
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#1436] / [i915#716])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-glk:          [PASS][9] -> [INCOMPLETE][10] ([i915#58] / [k.org#198133])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-glk8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#1121])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-tglb2/igt@kms_fbcon_fbt@fbc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-tglb8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#699] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#1602])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-tglb6/igt@kms_hdr@bpc-switch-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-tglb1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([fdo#108145] / [i915#265] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-apl:          [DMESG-WARN][29] ([i915#180]) -> [PASS][30] +9 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][31] ([i915#1899]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-iclb3/igt@i915_pm_dc@dc5-psr.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [FAIL][33] ([i915#1899]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-tglb1/igt@i915_pm_dc@dc5-psr.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-tglb8/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [INCOMPLETE][35] ([i915#151] / [i915#155]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][37] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * {igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2}:
    - shard-glk:          [FAIL][39] ([i915#79]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][43] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][45] ([i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-iclb:         [INCOMPLETE][47] ([i915#1185]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-iclb3/igt@kms_hdr@bpc-switch-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-iclb7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][49] ([fdo#109441]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-iclb3/igt@kms_psr@psr2_suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][51] ([i915#31]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl2/igt@kms_setmode@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl6/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][53] ([i915#1319]) -> [FAIL][54] ([fdo#110321])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl4/igt@kms_content_protection@lic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][55] ([i915#357]) -> [FAIL][56] ([i915#357] / [i915#93] / [i915#95])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl3/igt@kms_content_protection@uevent.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][57] ([i915#357]) -> [FAIL][58] ([i915#357] / [i915#95])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl8/igt@kms_content_protection@uevent.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-apl4/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][59] ([i915#1121] / [i915#95]) -> [FAIL][60] ([i915#1525])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][61] ([i915#1121] / [i915#93] / [i915#95]) -> [FAIL][62] ([i915#64])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5665 -> IGTPW_4605
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8516: 5db9df14788c0a6038aa05e180cde8065d724e43 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4605: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/index.html
  IGT_5665: c5e5b0ce26fc321591a6d0235c639a1e8ec3cdfa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4605/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
