Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 08 May 2020 17:12:58 -0000
Message-ID: <158895797828.22722.7683791703324922086@emeril.freedesktop.org>
References: <20200508135631.8099-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200508135631.8099-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Fnop=3A_Remove_submission_batching?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_exec_nop: Remove submission batching
URL   : https://patchwork.freedesktop.org/series/77077/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5642_full -> IGTPW_4548_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4548_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4548_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4548_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_pm:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl6/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl7/igt@i915_selftest@live@gt_pm.html

  
Known issues
------------

  Here are the changes found in IGTPW_4548_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#62])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#699] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1602])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([fdo#108145] / [i915#265] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#1559] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#1559] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#173])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-iclb4/igt@kms_psr@no_drrs.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@stress-open-close:
    - shard-tglb:         [PASS][29] -> [INCOMPLETE][30] ([i915#1356])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-tglb7/igt@perf@stress-open-close.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-tglb5/igt@perf@stress-open-close.html

  
#### Possible fixes ####

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [FAIL][31] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [FAIL][33] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [FAIL][35] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][37] ([i915#61]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend@b-dp1}:
    - shard-apl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl2/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl3/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [FAIL][41] ([i915#1188]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl4/igt@kms_hdr@bpc-switch-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][43] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [FAIL][45] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [FAIL][47] ([i915#1559] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][49] ([fdo#109441]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-iclb3/igt@kms_psr@psr2_cursor_render.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][51] ([i915#1542]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-iclb3/igt@perf@blocking-parameterized.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-iclb3/igt@perf@blocking-parameterized.html

  * igt@perf@enable-disable:
    - shard-glk:          [INCOMPLETE][53] ([i915#58] / [k.org#198133]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-glk8/igt@perf@enable-disable.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-glk9/igt@perf@enable-disable.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][55] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][56] ([i915#1319])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl4/igt@kms_content_protection@atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][57] ([fdo#110321]) -> [FAIL][58] ([fdo#110321] / [i915#95])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl4/igt@kms_content_protection@lic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][59] ([i915#1525]) -> [FAIL][60] ([i915#95])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][61] ([i915#64]) -> [FAIL][62] ([i915#93] / [i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-apl:          [FAIL][63] ([fdo#108145] / [i915#265]) -> [FAIL][64] ([fdo#108145] / [i915#265] / [i915#62])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5642/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1356]: https://gitlab.freedesktop.org/drm/intel/issues/1356
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5642 -> IGTPW_4548

  CI-20190529: 20190529
  CI_DRM_8452: 8dbf7b1ac5c55b27306ba1a8cc3dc0e1ef9938e8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4548: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/index.html
  IGT_5642: d1ce4abb01c70f7be6e777b6d45442663c4b830e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4548/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
