Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 11 May 2020 05:16:18 -0000
Message-ID: <158917417899.13117.11512155582868686175@emeril.freedesktop.org>
References: <20200510193551.9818-1-kunal1.joshi@intel.com>
In-Reply-To: <20200510193551.9818-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium_Handle_DP_FSM_more_reliably_=28rev2=29?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_chamelium Handle DP FSM more reliably (rev2)
URL   : https://patchwork.freedesktop.org/series/77071/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8461_full -> IGTPW_4552_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4552_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4552_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4552_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  
Known issues
------------

  Here are the changes found in IGTPW_4552_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4] ([i915#155])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl7/igt@gem_softpin@noreloc-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-apl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#54])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#1566] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][11] -> [SKIP][12] ([i915#433])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl4/igt@kms_mmap_write_crc@main.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl1/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#1559] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1559] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109642] / [fdo#111068])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-kbl:          [INCOMPLETE][23] ([i915#155]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][25] ([i915#1436] / [i915#716]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][27] ([i915#180]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-apl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][29] ([i915#57]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][31] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [FAIL][33] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * {igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][35] ([i915#61]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][39] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][41] ([i915#95]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][43] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][45] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][47] ([fdo#109441]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][49] ([i915#31]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl7/igt@kms_setmode@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl2/igt@kms_setmode@basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][51] ([i915#1542]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-hsw6/igt@perf@blocking-parameterized.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-hsw4/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][53] ([i915#454]) -> [SKIP][54] ([i915#468])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][55] ([fdo#110321]) -> [TIMEOUT][56] ([i915#1319])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl4/igt@kms_content_protection@lic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][57] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][58] ([fdo#108145] / [i915#265])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][59] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][60] ([fdo#108145] / [i915#265])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][61] ([fdo#108145] / [i915#265]) -> [FAIL][62] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          [FAIL][63] ([fdo#108145] / [i915#265]) -> [FAIL][64] ([fdo#108145] / [i915#265] / [i915#95])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5644 -> IGTPW_4552
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8461: c0be14b9502e54c9ece4f4fc25872d665c6a6553 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4552: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/index.html
  IGT_5644: 16f067ae42a6a93b8f0c5835210e2575a883001b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4552/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
