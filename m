Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Apr 2020 09:31:20 -0000
Message-ID: <158642468081.11549.9072112031955130082@emeril.freedesktop.org>
References: <20200408205056.2113025-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200408205056.2113025-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliOiBT?=
 =?utf-8?q?how_the_actual_error_from_submitting_the_rendercopy?=
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

Series: lib: Show the actual error from submitting the rendercopy
URL   : https://patchwork.freedesktop.org/series/75703/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8280_full -> IGTPW_4436_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/index.html

Known issues
------------

  Here are the changes found in IGTPW_4436_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [PASS][1] -> [FAIL][2] ([i915#1066])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-snb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-snb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-glk:          [PASS][3] -> [SKIP][4] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-glk4/igt@i915_pm_rpm@dpms-non-lpsp.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-glk3/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-hsw:          [PASS][5] -> [SKIP][6] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-hsw4/igt@i915_pm_rpm@dpms-non-lpsp.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-hsw6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#177] / [i915#52] / [i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@bo-too-big:
    - shard-hsw:          [PASS][17] -> [INCOMPLETE][18] ([i915#61])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-hsw4/igt@kms_flip@bo-too-big.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-hsw5/igt@kms_flip@bo-too-big.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#53] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#53] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#899])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([i915#155])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-hang@rcs0:
    - shard-iclb:         [FAIL][29] ([i915#1622]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-iclb4/igt@gem_ctx_persistence@engines-hang@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-iclb5/igt@gem_ctx_persistence@engines-hang@rcs0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-apl:          [FAIL][31] ([i915#54] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [FAIL][33] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][35] ([i915#54]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-apl:          [FAIL][37] ([i915#54]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-snb:          [SKIP][41] ([fdo#109271]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-snb4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-snb2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][43] ([i915#52] / [i915#54]) -> [PASS][44] +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [FAIL][45] ([i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-glk:          [FAIL][47] ([i915#118] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_lease@cursor_implicit_plane:
    - shard-apl:          [DMESG-WARN][49] ([i915#165] / [i915#180]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-apl6/igt@kms_lease@cursor_implicit_plane.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-apl6/igt@kms_lease@cursor_implicit_plane.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][51] ([fdo#109642] / [fdo#111068]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-iclb3/igt@kms_psr@psr2_suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][55] ([i915#1542]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-hsw1/igt@perf@blocking-parameterized.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-hsw4/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][57] ([fdo#111644] / [i915#1397]) -> [SKIP][58] ([i915#1316] / [i915#579])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][59] ([fdo#110892]) -> [SKIP][60] ([i915#1316] / [i915#579])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-iclb3/igt@i915_pm_rpm@dpms-non-lpsp.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-iclb6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][61] ([i915#54]) -> [FAIL][62] ([i915#54] / [i915#93] / [i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][63] ([i915#64]) -> [FAIL][64] ([i915#93] / [i915#95])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][65] ([i915#1525]) -> [FAIL][66] ([i915#95])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-apl7/igt@kms_fbcon_fbt@fbc.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-apl3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          [FAIL][67] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][68] ([fdo#108145] / [i915#265])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][69], [FAIL][70]) ([i915#1423] / [i915#1610]) -> [FAIL][71] ([i915#1423])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-apl6/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/shard-apl6/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1622]: https://gitlab.freedesktop.org/drm/intel/issues/1622
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5581 -> IGTPW_4436
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8280: b87cec89f6a2e5e65c54a39bef2336695138afc3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4436: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/index.html
  IGT_5581: ab0620e555119ec55f12ba9ab9e6e9246d407648 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4436/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
