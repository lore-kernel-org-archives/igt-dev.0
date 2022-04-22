Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8424824574162621306=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Fri, 22 Apr 2022 13:43:46 -0000
Message-ID: <165063502691.14006.14737112403229194952@emeril.freedesktop.org>
References: <20220422075223.2792586-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220422075223.2792586-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIE5l?=
 =?utf-8?q?gative_tests_to_VRR_=28rev5=29?=
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

--===============8424824574162621306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add Negative tests to VRR (rev5)
URL   : https://patchwork.freedesktop.org/series/100539/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11540 -> IGTPW_6978
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/index.html

Participating hosts (44 -> 44)
------------------------------

  Additional (2): fi-kbl-soraka fi-kbl-guc 
  Missing    (2): bat-rpls-2 fi-bsw-cyan 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6978:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_vrr@negative-basic@pipe-a-dp-3} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-tgl-1115g4/igt@kms_vrr@negative-basic@pipe-a-dp-3.html

  * {igt@kms_vrr@negative-basic@pipe-a-edp-1} (NEW):
    - {fi-ehl-2}:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-ehl-2/igt@kms_vrr@negative-basic@pipe-a-edp-1.html
    - {bat-jsl-1}:        NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-jsl-1/igt@kms_vrr@negative-basic@pipe-a-edp-1.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-jsl-1/igt@kms_vrr@negative-basic@pipe-a-edp-1.html
    - {bat-jsl-2}:        NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-jsl-2/igt@kms_vrr@negative-basic@pipe-a-edp-1.html
    - {bat-adlp-6}:       NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-adlp-6/igt@kms_vrr@negative-basic@pipe-a-edp-1.html

  * {igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-tgl-dsi/igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - {bat-adlm-1}:       [PASS][8] -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * {igt@kms_vrr@negative-basic}:
    - {bat-dg2-8}:        NOTRUN -> [SKIP][10] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg2-8/igt@kms_vrr@negative-basic.html
    - bat-dg1-6:          NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg1-6/igt@kms_vrr@negative-basic.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-adl-ddr5/igt@kms_vrr@negative-basic.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-rkl-guc/igt@kms_vrr@negative-basic.html
    - {bat-dg2-9}:        NOTRUN -> [SKIP][14] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg2-9/igt@kms_vrr@negative-basic.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-tgl-dsi/igt@kms_vrr@negative-basic.html
    - {bat-adlm-1}:       NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-adlm-1/igt@kms_vrr@negative-basic.html
    - bat-dg1-5:          NOTRUN -> [SKIP][17] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg1-5/igt@kms_vrr@negative-basic.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11540 and IGTPW_6978:

### New IGT tests (13) ###

  * igt@kms_vrr@negative-basic@pipe-a-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.27] s

  * igt@kms_vrr@negative-basic@pipe-a-dp-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.19] s

  * igt@kms_vrr@negative-basic@pipe-a-edp-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.06, 0.11] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-dp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.20] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-dp-2:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-edp-1:
    - Statuses : 1 dmesg-warn(s) 6 pass(s)
    - Exec time: [0.32, 0.50] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.18] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.04, 0.23] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@parse-vrr-range@pipe-a-vga-1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@parse-vrr-range@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  

Known issues
------------

  Here are the changes found in IGTPW_6978 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-guc:         NOTRUN -> [SKIP][18] ([fdo#109271]) +18 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-guc/igt@gem_exec_fence@basic-busy@bcs0.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][19] ([fdo#109271]) +9 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-ilk-650:         [PASS][20] -> [DMESG-WARN][21] ([i915#164])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/fi-ilk-650/igt@gem_exec_suspend@basic-s3@smem.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-ilk-650/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#2190])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4613]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][24] ([i915#1886])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [PASS][25] -> [DMESG-FAIL][26] ([i915#4494] / [i915#4957])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  * igt@kms_busy@basic:
    - fi-kbl-guc:         NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#1845])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-guc/igt@kms_busy@basic.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][28] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@vga-hpd-fast:
    - fi-kbl-guc:         NOTRUN -> [SKIP][29] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-guc/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       [PASS][30] -> [DMESG-FAIL][31] ([i915#62])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-cfl-8109u:       [PASS][32] -> [DMESG-WARN][33] ([i915#62]) +9 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - fi-cfl-8109u:       [PASS][34] -> [DMESG-WARN][35] ([i915#5341] / [i915#62])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#533])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * {igt@kms_vrr@parse-vrr-range@pipe-a-dp-2} (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][37] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-skl-guc/igt@kms_vrr@parse-vrr-range@pipe-a-dp-2.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][38] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-skl-6700k2/igt@kms_vrr@parse-vrr-range@pipe-a-dp-2.html

  * {igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1} (NEW):
    - fi-bxt-dsi:         NOTRUN -> [SKIP][39] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-bxt-dsi/igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1.html

  * {igt@kms_vrr@parse-vrr-range@pipe-a-edp-1} (NEW):
    - {bat-adlp-6}:       NOTRUN -> [DMESG-WARN][40] ([i915#3576])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-adlp-6/igt@kms_vrr@parse-vrr-range@pipe-a-edp-1.html

  * {igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1} (NEW):
    - fi-snb-2520m:       NOTRUN -> [SKIP][41] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-snb-2520m/igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1.html

  * {igt@kms_vrr@parse-vrr-range@pipe-a-vga-1} (NEW):
    - fi-hsw-g3258:       NOTRUN -> [SKIP][42] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-hsw-g3258/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html
    - fi-snb-2600:        NOTRUN -> [SKIP][43] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-snb-2600/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][44] ([fdo#109271])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-hsw-4770/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][45] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-ivb-3770/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html
    - fi-ilk-650:         NOTRUN -> [SKIP][46] ([fdo#109271])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-ilk-650/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][47] ([i915#4312])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-bdw-5557u:       [INCOMPLETE][48] ([i915#146]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_pm_rpm@module-reload:
    - {bat-adlp-6}:       [DMESG-WARN][50] ([i915#3576]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [DMESG-FAIL][52] ([i915#4494] / [i915#4957]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#164]: https://gitlab.freedesktop.org/drm/intel/issues/164
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5270]: https://gitlab.freedesktop.org/drm/intel/issues/5270
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5356]: https://gitlab.freedesktop.org/drm/intel/issues/5356
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6445 -> IGTPW_6978

  CI-20190529: 20190529
  CI_DRM_11540: fd3e6ac4b9117c9a7c8e30e5c9cf874c27eaf09c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6978: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/index.html
  IGT_6445: 8c2ac78f0d80a2af3c7b47dd2df064cdd07f24b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_vrr@negative-basic
+igt@kms_vrr@parse-vrr-range

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/index.html

--===============8424824574162621306==
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
<tr><td><b>Series:</b></td><td>Add Negative tests to VRR (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100539/">https://patchwork.freedesktop.org/series/100539/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11540 -&gt; IGTPW_6978</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/index.html</p>
<h2>Participating hosts (44 -&gt; 44)</h2>
<p>Additional (2): fi-kbl-soraka fi-kbl-guc <br />
  Missing    (2): bat-rpls-2 fi-bsw-cyan </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6978:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_vrr@negative-basic@pipe-a-dp-3} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-tgl-1115g4/igt@kms_vrr@negative-basic@pipe-a-dp-3.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@negative-basic@pipe-a-edp-1} (NEW):</p>
<ul>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-ehl-2/igt@kms_vrr@negative-basic@pipe-a-edp-1.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-jsl-1/igt@kms_vrr@negative-basic@pipe-a-edp-1.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-jsl-1/igt@kms_vrr@negative-basic@pipe-a-edp-1.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-jsl-2/igt@kms_vrr@negative-basic@pipe-a-edp-1.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-adlp-6/igt@kms_vrr@negative-basic@pipe-a-edp-1.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-tgl-dsi/igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@negative-basic}:</p>
<ul>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg2-8/igt@kms_vrr@negative-basic.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg1-6/igt@kms_vrr@negative-basic.html">SKIP</a></p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-adl-ddr5/igt@kms_vrr@negative-basic.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-rkl-guc/igt@kms_vrr@negative-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg2-9/igt@kms_vrr@negative-basic.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-tgl-dsi/igt@kms_vrr@negative-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-adlm-1/igt@kms_vrr@negative-basic.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg1-5/igt@kms_vrr@negative-basic.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11540 and IGTPW_6978:</p>
<h3>New IGT tests (13)</h3>
<ul>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.06, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 6 pass(s)</li>
<li>Exec time: [0.32, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.03, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.04, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@parse-vrr-range@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6978 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-guc/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/fi-ilk-650/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-ilk-650/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/164">i915#164</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-guc/igt@kms_busy@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-guc/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@parse-vrr-range@pipe-a-dp-2} (NEW):</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-skl-guc/igt@kms_vrr@parse-vrr-range@pipe-a-dp-2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-skl-6700k2/igt@kms_vrr@parse-vrr-range@pipe-a-dp-2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1} (NEW):</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-bxt-dsi/igt@kms_vrr@parse-vrr-range@pipe-a-dsi-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@parse-vrr-range@pipe-a-edp-1} (NEW):</p>
<ul>
<li>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-adlp-6/igt@kms_vrr@parse-vrr-range@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1} (NEW):</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-snb-2520m/igt@kms_vrr@parse-vrr-range@pipe-a-lvds-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@parse-vrr-range@pipe-a-vga-1} (NEW):</p>
<ul>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-hsw-g3258/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-snb-2600/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-hsw-4770/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-ivb-3770/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-ilk-650/igt@kms_vrr@parse-vrr-range@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11540/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6445 -&gt; IGTPW_6978</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11540: fd3e6ac4b9117c9a7c8e30e5c9cf874c27eaf09c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6978: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6978/index.html<br />
  IGT_6445: 8c2ac78f0d80a2af3c7b47dd2df064cdd07f24b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_vrr@negative-basic<br />
+igt@kms_vrr@parse-vrr-range</p>

</body>
</html>

--===============8424824574162621306==--
