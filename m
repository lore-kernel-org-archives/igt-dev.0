Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 12 May 2020 19:27:02 -0000
Message-ID: <158931162251.18142.6116592180494697618@emeril.freedesktop.org>
References: <20200512102447.9249-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200512102447.9249-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Fnop=3A_=22headless=22_requires_submicrosecond_prec?=
 =?utf-8?q?ision_=28rev2=29?=
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

Series: tests/gem_exec_nop: "headless" requires submicrosecond precision (rev2)
URL   : https://patchwork.freedesktop.org/series/77186/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8470_full -> IGTPW_4564_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/index.html

Known issues
------------

  Here are the changes found in IGTPW_4564_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-kbl:          [PASS][1] -> [FAIL][2] ([i915#54] / [i915#93] / [i915#95])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-iclb:         [PASS][3] -> [INCOMPLETE][4] ([i915#1185])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][11] -> [FAIL][12] ([fdo#108145] / [i915#265] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#1559] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#1559] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109642] / [fdo#111068])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-iclb7/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@non-system-wide-paranoid:
    - shard-apl:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl3/igt@perf@non-system-wide-paranoid.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-apl1/igt@perf@non-system-wide-paranoid.html
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-glk7/igt@perf@non-system-wide-paranoid.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-glk6/igt@perf@non-system-wide-paranoid.html
    - shard-hsw:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-hsw7/igt@perf@non-system-wide-paranoid.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-hsw7/igt@perf@non-system-wide-paranoid.html
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([i915#405])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-iclb5/igt@perf@non-system-wide-paranoid.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-iclb2/igt@perf@non-system-wide-paranoid.html
    - shard-kbl:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl2/igt@perf@non-system-wide-paranoid.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-kbl3/igt@perf@non-system-wide-paranoid.html
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#405])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-tglb3/igt@perf@non-system-wide-paranoid.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-tglb2/igt@perf@non-system-wide-paranoid.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][33] ([i915#1436] / [i915#716]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl3/igt@gen9_exec_parse@allowed-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live@gt_pm:
    - shard-apl:          [INCOMPLETE][35] ([i915#1812]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl2/igt@i915_selftest@live@gt_pm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-apl6/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [FAIL][37] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][39] ([i915#1602] / [i915#456]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@pipe-c-torture-bo:
    - shard-hsw:          [DMESG-WARN][41] ([i915#128]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-hsw6/igt@kms_cursor_legacy@pipe-c-torture-bo.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-hsw4/igt@kms_cursor_legacy@pipe-c-torture-bo.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +5 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * {igt@kms_flip@plain-flip-ts-check@a-hdmi-a1}:
    - shard-glk:          [FAIL][47] ([i915#34]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-glk8/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-glk4/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][49] ([i915#433]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][51] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [FAIL][53] ([i915#53] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][55] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][57] ([i915#1559] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][61] ([i915#1542]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-hsw8/igt@perf@blocking-parameterized.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-hsw1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][63] ([i915#658]) -> [SKIP][64] ([i915#588])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][65] ([i915#454]) -> [SKIP][66] ([i915#468])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-snb:          [INCOMPLETE][67] ([i915#82]) -> [SKIP][68] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-snb5/igt@i915_pm_rpm@gem-idle.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-snb4/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][69] ([i915#1319]) -> [FAIL][70] ([fdo#110321] / [fdo#110336])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl1/igt@kms_content_protection@atomic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/shard-apl7/igt@kms_content_protection@atomic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1812]: https://gitlab.freedesktop.org/drm/intel/issues/1812
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5651 -> IGTPW_4564
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8470: d2c5ae86eac811c49f2fe22c4fa02b6e6d31cd67 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4564: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/index.html
  IGT_5651: e54e2642f1967ca3c488db32264607df670d1dfb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4564/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
