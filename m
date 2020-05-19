Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 16:11:39 -0000
Message-ID: <158990469948.31236.9334807864415674591@emeril.freedesktop.org>
References: <20200519100217.1761103-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200519100217.1761103-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNTog?=
 =?utf-8?q?Add_gem=5Fexec=5Fendless_=28rev2=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915: Add gem_exec_endless (rev2)
URL   : https://patchwork.freedesktop.org/series/72247/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8501_full -> IGTPW_4585_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4585_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_endless@dispatch@vcs1} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html

  * {igt@gem_exec_endless@dispatch@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-iclb7/igt@gem_exec_endless@dispatch@vecs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2}:
    - shard-glk:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8501_full and IGTPW_4585_full:

### New IGT tests (6) ###

  * igt@gem_exec_endless@dispatch:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_endless@dispatch@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_endless@dispatch@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_endless@dispatch@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_endless@dispatch@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_endless@dispatch@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4585_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][4] -> [DMESG-WARN][5] ([i915#180])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][6] -> [FAIL][7] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-iclb:         [PASS][8] -> [FAIL][9] ([i915#49])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-iclb4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#53] / [i915#93] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#53] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-apl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#173])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb8/igt@kms_psr@no_drrs.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#109441]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][20] -> [INCOMPLETE][21] ([i915#155] / [i915#794])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][22] ([i915#1904]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [FAIL][24] ([i915#71]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl6/igt@kms_color@pipe-c-degamma.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-apl1/igt@kms_color@pipe-c-degamma.html
    - shard-glk:          [FAIL][26] ([i915#71]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk7/igt@kms_color@pipe-c-degamma.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-glk5/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [FAIL][28] ([i915#71]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_color@pipe-c-degamma.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-kbl2/igt@kms_color@pipe-c-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][30] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [FAIL][32] ([i915#1121]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb5/igt@kms_fbcon_fbt@psr-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-tglb7/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][34] ([i915#79]) -> [PASS][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][36] ([i915#180]) -> [PASS][37] +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][38] ([i915#180]) -> [PASS][39] +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][40] ([i915#1559] / [i915#95]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][42] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][44] ([fdo#109441]) -> [PASS][45] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb8/igt@kms_psr@psr2_dpms.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][46] ([i915#1542]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb7/igt@perf@polling-parameterized.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-tglb3/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-snb:          [SKIP][48] ([fdo#109271]) -> [INCOMPLETE][49] ([i915#82])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-snb1/igt@i915_pm_dc@dc5-psr.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-snb6/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][50] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][51] ([i915#1319])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][52] ([fdo#110321]) -> [TIMEOUT][53] ([i915#1319])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl7/igt@kms_content_protection@srm.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/shard-apl2/igt@kms_content_protection@srm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5659 -> IGTPW_4585
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8501: c6bfff03c22fb90dcf1ddacb745667467ab5ab73 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4585: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/index.html
  IGT_5659: 66ab5e42811fee3dea8c21ab29e70e323a0650de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4585/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
