Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 12 May 2020 10:43:12 -0000
Message-ID: <158928019287.18142.5491134686042441311@emeril.freedesktop.org>
References: <20200512082402.26792-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200512082402.26792-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgTWFrZSBn?=
 =?utf-8?q?pgpu_fill_tests_libdrm_independent?=
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

Series: Make gpgpu fill tests libdrm independent
URL   : https://patchwork.freedesktop.org/series/77175/
State : success

== Summary ==

CI Bug Log - changes from IGT_5651_full -> IGTPW_4559_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4559_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@sysfs_timeslice_duration@timeout@bcs0}:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb8/igt@sysfs_timeslice_duration@timeout@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-iclb7/igt@sysfs_timeslice_duration@timeout@bcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4559_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@pipe-b-cursor-size-change:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#54])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-size-change.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#1602])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1185] / [i915#250])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109441]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-iclb6/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * {igt@gem_exec_schedule@smoketest@bcs0}:
    - shard-tglb:         [INCOMPLETE][19] -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb8/igt@gem_exec_schedule@smoketest@bcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-tglb1/igt@gem_exec_schedule@smoketest@bcs0.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [DMESG-WARN][21] ([i915#180]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl1/igt@i915_suspend@forcewake.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-apl6/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [FAIL][23] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][25] ([i915#1602] / [i915#456]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-tglb:         [FAIL][27] ([i915#64]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb6/igt@kms_fbcon_fbt@fbc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-tglb6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][29] ([i915#433]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][31] ([i915#180]) -> [PASS][32] +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][33] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [FAIL][35] ([i915#53] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][37] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][39] ([i915#1559] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][41] ([fdo#109642] / [fdo#111068]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][43] ([fdo#109441]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][45] ([i915#1542]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb8/igt@perf@blocking-parameterized.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-iclb6/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][47] ([i915#454]) -> [SKIP][48] ([i915#468])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][49] ([i915#468]) -> [FAIL][50] ([i915#454])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          [TIMEOUT][51] ([i915#1319]) -> [FAIL][52] ([fdo#110321] / [fdo#110336] / [i915#93] / [i915#95])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl3/igt@kms_content_protection@atomic-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/shard-kbl2/igt@kms_content_protection@atomic-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5651 -> IGTPW_4559

  CI-20190529: 20190529
  CI_DRM_8467: 1a0f0c378117fc90f421a692698ad85963ecdb3a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4559: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/index.html
  IGT_5651: e54e2642f1967ca3c488db32264607df670d1dfb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4559/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
