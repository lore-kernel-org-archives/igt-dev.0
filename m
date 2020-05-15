Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 15 May 2020 12:32:27 -0000
Message-ID: <158954594705.26211.13352028473794851872@emeril.freedesktop.org>
References: <20200515071928.1173041-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200515071928.1173041-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Iga21zX2Zs?=
 =?utf-8?q?ip=3A_Trim_test_durations_for_basic_subtests_=5BBAT=5D?=
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

Series: kms_flip: Trim test durations for basic subtests [BAT]
URL   : https://patchwork.freedesktop.org/series/77297/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8486_full -> IGTPW_4571_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4571_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4571_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4571_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][3] ([i915#454]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  
Known issues
------------

  Here are the changes found in IGTPW_4571_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#1602] / [i915#456])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-tglb3/igt@gem_workarounds@suspend-resume-fd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-tglb5/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl2/igt@i915_suspend@fence-restore-untiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-apl2/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl3/igt@kms_draw_crc@fill-fb.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-apl8/igt@kms_draw_crc@fill-fb.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-glk6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-glk1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-apl1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#1188])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl3/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-apl1/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@vecs0}:
    - shard-kbl:          [DMESG-WARN][31] ([i915#180]) -> [PASS][32] +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * {igt@gem_exec_parallel@fds@bcs0}:
    - shard-iclb:         [INCOMPLETE][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb2/igt@gem_exec_parallel@fds@bcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-iclb7/igt@gem_exec_parallel@fds@bcs0.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [INCOMPLETE][35] ([i915#1602] / [i915#456]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-tglb3/igt@gem_exec_suspend@basic-s0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-tglb1/igt@gem_exec_suspend@basic-s0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][37] ([i915#1436] / [i915#716]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-glk6/igt@gen9_exec_parse@allowed-all.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][39] ([i915#1119] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][41] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [FAIL][43] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-apl:          [FAIL][45] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][47] ([i915#79]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-apl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][53] ([i915#433]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][55] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][57] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][61] ([i915#1542]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb6/igt@perf@blocking-parameterized.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-iclb5/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][63] ([i915#1542]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-tglb7/igt@perf@polling-parameterized.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-tglb8/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][65] ([i915#658]) -> [SKIP][66] ([i915#588])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-snb:          [INCOMPLETE][67] ([i915#82]) -> [SKIP][68] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-snb5/igt@i915_pm_dc@dc5-psr.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-snb4/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][69] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][70] ([i915#1319])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl4/igt@kms_content_protection@atomic-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][71] ([i915#1319]) -> [FAIL][72] ([fdo#110321])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8486/shard-apl7/igt@kms_content_protection@srm.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/shard-apl6/igt@kms_content_protection@srm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5654 -> IGTPW_4571
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8486: f43bb5d8b1ed34a349ce5721ce5c064935a6cf6f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4571: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/index.html
  IGT_5654: 5637a466a0b09535517751608f5525a8b468a76b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4571/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
