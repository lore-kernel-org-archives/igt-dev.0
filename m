Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8859522870989030423=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Wed, 30 Nov 2022 21:38:00 -0000
Message-ID: <166984428020.2881.3072749628000150429@emeril.freedesktop.org>
References: <20221130204526.3182975-1-markyacoub@chromium.org>
In-Reply-To: <20221130204526.3182975-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ2hhbWVs?=
 =?utf-8?q?ium=3A_Split_kms=5Fchamelium_into_multiple_kms=5Fchamelium_test?=
 =?utf-8?q?s?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============8859522870989030423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Chamelium: Split kms_chamelium into multiple kms_chamelium tests
URL   : https://patchwork.freedesktop.org/series/111501/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12456 -> IGTPW_8177
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/index.html

Participating hosts (36 -> 35)
------------------------------

  Additional (2): fi-kbl-7567u fi-hsw-4770 
  Missing    (3): fi-ilk-m540 bat-atsm-1 bat-dg1-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8177:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_chamelium_edid@dp-edid-read} (NEW):
    - {bat-jsl-1}:        NOTRUN -> [SKIP][1] +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][2] +8 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html
    - {bat-rpls-1}:       NOTRUN -> [SKIP][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-1/igt@kms_chamelium_edid@dp-edid-read.html

  * {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
    - fi-adl-ddr5:        NOTRUN -> [SKIP][4] +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-adl-ddr5/igt@kms_chamelium_edid@hdmi-edid-read.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][5] +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-ehl-2/igt@kms_chamelium_edid@hdmi-edid-read.html

  * {igt@kms_chamelium_edid@vga-edid-read} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][6] +7 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-rkl-11600/igt@kms_chamelium_edid@vga-edid-read.html
    - fi-icl-u2:          NOTRUN -> [SKIP][7] +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-icl-u2/igt@kms_chamelium_edid@vga-edid-read.html

  * {igt@kms_chamelium_frames@dp-crc-fast} (NEW):
    - {bat-adlm-1}:       NOTRUN -> [SKIP][8] +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-adlm-1/igt@kms_chamelium_frames@dp-crc-fast.html
    - {bat-rplp-1}:       NOTRUN -> [SKIP][9] +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rplp-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
    - {bat-adln-1}:       NOTRUN -> [SKIP][10] +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-adln-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * {igt@kms_chamelium_hdp@hdmi-hpd-fast} (NEW):
    - {bat-dg1-7}:        NOTRUN -> [SKIP][11] +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-dg1-7/igt@kms_chamelium_hdp@hdmi-hpd-fast.html

  * {igt@kms_chamelium_hdp@vga-hpd-fast} (NEW):
    - {bat-adlp-6}:       NOTRUN -> [SKIP][12] +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-adlp-6/igt@kms_chamelium_hdp@vga-hpd-fast.html

  * {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
    - {bat-rpls-2}:       NOTRUN -> [SKIP][13] +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][14] +8 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-rkl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12456 and IGTPW_8177:

### New IGT tests (9) ###

  * igt@kms_chamelium_edid@dp-edid-read:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_edid@vga-edid-read:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_frames@dp-crc-fast:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hdp@dp-hpd-fast:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hdp@hdmi-hpd-fast:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hdp@vga-hpd-fast:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8177 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#2190])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4613]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-apl-guc/igt@gem_lmem_swapping@basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#4613]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html

  * {igt@kms_chamelium_edid@dp-edid-read} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][18] ([fdo#109271]) +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-ilk-650/igt@kms_chamelium_edid@dp-edid-read.html

  * {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][19] ([fdo#109271]) +8 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-read.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][20] ([fdo#109271]) +8 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-glk-dsi/igt@kms_chamelium_edid@hdmi-edid-read.html

  * {igt@kms_chamelium_edid@vga-edid-read} (NEW):
    - {bat-kbl-2}:        NOTRUN -> [SKIP][21] ([fdo#109271]) +8 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-kbl-2/igt@kms_chamelium_edid@vga-edid-read.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][22] ([fdo#109271]) +7 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-bdw-gvtdvm/igt@kms_chamelium_edid@vga-edid-read.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][23] ([fdo#109271]) +8 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-bsw-kefka/igt@kms_chamelium_edid@vga-edid-read.html

  * {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][24] ([fdo#109271]) +8 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-kbl-x1275/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][25] ([fdo#109271]) +20 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-hsw-4770/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][26] ([fdo#109271]) +8 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][27] ([fdo#109271]) +7 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-kbl-8809g/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][28] ([fdo#109271]) +8 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-ivb-3770/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][29] ([fdo#109271]) +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-elk-e7500/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * {igt@kms_chamelium_hdp@dp-hpd-fast} (NEW):
    - fi-apl-guc:         NOTRUN -> [SKIP][30] ([fdo#109271]) +8 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-apl-guc/igt@kms_chamelium_hdp@dp-hpd-fast.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][31] ([fdo#109271]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-pnv-d510/igt@kms_chamelium_hdp@dp-hpd-fast.html

  * {igt@kms_chamelium_hdp@hdmi-hpd-fast} (NEW):
    - fi-skl-6700k2:      NOTRUN -> [SKIP][32] ([fdo#109271]) +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-skl-6700k2/igt@kms_chamelium_hdp@hdmi-hpd-fast.html

  * {igt@kms_chamelium_hdp@vga-hpd-fast} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][33] ([fdo#109271]) +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-cfl-8700k/igt@kms_chamelium_hdp@vga-hpd-fast.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][34] ([fdo#109271]) +8 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-blb-e6850/igt@kms_chamelium_hdp@vga-hpd-fast.html

  * {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][35] ([fdo#109271]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-snb-2600:        NOTRUN -> [SKIP][36] ([fdo#109271]) +8 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-snb-2600/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-skl-guc:         NOTRUN -> [SKIP][37] ([fdo#109271]) +8 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-skl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_psr@cursor_plane_move:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][38] ([fdo#109271]) +39 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-kbl-7567u/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#1072]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-apl-guc:         [INCOMPLETE][40] ([i915#7073]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@read:
    - {bat-rpls-2}:       [SKIP][42] ([i915#2582]) -> [PASS][43] +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/bat-rpls-2/igt@fbdev@read.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-2/igt@fbdev@read.html

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][44] ([i915#7229]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
    - {bat-rpls-2}:       [DMESG-WARN][46] ([i915#6434]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/bat-rpls-2/igt@gem_exec_gttfill@basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-2/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rpls-1}:       [DMESG-WARN][48] ([i915#6687]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@gt_lrc:
    - {bat-rpls-2}:       [INCOMPLETE][50] ([i915#4983]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/bat-rpls-2/igt@i915_selftest@live@gt_lrc.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-2/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - fi-ivb-3770:        [INCOMPLETE][52] ([i915#3303] / [i915#7122]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@slpc:
    - {bat-rpls-1}:       [DMESG-FAIL][54] ([i915#6367]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-1/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7073]: https://gitlab.freedesktop.org/drm/intel/issues/7073
  [i915#7122]: https://gitlab.freedesktop.org/drm/intel/issues/7122
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7076 -> IGTPW_8177

  CI-20190529: 20190529
  CI_DRM_12456: 7a3c5315507ed0f4a9b0aa07ce6df1b3d28ebc35 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8177: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/index.html
  IGT_7076: 888725538e0d6bbb94bbbb1ac278d4afcbbbdad0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 71 lines
--- 71 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/index.html

--===============8859522870989030423==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Chamelium: Split kms_chamelium into multiple kms_chamelium tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111501/">https://patchwork.freedesktop.org/series/111501/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12456 -&gt; IGTPW_8177</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/index.html</p>
<h2>Participating hosts (36 -&gt; 35)</h2>
<p>Additional (2): fi-kbl-7567u fi-hsw-4770 <br />
  Missing    (3): fi-ilk-m540 bat-atsm-1 bat-dg1-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8177:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_chamelium_edid@dp-edid-read} (NEW):</p>
<ul>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@hdmi-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-adl-ddr5/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-ehl-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@vga-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-rkl-11600/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> +7 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-icl-u2/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@dp-crc-fast} (NEW):</p>
<ul>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-adlm-1/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rplp-1/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):</p>
<ul>
<li>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-adln-1/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hdp@hdmi-hpd-fast} (NEW):</p>
<ul>
<li>{bat-dg1-7}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-dg1-7/igt@kms_chamelium_hdp@hdmi-hpd-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hdp@vga-hpd-fast} (NEW):</p>
<ul>
<li>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-adlp-6/igt@kms_chamelium_hdp@vga-hpd-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):</p>
<ul>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-rkl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12456 and IGTPW_8177:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hdp@dp-hpd-fast:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hdp@hdmi-hpd-fast:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hdp@vga-hpd-fast:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8177 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@dp-edid-read} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-ilk-650/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@hdmi-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-glk-dsi/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@vga-edid-read} (NEW):</p>
<ul>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-kbl-2/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-bdw-gvtdvm/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-bsw-kefka/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-kbl-x1275/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-hsw-4770/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +20 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-kbl-8809g/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-ivb-3770/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-elk-e7500/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hdp@dp-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-apl-guc/igt@kms_chamelium_hdp@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-pnv-d510/igt@kms_chamelium_hdp@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hdp@hdmi-hpd-fast} (NEW):</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-skl-6700k2/igt@kms_chamelium_hdp@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hdp@vga-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-cfl-8700k/igt@kms_chamelium_hdp@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-blb-e6850/igt@kms_chamelium_hdp@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-snb-2600/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-skl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-kbl-7567u/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7073">i915#7073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-2/igt@fbdev@read.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></p>
</li>
<li>
<p>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/bat-rpls-2/igt@gem_exec_gttfill@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6434">i915#6434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-2/igt@gem_exec_gttfill@basic.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/bat-rpls-2/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-2/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7122">i915#7122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12456/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7076 -&gt; IGTPW_8177</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12456: 7a3c5315507ed0f4a9b0aa07ce6df1b3d28ebc35 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8177: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8177/index.html<br />
  IGT_7076: 888725538e0d6bbb94bbbb1ac278d4afcbbbdad0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 71 lines<br />
--- 71 lines</p>

</body>
</html>

--===============8859522870989030423==--
