Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 14:27:31 -0000
Message-ID: <158989845136.31236.3790270149916964507@emeril.freedesktop.org>
References: <20200519094803.8687-1-mika.kahola@intel.com>
In-Reply-To: <20200519094803.8687-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_CCS_Clear_Color_test_=28rev2=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_ccs: CCS Clear Color test (rev2)
URL   : https://patchwork.freedesktop.org/series/76536/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8501_full -> IGTPW_4583_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4583_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4583_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4583_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb3/igt@i915_pm_dc@dc5-psr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-tglb7/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic:
    - shard-iclb:         [PASS][3] -> [FAIL][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb5/igt@kms_ccs@pipe-c-crc-sprite-planes-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-iclb8/igt@kms_ccs@pipe-c-crc-sprite-planes-basic.html

  
#### Warnings ####

  * igt@kms_ccs@pipe-c-crc-primary-basic:
    - shard-glk:          [SKIP][5] ([fdo#109271]) -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk5/igt@kms_ccs@pipe-c-crc-primary-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-glk6/igt@kms_ccs@pipe-c-crc-primary-basic.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180:
    - shard-apl:          [SKIP][7] ([fdo#109271]) -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl8/igt@kms_ccs@pipe-c-crc-primary-rotation-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-apl2/igt@kms_ccs@pipe-c-crc-primary-rotation-180.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic:
    - shard-kbl:          [SKIP][9] ([fdo#109271]) -> [FAIL][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-kbl4/igt@kms_ccs@pipe-c-crc-sprite-planes-basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_4583_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#1899])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb2/igt@i915_pm_dc@dc5-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-iclb4/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl3/igt@i915_suspend@sysfs-reader.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#1483] / [i915#1897])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-tglb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([fdo#108145]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-kbl1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([fdo#108145]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-apl1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html
    - shard-glk:          [PASS][21] -> [FAIL][22] ([fdo#108145]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-glk5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#1897]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb8/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-tglb5/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#70] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl1/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-kbl2/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#72])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-iclb5/igt@kms_psr@psr2_no_drrs.html

  
#### Possible fixes ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][33] ([i915#1904]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [FAIL][35] ([i915#71]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl6/igt@kms_color@pipe-c-degamma.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-apl8/igt@kms_color@pipe-c-degamma.html
    - shard-glk:          [FAIL][37] ([i915#71]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk7/igt@kms_color@pipe-c-degamma.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-glk7/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [FAIL][39] ([i915#71]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_color@pipe-c-degamma.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-kbl4/igt@kms_color@pipe-c-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][41] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [FAIL][43] ([i915#1121]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb5/igt@kms_fbcon_fbt@psr-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-tglb7/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][45] ([i915#79]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [FAIL][51] ([i915#1559] / [i915#95]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [FAIL][53] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][55] ([fdo#109441]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][57] ([i915#1542]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb7/igt@perf@polling-parameterized.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-tglb1/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][59] ([i915#658]) -> [SKIP][60] ([i915#588])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180:
    - shard-kbl:          [SKIP][61] ([fdo#109271]) -> [FAIL][62] ([i915#93] / [i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl7/igt@kms_ccs@pipe-c-crc-primary-rotation-180.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-kbl1/igt@kms_ccs@pipe-c-crc-primary-rotation-180.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][63] ([i915#1319]) -> [DMESG-FAIL][64] ([fdo#110321])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl3/igt@kms_content_protection@atomic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-apl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][65] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][66] ([i915#1319])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][67] ([fdo#110321]) -> [DMESG-FAIL][68] ([fdo#110321])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl7/igt@kms_content_protection@srm.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#265]) -> [FAIL][70] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1483]: https://gitlab.freedesktop.org/drm/intel/issues/1483
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1823]: https://gitlab.freedesktop.org/drm/intel/issues/1823
  [i915#1897]: https://gitlab.freedesktop.org/drm/intel/issues/1897
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5659 -> IGTPW_4583
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8501: c6bfff03c22fb90dcf1ddacb745667467ab5ab73 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4583: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/index.html
  IGT_5659: 66ab5e42811fee3dea8c21ab29e70e323a0650de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4583/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
