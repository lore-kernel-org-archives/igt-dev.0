Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 00:06:07 -0000
Message-ID: <158984676743.31239.15057940307119338929@emeril.freedesktop.org>
References: <20200518213936.1539871-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200518213936.1539871-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Reset_all_engine_properties_to_defaults_prior_to_the_star?=
 =?utf-8?q?t_of_a_test_=28rev3=29?=
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

Series: lib/i915: Reset all engine properties to defaults prior to the start of a test (rev3)
URL   : https://patchwork.freedesktop.org/series/76951/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8498_full -> IGTPW_4577_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4577_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4577_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4577_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-tglb7/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4577_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [PASS][2] -> [INCOMPLETE][3] ([i915#1602] / [i915#456])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-tglb1/igt@gem_eio@in-flight-suspend.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-tglb7/igt@gem_eio@in-flight-suspend.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][4] -> [FAIL][5] ([i915#1899])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-iclb4/igt@i915_pm_dc@dc5-psr.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-iclb1/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][6] -> [DMESG-WARN][7] ([i915#180]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl1/igt@i915_suspend@debugfs-reader.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#54] / [i915#93] / [i915#95])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#52] / [i915#54] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#53] / [i915#93] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [PASS][16] -> [FAIL][17] ([i915#53] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][20] -> [FAIL][21] ([fdo#108145] / [i915#265] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#1559] / [i915#93] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#1559] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109441]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-iclb1/igt@kms_psr@psr2_sprite_render.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][28] ([i915#180]) -> [PASS][29] +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][30] ([i915#1436] / [i915#716]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][32] -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [FAIL][34] ([i915#71]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl2/igt@kms_color@pipe-c-degamma.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl7/igt@kms_color@pipe-c-degamma.html
    - shard-glk:          [FAIL][36] ([i915#71]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-glk1/igt@kms_color@pipe-c-degamma.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-glk1/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [FAIL][38] ([i915#71]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl3/igt@kms_color@pipe-c-degamma.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl6/igt@kms_color@pipe-c-degamma.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [FAIL][40] ([i915#1121]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-tglb2/igt@kms_fbcon_fbt@psr-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-tglb5/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1}:
    - shard-glk:          [FAIL][42] ([i915#79]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][44] ([i915#180]) -> [PASS][45] +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [FAIL][46] ([i915#1559] / [i915#95]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [FAIL][48] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][50] ([i915#173]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-iclb1/igt@kms_psr@no_drrs.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-iclb7/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][52] ([fdo#109441]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][54] ([i915#1542]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-tglb1/igt@perf@polling-parameterized.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-tglb1/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-apl:          [DMESG-FAIL][56] ([fdo#110321]) -> [TIMEOUT][57] ([i915#1319])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl7/igt@kms_content_protection@atomic.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][58] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][59] ([i915#1319])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl6/igt@kms_content_protection@legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][60] ([i915#1319]) -> [FAIL][61] ([fdo#110321])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl4/igt@kms_content_protection@lic.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl6/igt@kms_content_protection@lic.html
    - shard-kbl:          [FAIL][62] ([fdo#110321]) -> [TIMEOUT][63] ([i915#1319])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl3/igt@kms_content_protection@lic.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl6/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][64] ([i915#357]) -> [FAIL][65] ([i915#357] / [i915#93] / [i915#95])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl6/igt@kms_content_protection@uevent.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][66] ([i915#357]) -> [FAIL][67] ([i915#357] / [i915#95])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl8/igt@kms_content_protection@uevent.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl7/igt@kms_content_protection@uevent.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][68] ([fdo#108145] / [i915#265]) -> [FAIL][69] ([fdo#108145] / [i915#265] / [i915#95])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][70] ([fdo#108145] / [i915#265]) -> [FAIL][71] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][72] ([i915#180]) -> [INCOMPLETE][73] ([i915#155])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
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
  * IGT: IGT_5659 -> IGTPW_4577
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8498: 1493c649ae92207a758afa50a639275bd6c80e2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4577: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/index.html
  IGT_5659: 66ab5e42811fee3dea8c21ab29e70e323a0650de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4577/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
