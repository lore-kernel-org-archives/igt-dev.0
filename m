Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 21 May 2020 20:54:33 -0000
Message-ID: <159009447307.4442.7817084850103860073@emeril.freedesktop.org>
References: <20200521012624.400031-1-jose.souza@intel.com>
In-Reply-To: <20200521012624.400031-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?fbcon=3A_Don=27t_close_drm_fd_=28rev2=29?=
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

Series: tests/fbcon: Don't close drm fd (rev2)
URL   : https://patchwork.freedesktop.org/series/77497/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8516_full -> IGTPW_4604_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/index.html

Known issues
------------

  Here are the changes found in IGTPW_4604_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#1436] / [i915#716])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54] / [i915#93] / [i915#95]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#54])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#118] / [i915#70] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#52] / [i915#54] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#53] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#53] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#1559] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#173])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-iclb2/igt@kms_psr@no_drrs.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-apl:          [DMESG-WARN][29] ([i915#180]) -> [PASS][30] +7 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-apl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][31] ([i915#1899]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-iclb3/igt@i915_pm_dc@dc5-psr.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-iclb7/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [FAIL][33] ([i915#1899]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-tglb1/igt@i915_pm_dc@dc5-psr.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-tglb8/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [INCOMPLETE][35] ([i915#151] / [i915#155]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-kbl1/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][39] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][41] ([i915#1121] / [i915#93] / [i915#95]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-kbl7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][43] ([i915#1121] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * {igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2}:
    - shard-glk:          [FAIL][45] ([i915#79]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][47] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][49] ([i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-iclb:         [INCOMPLETE][51] ([i915#1185]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-iclb3/igt@kms_hdr@bpc-switch-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-iclb4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][55] ([i915#1319]) -> [FAIL][56] ([fdo#110321] / [fdo#110336])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl7/igt@kms_content_protection@atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][57] ([fdo#108145] / [i915#265]) -> [FAIL][58] ([fdo#108145] / [i915#265] / [i915#95])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [FAIL][59] ([fdo#108145] / [i915#265]) -> [FAIL][60] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8516/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5665 -> IGTPW_4604
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8516: 5db9df14788c0a6038aa05e180cde8065d724e43 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4604: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/index.html
  IGT_5665: c5e5b0ce26fc321591a6d0235c639a1e8ec3cdfa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4604/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
