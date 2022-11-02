Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0994301597995529999=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Wed, 02 Nov 2022 05:43:23 -0000
Message-ID: <166736780304.23604.13427681640023340606@emeril.freedesktop.org>
References: <20221102043814.3821683-1-riana.tauro@intel.com>
In-Reply-To: <20221102043814.3821683-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIGEg?=
 =?utf-8?q?basic_hwmon_testcase_=28rev2=29?=
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

--===============0994301597995529999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add a basic hwmon testcase (rev2)
URL   : https://patchwork.freedesktop.org/series/110311/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12330 -> IGTPW_8029
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/index.html

Participating hosts (38 -> 40)
------------------------------

  Additional (3): fi-icl-u2 fi-tgl-dsi fi-pnv-d510 
  Missing    (1): bat-adlp-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8029:

### IGT changes ###

#### Possible regressions ####

  * {igt@debugfs_test@basic-hwmon} (NEW):
    - {bat-rpls-2}:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-rpls-2/igt@debugfs_test@basic-hwmon.html
    - {fi-tgl-mst}:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-tgl-mst/igt@debugfs_test@basic-hwmon.html
    - fi-icl-u2:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@debugfs_test@basic-hwmon.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-rkl-guc/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-4:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-adlp-4/igt@debugfs_test@basic-hwmon.html
    - {bat-adlm-1}:       NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-adlm-1/igt@debugfs_test@basic-hwmon.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-jsl-1/igt@debugfs_test@basic-hwmon.html
    - {bat-rpls-1}:       NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-rpls-1/igt@debugfs_test@basic-hwmon.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-tgl-dsi/igt@debugfs_test@basic-hwmon.html
    - {bat-rplp-1}:       NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
    - {bat-adln-1}:       NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-adln-1/igt@debugfs_test@basic-hwmon.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-adl-ddr5/igt@debugfs_test@basic-hwmon.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-ehl-2/igt@debugfs_test@basic-hwmon.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-rte:
    - {bat-adln-1}:       [PASS][15] -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12330/bat-adln-1/igt@i915_pm_rpm@basic-rte.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-adln-1/igt@i915_pm_rpm@basic-rte.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12330 and IGTPW_8029:

### New IGT tests (1) ###

  * igt@debugfs_test@basic-hwmon:
    - Statuses : 3 pass(s) 37 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_8029 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@debugfs_test@basic-hwmon} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][17] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-cfl-8700k/igt@debugfs_test@basic-hwmon.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][18] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-blb-e6850/igt@debugfs_test@basic-hwmon.html
    - fi-apl-guc:         NOTRUN -> [SKIP][19] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-apl-guc/igt@debugfs_test@basic-hwmon.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][20] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-bdw-gvtdvm/igt@debugfs_test@basic-hwmon.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][21] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-bsw-kefka/igt@debugfs_test@basic-hwmon.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][22] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-snb-2520m/igt@debugfs_test@basic-hwmon.html
    - fi-skl-guc:         NOTRUN -> [SKIP][23] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-skl-guc/igt@debugfs_test@basic-hwmon.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][24] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-hsw-4770/igt@debugfs_test@basic-hwmon.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][25] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-ivb-3770/igt@debugfs_test@basic-hwmon.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][26] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-elk-e7500/igt@debugfs_test@basic-hwmon.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][27] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-bsw-nick/igt@debugfs_test@basic-hwmon.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][28] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-hsw-g3258/igt@debugfs_test@basic-hwmon.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][29] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-glk-j4005/igt@debugfs_test@basic-hwmon.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][30] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-bxt-dsi/igt@debugfs_test@basic-hwmon.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][31] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-skl-6700k2/igt@debugfs_test@basic-hwmon.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][32] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-cfl-8109u/igt@debugfs_test@basic-hwmon.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][33] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-kbl-7567u/igt@debugfs_test@basic-hwmon.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][34] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-kbl-8809g/igt@debugfs_test@basic-hwmon.html
    - fi-ilk-650:         NOTRUN -> [SKIP][35] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-ilk-650/igt@debugfs_test@basic-hwmon.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][36] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-cfl-guc/igt@debugfs_test@basic-hwmon.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][37] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-skl-6600u/igt@debugfs_test@basic-hwmon.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][38] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-bdw-5557u/igt@debugfs_test@basic-hwmon.html

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        NOTRUN -> [FAIL][39] ([i915#7229])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - fi-icl-u2:          NOTRUN -> [SKIP][40] ([i915#2190])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-icl-u2:          NOTRUN -> [DMESG-WARN][41] ([i915#4890])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          NOTRUN -> [SKIP][43] ([fdo#111827]) +7 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-icl-u2:          NOTRUN -> [SKIP][44] ([i915#4103])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-icl-u2:          NOTRUN -> [SKIP][45] ([fdo#109285])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][46] ([fdo#109271]) +44 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-icl-u2:          NOTRUN -> [SKIP][47] ([i915#3555])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@runner@aborted:
    - fi-icl-u2:          NOTRUN -> [FAIL][48] ([i915#4312])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {bat-adlm-1}:       [DMESG-WARN][49] ([i915#2867]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12330/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ctx_create@basic-files:
    - {fi-tgl-mst}:       [DMESG-WARN][51] ([i915#6434]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12330/fi-tgl-mst/igt@gem_ctx_create@basic-files.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-tgl-mst/igt@gem_ctx_create@basic-files.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-rplp-1}:       [DMESG-WARN][53] ([i915#2867]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12330/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][55] ([i915#4785]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12330/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4890]: https://gitlab.freedesktop.org/drm/intel/issues/4890
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6856]: https://gitlab.freedesktop.org/drm/intel/issues/6856
  [i915#7029]: https://gitlab.freedesktop.org/drm/intel/issues/7029
  [i915#7125]: https://gitlab.freedesktop.org/drm/intel/issues/7125
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7037 -> IGTPW_8029

  CI-20190529: 20190529
  CI_DRM_12330: b4169c84bf30172f83c6d365a927dcea0cd7a2ab @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8029: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/index.html
  IGT_7037: 6a25c53624502fc85cec3cf0a0bf244a2346e30f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 61 lines
--- 360 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/index.html

--===============0994301597995529999==
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
<tr><td><b>Series:</b></td><td>Add a basic hwmon testcase (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110311/">https://patchwork.freedesktop.org/series/110311/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12330 -&gt; IGTPW_8029</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/index.html</p>
<h2>Participating hosts (38 -&gt; 40)</h2>
<p>Additional (3): fi-icl-u2 fi-tgl-dsi fi-pnv-d510 <br />
  Missing    (1): bat-adlp-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8029:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@debugfs_test@basic-hwmon} (NEW):</p>
<ul>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-rpls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-mst}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-tgl-mst/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-rkl-guc/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-adlp-4/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-rpls-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-tgl-dsi/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-rplp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-adln-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-adl-ddr5/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-ehl-2/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rpm@basic-rte:<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12330/bat-adln-1/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-adln-1/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12330 and IGTPW_8029:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@debugfs_test@basic-hwmon:<ul>
<li>Statuses : 3 pass(s) 37 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8029 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@debugfs_test@basic-hwmon} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-cfl-8700k/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-blb-e6850/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-apl-guc/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-bdw-gvtdvm/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-bsw-kefka/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-snb-2520m/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-skl-guc/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-hsw-4770/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-ivb-3770/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-elk-e7500/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-bsw-nick/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-hsw-g3258/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-glk-j4005/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-bxt-dsi/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-skl-6700k2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-cfl-8109u/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-kbl-7567u/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-kbl-8809g/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-ilk-650/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-cfl-guc/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-skl-6600u/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-bdw-5557u/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4890">i915#4890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12330/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@basic-files:</p>
<ul>
<li>{fi-tgl-mst}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12330/fi-tgl-mst/igt@gem_ctx_create@basic-files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6434">i915#6434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-tgl-mst/igt@gem_ctx_create@basic-files.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12330/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12330/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7037 -&gt; IGTPW_8029</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12330: b4169c84bf30172f83c6d365a927dcea0cd7a2ab @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8029: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8029/index.html<br />
  IGT_7037: 6a25c53624502fc85cec3cf0a0bf244a2346e30f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 61 lines<br />
--- 360 lines</p>

</body>
</html>

--===============0994301597995529999==--
