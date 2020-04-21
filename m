Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Apr 2020 16:49:49 -0000
Message-ID: <158748778957.17663.2961683129878496686@emeril.freedesktop.org>
References: <20200421111537.3403622-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200421111537.3403622-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci/blacklists=3A_Lift_premerge_ban_for_gem=5Fexec=5Falignment?=
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

Series: intel-ci/blacklists: Lift premerge ban for gem_exec_alignment
URL   : https://patchwork.freedesktop.org/series/76258/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8342_full -> IGTPW_4494_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/index.html

Known issues
------------

  Here are the changes found in IGTPW_4494_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][1] -> [FAIL][2] ([i915#454])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#1566] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#1559] / [i915#93] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1559] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#899])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#1031] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-apl6/igt@kms_prime@basic-crc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-apl2/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#1031] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl2/igt@kms_prime@basic-crc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl4/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][25] -> [FAIL][26] ([i915#31])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-hsw1/igt@kms_setmode@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-hsw2/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#1085])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-tglb6/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][29] ([i915#1277]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-tglb7/igt@gem_exec_balancer@hang.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-tglb6/igt@gem_exec_balancer@hang.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [INCOMPLETE][31] ([i915#155] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [DMESG-WARN][33] ([i915#180]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-apl6/igt@i915_suspend@fence-restore-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-apl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-snb:          [SKIP][35] ([fdo#109271]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-snb4/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-snb1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [FAIL][37] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][38] +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [FAIL][39] ([i915#118] / [i915#70] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][41] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][43] ([i915#52] / [i915#54]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [FAIL][47] ([i915#53] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [FAIL][49] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-iclb5/igt@kms_psr@psr2_basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-hsw:          [INCOMPLETE][53] ([i915#61]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-hsw8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][55] ([i915#1542]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-hsw8/igt@perf@polling-parameterized.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-hsw7/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][57] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][58] ([i915#357])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl4/igt@kms_content_protection@uevent.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][59] ([i915#357] / [i915#95]) -> [FAIL][60] ([i915#357])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-apl3/igt@kms_content_protection@uevent.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-apl1/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][61] ([i915#1525]) -> [FAIL][62] ([i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][63] ([i915#64]) -> [FAIL][64] ([i915#93] / [i915#95])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][65] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][66] ([fdo#108145] / [i915#265])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [FAIL][67] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][68] ([fdo#108145] / [i915#265])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          [FAIL][69] ([fdo#108145] / [i915#265]) -> [FAIL][70] ([fdo#108145] / [i915#265] / [i915#95])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
    - shard-kbl:          [FAIL][71] ([fdo#108145] / [i915#265]) -> [FAIL][72] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8342/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5602 -> IGTPW_4494
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8342: 17407a9f61a0ee402254522e391a626acc4375ec @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4494: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/index.html
  IGT_5602: a8fcccd15dcc2dd409edd23785a2d6f6e85fb682 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4494/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
