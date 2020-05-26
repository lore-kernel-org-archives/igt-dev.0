Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 26 May 2020 19:08:27 -0000
Message-ID: <159052010765.28044.12599744738031898155@emeril.freedesktop.org>
References: <20200526132548.76656-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200526132548.76656-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Restore_hangcheck_modparams_between_tests?=
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

Series: lib/i915: Restore hangcheck modparams between tests
URL   : https://patchwork.freedesktop.org/series/77664/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8539_full -> IGTPW_4614_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4614_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4614_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4614_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-hsw2/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4614_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][2] -> [DMESG-WARN][3] ([i915#180])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl6/igt@gem_softpin@noreloc-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][4] -> [FAIL][5] ([i915#1119] / [i915#118] / [i915#95])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-kbl:          [PASS][6] -> [FAIL][7] ([i915#71])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-kbl1/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-apl:          [PASS][8] -> [FAIL][9] ([i915#71])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl6/igt@kms_color@pipe-b-legacy-gamma.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl8/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#54] / [i915#93] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][12] -> [DMESG-WARN][13] ([i915#180]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#70] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl6/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#70] / [i915#93] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [PASS][18] -> [DMESG-WARN][19] ([i915#180] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#109441]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-iclb3/igt@kms_psr@psr2_no_drrs.html

  
#### Possible fixes ####

  * {igt@gem_exec_endless@dispatch@vcs0}:
    - shard-apl:          [SKIP][22] ([fdo#109271]) -> [PASS][23] +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl4/igt@gem_exec_endless@dispatch@vcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl8/igt@gem_exec_endless@dispatch@vcs0.html
    - shard-glk:          [SKIP][24] ([fdo#109271]) -> [PASS][25] +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk7/igt@gem_exec_endless@dispatch@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-glk5/igt@gem_exec_endless@dispatch@vcs0.html

  * {igt@gem_exec_endless@dispatch@vcs1}:
    - shard-tglb:         [SKIP][26] ([i915#1929]) -> [PASS][27] +4 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb8/igt@gem_exec_endless@dispatch@vcs1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-tglb6/igt@gem_exec_endless@dispatch@vcs1.html
    - shard-kbl:          [SKIP][28] ([fdo#109271]) -> [PASS][29] +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl6/igt@gem_exec_endless@dispatch@vcs1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-kbl2/igt@gem_exec_endless@dispatch@vcs1.html

  * {igt@gem_exec_endless@dispatch@vecs0}:
    - shard-iclb:         [SKIP][30] ([i915#1929]) -> [PASS][31] +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb2/igt@gem_exec_endless@dispatch@vecs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-iclb8/igt@gem_exec_endless@dispatch@vecs0.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][32] ([i915#1904]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][34] ([i915#1119] / [i915#95]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][36] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [FAIL][38] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][40] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [INCOMPLETE][42] ([i915#61]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][44] ([fdo#109349]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][46] ([i915#180]) -> [PASS][47] +8 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1}:
    - shard-apl:          [FAIL][48] ([i915#407]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl7/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl6/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][50] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][52] ([i915#180]) -> [PASS][53] +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][54] ([fdo#109441]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][56] ([i915#588]) -> [SKIP][57] ([i915#658])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][58] ([i915#468]) -> [FAIL][59] ([i915#454])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_busy@basic-modeset-pipe-d:
    - shard-apl:          [TIMEOUT][60] ([i915#1635]) -> [SKIP][61] ([fdo#109271])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl7/igt@kms_busy@basic-modeset-pipe-d.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl2/igt@kms_busy@basic-modeset-pipe-d.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][62] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][63] ([i915#1319] / [i915#1635])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl8/igt@kms_content_protection@legacy.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][64] ([i915#1319] / [i915#1635]) -> [TIMEOUT][65] ([i915#1319]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl8/igt@kms_content_protection@lic.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl1/igt@kms_content_protection@lic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][66] ([fdo#108145] / [i915#265]) -> [FAIL][67] ([fdo#108145] / [i915#265] / [i915#95])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][68] ([fdo#108145] / [i915#265]) -> [FAIL][69] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1929]: https://gitlab.freedesktop.org/drm/intel/issues/1929
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5678 -> IGTPW_4614
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8539: 6590da76d8c6a2952b3cde70859bad41c59ed444 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4614: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/index.html
  IGT_5678: c1f30ee09ac2e7eb3e8e90245239731a169a6050 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4614/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
