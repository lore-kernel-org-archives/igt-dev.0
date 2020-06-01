Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 01 Jun 2020 11:33:51 -0000
Message-ID: <159101123186.14888.9275055312663883563@emeril.freedesktop.org>
References: <20200601084000.31583-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200601084000.31583-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_Enhancements_=28rev2=29?=
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_content_protection: Enhancements (rev2)
URL   : https://patchwork.freedesktop.org/series/77694/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8560_full -> IGTPW_4629_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4629_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4629_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4629_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_content_protection@hdcp-1_4} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-tglb8/igt@kms_content_protection@hdcp-1_4.html

  * {igt@kms_content_protection@hdcp-2_2} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-iclb2/igt@kms_content_protection@hdcp-2_2.html

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-tglb8/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8560_full and IGTPW_4629_full:

### New IGT tests (2) ###

  * igt@kms_content_protection@hdcp-1_4:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_content_protection@hdcp-2_2:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4629_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_engines@libapi:
    - shard-glk:          [PASS][4] -> [TIMEOUT][5] ([i915#1958]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-glk9/igt@gem_ctx_engines@libapi.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-glk7/igt@gem_ctx_engines@libapi.html

  * igt@gem_ctx_persistence@engines-hostile@rcs0:
    - shard-iclb:         [PASS][6] -> [FAIL][7] ([i915#1622])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-iclb2/igt@gem_ctx_persistence@engines-hostile@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-iclb4/igt@gem_ctx_persistence@engines-hostile@rcs0.html
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#1622])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-tglb3/igt@gem_ctx_persistence@engines-hostile@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-tglb7/igt@gem_ctx_persistence@engines-hostile@rcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#1436] / [i915#716])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([i915#1602] / [i915#456])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-tglb8/igt@i915_pm_backlight@fade_with_suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-tglb8/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180] / [i915#93] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:
    - shard-apl:          [PASS][16] -> [FAIL][17] ([i915#54])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#54])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#70] / [i915#93] / [i915#95]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl6/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][22] -> [INCOMPLETE][23] ([i915#1926] / [i915#61])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-hsw2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-hsw7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@all-pipes-torture-bo:
    - shard-hsw:          [PASS][24] -> [DMESG-WARN][25] ([i915#128])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-hsw1/igt@kms_cursor_legacy@all-pipes-torture-bo.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-hsw2/igt@kms_cursor_legacy@all-pipes-torture-bo.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][28] -> [FAIL][29] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#83])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][36] -> [FAIL][37] ([i915#173])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-iclb8/igt@kms_psr@no_drrs.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-iclb1/igt@kms_psr@no_drrs.html

  
#### Possible fixes ####

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][38] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][39] +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-apl:          [FAIL][40] ([i915#54]) -> [PASS][41] +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][42] ([i915#180]) -> [PASS][43] +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen:
    - shard-glk:          [INCOMPLETE][44] ([i915#58] / [k.org#198133]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-offscreen:
    - shard-glk:          [TIMEOUT][46] ([i915#1958]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-64x21-offscreen.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-kbl:          [FAIL][48] ([i915#54]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][50] ([i915#72]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][52] ([i915#1925] / [i915#1926]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-glk8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-glk9/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][54] ([i915#64]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl6/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][56] ([i915#1525]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-apl1/igt@kms_fbcon_fbt@fbc.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-apl6/igt@kms_fbcon_fbt@fbc.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59] +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_prime@basic-crc@second-to-first}:
    - shard-apl:          [FAIL][60] ([i915#1031] / [i915#95]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [FAIL][62] ([i915#1031] / [i915#93] / [i915#95]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl3/igt@kms_prime@basic-crc@second-to-first.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl4/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][64] ([i915#155]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-iclb:         [FAIL][66] ([i915#1542]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-iclb6/igt@perf@polling-parameterized.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-iclb3/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][68] ([i915#1515]) -> [FAIL][69] ([i915#1515])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][70] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][71] ([fdo#108145] / [i915#265]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][72] ([fdo#109642] / [fdo#111068]) -> [FAIL][73] ([i915#608])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-iclb4/igt@kms_psr2_su@page_flip.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_vrr@flip-basic:
    - shard-glk:          [SKIP][74] ([fdo#109271]) -> [TIMEOUT][75] ([i915#1958]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/shard-glk7/igt@kms_vrr@flip-basic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/shard-glk7/igt@kms_vrr@flip-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1622]: https://gitlab.freedesktop.org/drm/intel/issues/1622
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5687 -> IGTPW_4629
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8560: 02fe287fdb4a3d6bceb1bb61b3c8538b4b941b3c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4629: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/index.html
  IGT_5687: 668a5be752186b6e08f361bac34da37309d08393 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
