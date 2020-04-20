Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Apr 2020 16:32:20 -0000
Message-ID: <158740034018.29873.6152827692107257006@emeril.freedesktop.org>
References: <20200420064656.6787-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200420064656.6787-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Allow_modeset_to_surivive_change_of_cdclk_=28?=
 =?utf-8?q?rev3=29?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_big_fb: Allow modeset to surivive change of cdclk (rev3)
URL   : https://patchwork.freedesktop.org/series/76077/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8328_full -> IGTPW_4491_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/index.html

Known issues
------------

  Here are the changes found in IGTPW_4491_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl4/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-apl4/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#52] / [i915#54]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][9] -> [FAIL][10] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109441])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#165])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#1085])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-tglb8/igt@perf@gen12-mi-rpc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-tglb6/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][21] ([fdo#109276]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-iclb8/igt@gem_exec_params@invalid-bsd-ring.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-tglb:         [INCOMPLETE][23] -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-tglb3/igt@gem_mmap_gtt@flink-race.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-tglb5/igt@gem_mmap_gtt@flink-race.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][25] ([i915#180] / [i915#95]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-kbl:          [INCOMPLETE][27] ([i915#155] / [i915#95]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-glk:          [FAIL][29] ([i915#54]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [FAIL][31] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][32] +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][33] ([fdo#109349]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][35] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][37] ([i915#52] / [i915#54]) -> [PASS][38] +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [FAIL][41] ([i915#53] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [FAIL][43] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][47] ([fdo#109642] / [fdo#111068]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-iclb3/igt@kms_psr2_su@frontbuffer.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][49] ([fdo#109441]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-hsw:          [INCOMPLETE][51] ([i915#61]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][53] ([i915#1542]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-iclb8/igt@perf@blocking-parameterized.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-iclb6/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][55] ([i915#468]) -> [FAIL][56] ([i915#454])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][57] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][58] ([i915#357])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl6/igt@kms_content_protection@uevent.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][59] ([i915#357] / [i915#95]) -> [FAIL][60] ([i915#357])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl7/igt@kms_content_protection@uevent.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [INCOMPLETE][62] ([i915#155])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][63] ([i915#1525]) -> [FAIL][64] ([i915#95])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][65] ([i915#64]) -> [FAIL][66] ([i915#93] / [i915#95])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][67] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][68] ([fdo#108145] / [i915#265])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][70] ([fdo#108145] / [i915#265])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][71] ([fdo#108145] / [i915#265]) -> [FAIL][72] ([fdo#108145] / [i915#265] / [i915#95]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-kbl:          [FAIL][73] ([fdo#108145] / [i915#265]) -> [FAIL][74] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5602 -> IGTPW_4491
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8328: 77c1f57ceed8844ac2eccde781f540fae4e6604d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4491: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/index.html
  IGT_5602: a8fcccd15dcc2dd409edd23785a2d6f6e85fb682 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4491/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
